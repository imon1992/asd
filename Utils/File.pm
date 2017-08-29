package Utils::File;

use strict;
use warnings;
#use lib('Utils');
sub readFile;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub readFile
{
     my ($self,$fileName) = @_;
     my @data = ();
     open my $fh,"< $fileName";
     binmode($fh);
     while(<$fh>)
     {
         chomp($_);
         push @data,$_;
     }
     close $fh;
     return join("\n",@data) unless(wantarray);

     return @data;
}

1;
