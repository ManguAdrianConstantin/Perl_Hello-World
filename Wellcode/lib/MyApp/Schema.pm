package MyApp::Schema;
use base qw/DBIx::Class::Schema/;
 
__PACKAGE__->load_namespaces();

sub connectDB {
	
	my $self = shift;

	my $pgHandle = $self->connection('dbi:Pg:dbname=postgres;host=127.0.0.1', 'postgres', 'secret', {'AutoCommit' => 1});
	$pgHandle->deploy();
	return $pgHandle;
}

1;