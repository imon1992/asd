package Utils::DbHash;

use strict;
use warnings;
use DBI;
#sub makeHash;



sub new
{
  my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub dbConnect
{
  #  DBI:mysql:database=DATABASENAME;host=HOSTNAME
    my $dbh = DBI->connect('DBI:mysql:database=user14;host=localhost','user14','tuser14');
    return $dbh; 
}


sub makeHash
{
    my ($self,$dbh,@data) = @_;
    my %lengs = ();
    my $sth = $dbh->prepare('SELECT * FROM perlHash');
    my $result = $sth->execute();
    
    while (my @row = $sth->fetchrow_array)
    {
        $lengs{$row[0]} = $row[1];
    }


#    my %lengs = ();
    # print %lengs;
 #    while(@data)
   #  {
  #      my $line = shift @data;
   #     my($key,$value) = split('==' ,$line);

    #    $lengs{$key} = $value if($key);
    # }
     return  \%lengs;
}

1;
