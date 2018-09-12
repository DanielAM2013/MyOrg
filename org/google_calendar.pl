#!/usr/bin/perl
#
use Net::Google::Calendar;

my $username="daniel.antela.torquato@gmail.com"
my $password="";

# this will get you a read-write feed.
my $cal = Net::Google::Calendar->new;
$cal->login($username, $password);

# use mysql? or google calendar (better)




