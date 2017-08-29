#!/usr/bin/perl -w

use strict;
use warnings;
use lib('Utils');
use CGI;

use Data::Dumper;

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use vars qw(%in);


use Utils::File;
use Utils::Parser;
use Utils::DbHash;
 my  $q = new CGI;
 #print "Location: some \n\n";
 print $q->redirect(-url =>'http://google.com');
print "Content-type: text/html; charset=utf-8\n\n";

#print "hello";

print '<pre>' . Dumper(\%ENV).'<pre>';

$|=1; # отключаем буферизацию ввода данных;
ReadParse(); # получает данные из HTML формы в  хэш %in
print '<pre>' . Dumper(\%in).'<pre>';



my $fileReader = Utils::File->new();
my @file = $fileReader->readFile('plasceHolders.txt');


my $fileHtml = $fileReader->readFile('file.html');


my $db = Utils::DbHash->new();
my $dbh = $db->dbConnect();
my $langs = $db->makeHash($dbh);


my $parser = Utils::Parser->new();

my $result = $parser->parser($fileHtml,$langs);

print $result;

my            $query = $ENV{QUERY_STRING};

if($query)
{
print 'hello';
}else

{
   my  $q = new CGI;
#print "Location: some \n\n";
print $q->redirect(-url =>'http://google.com');
}



