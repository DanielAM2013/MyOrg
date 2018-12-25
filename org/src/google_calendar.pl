#!/usr/bin/perl
use strict;
use Net::Google::Calendar;

my $username="dat2018am";
my $password="AIzaSyB1KgpUjcKxHkPL_14FYco7DhYzNNTSwYg";

# this will get you a read-write feed.
my $cal = Net::Google::Calendar->new;
$cal->login($username, $password);

# use mysql? or google calendar (better)


my @calendars = $cal->get_calendars;


