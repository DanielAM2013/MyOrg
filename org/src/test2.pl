use chilkat;
use strict;

$rest = chilkat::CkRest->new();

#   Provide a previously obtained OAuth2 access token.
$oauth2 = chilkat::CkOAuth2->new();
$oauth2->put_AccessToken("AIzaSyB1KgpUjcKxHkPL_14FYco7DhYzNNTSwYg");
$rest->SetAuthOAuth2($oauth2);

$success = $rest->Connect("www.googleapis.com",443,1,1);
if ($success != 1) {
    print $rest->lastErrorText() . "\r\n";
    exit;
}
