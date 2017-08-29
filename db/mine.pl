#!/usr/bin/perl

use strict;
use Data::Dumper;
use lib('Utils');

use Utils::File;
use Utils::Parser;
use Utils::DbHash;


my $fileReader = Utils::File->new();
my @file = $fileReader->readFile('plasceHolders.txt');


my $fileHtml = $fileReader->readFile('file.html');


my $db = Utils::DbHash->new();
my $dbh = $db->dbConnect();
my $langs = $db->makeHash($dbh);


my $parser = Utils::Parser->new();

my $result = $parser->parser($fileHtml,$langs);

print Dumper($result);
