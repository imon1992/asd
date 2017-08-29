package Utils::Parser;

use strict;
use warnings;

sub parser;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}


sub parser
{
   my($self,$html,$langs) = @_; 
    #my $fileTxt = 'plasceHolders.txt';
    #my @langs = readFile($fileTxt);

    #my $fileHtml = 'file.html';

    #my $html = readFile($fileHtml);

    #my $langs = makeHash(@langs);

    $html =~ s/(LANG_\w+)/$langs->{$1}/gse;
    return $html;
}

1;
