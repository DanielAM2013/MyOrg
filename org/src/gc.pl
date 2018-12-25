#!/usr/public/bin/perl -w

use strict;
use JSON;
use JSON::WebToken;
use LWP::UserAgent;
use HTML::Entities;


my $private_key_string = q[-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCYMJFrWdIwwt7a\nGmDkxq+AMIp7TFc/ACTYVRXi334ro3qzOsQGNJmFzj1CPXKmwB56v+HVAyTrcwW4\n2gFk87TTfuT9kKpVg97qgmtSvMnq9iAOrhby4KRDWqkczpRjbZ7yftxzZ0Y+Pluk\nbH+lFaHmVMySm4gFt0uFNe0bCD9IlvktKqM06zhAmP7b8iHmZuMim5T6dbiW2qzY\nKTYcBj++2CO/1l3h3/N9vGNK4kFmt7mZskNUHgRGHO1me0hwZMuu7tZFtPLqJq0B\nNCxfgQ7VbdMpo3F6rsWft0g44CWD/cqx9nj6AMlaX0Bd3JtvOdf3xhY/r+CrPZRK\n6Pu4aBZpAgMBAAECggEACGnO8DdT9lwfg8EnkB4nv5dvYGeU/yeb4dW6UwN17yWn\nd9cM1Sb9QbdoDYxmFS/Tv4dyDZuR4+5E57Ytk44hdfuy3w2rTPTwUtiI5FcJdpLK\nrOUU4bJngk21waDt9R0vR0qaF0sjR/eci1dwKwkqHRidApHUkDRU2XVkuTTYgsO4\nArEsCFDL/rJQCOYS9PRfVnevApvhbkNDFI6WPFoXkvpuN5o04PYvwBiT0R2NFgWv\n9DHe7AQmvR0gSAQi8XQxLUYqmUgBeyHnsyWvxaRpHcM7MGXRLLakbEMMa5cRJ2w0\nV1cygZrTrTBdhUnuezdR3+R/Msc38WsNjRl5qOXLgQKBgQDPmlZ/Q9jDyd4VkrP+\n+TkbUFvgTst01rVNgwoOrcaHl68uwp9NmbfaPLONqnmDZWje6cHygEdRlUHDjlqJ\n9NxfZII99ykxxRcLujVXQwqqcnEhNFiRsiQHVvmIzpyr/nX+2R4RTaV3Psy8JHnP\nh+CqiZWfg95r6gwELe55t5ks8QKBgQC7qzGAVICXZ8yYXafaf4/6ElXuBoqJINSD\nc8+/SFomuvrNatlVunq4XBLx6YQSwZbJmJARqm1KhQ6BT5V6CtI3wfTD30jtXjKM\nN5B3vxuuo0NJnrvjodVZq+oAzQLo6tTC58mBsKS3XKWdeV8jcMujxTc9nwe+De4n\n4SDAcKFg+QKBgEz4Id2pX/KnI2nILGf6KswPrSCq1hAJksqcLNxoXVTkThT+H2X7\n+gg1vTRm4gpvTMRo0nmASfDbb7h7TOIdIJ9VelxTCLjlI7g7X49s0cWEDKGM8NGD\nxIvcGUQ5pii2fTTxdo5fxVtCs1GGDIt/CzLvM8QidhJ4geACz4ndIjNhAoGABoaq\nfwLxQdKbO8Ut/BwpfpG6qT9S+/fHTBbv53/1mpkv9Yq8qg2FDPousnjjXd+bhcEn\naWXazReZbIe+8/KCYuv8vf76wz5eVZ/tByz/InCM+3dooz7Sc37V8VcvvbfE1E5J\nJJhm8fVn0PUSiOH4QuatyBfKpiJH4N0kTWzdP8kCgYANYBiFtAPrBPLU+zFk8Ewk\nLGCqYnzDz1illt7mDOg+s/5ab5uc1dn+mWklJUWnD9nYQVTp72gzDRnWJ03zYQ02\nAmL7x0ixChR17KrKHRp7m3InZfTWNImAf8TS5lEMntrzWNYT40LSrH8ipYctciQu\nrT+BHsnykrJsVdnU7VR+oQ==\n-----END PRIVATE KEY-----\n];

my $time = time;

# https://developers.google.com/accounts/docs/OAuth2ServiceAccount
my $jwt = JSON::WebToken->encode({
                                  # your service account id here
                                  iss => 'dat2018am@myscheduler-216514.iam.gserviceaccount.com',
                                  scope => 'https://www.googleapis.com/auth/admin.directory.user',
                                  aud => 'https://accounts.google.com/o/oauth2/token',
                                  exp => $time + 3600,
                                  iat => $time,
                                  # To access the google admin sdk with a service account
                                  # the service account must act on behalf of an account
                                  # that has admin privileges on the domain
                                  # Otherwise the token will be returned but API calls
                                  # will generate a 403
                                  prn =>  'admin@your-domain.com',
                                 }, $private_key_string, 'RS256', {typ => 'JWT'}
                                );

# Now post it to google
my $ua = LWP::UserAgent->new();
my $response = $ua->post('https://accounts.google.com/o/oauth2/token',
                         {grant_type => encode_entities('urn:ietf:params:oauth:grant-type:jwt-bearer'),
                          assertion => $jwt});

unless($response->is_success()) {
    die($response->code, "\n", $response->content, "\n");
}

my $data = decode_json($response->content);

# The token is added to the HTTP authentication header as a bearer
my $api_ua = LWP::UserAgent->new();
$api_ua->default_header(Authorization => 'Bearer ' . $data->{access_token});

# get the details for a user
my $api_response = $api_ua->get('https://www.googleapis.com/oauth2/v3/token' .encode_entities('dat2018am@myscheduler-216514.iam.gserviceaccount.com'));

if($api_response->is_success) {
    my $api_data = decode_json($api_response->content);
    use Data::Dumper;
    print Dumper($api_data);
} else {
    print "Error:\n";
    print "Code was ", $api_response->code, "\n";
    print "Msg: ", $api_response->message, "\n";
    print $api_response->content, "\n";
    die;
}
