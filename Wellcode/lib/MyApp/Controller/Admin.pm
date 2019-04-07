package MyApp::Controller::Admin;
use Mojo::Base 'Mojolicious::Controller';
use MyApp::Schema; 
my $schema = MyApp::Schema->connectDB(); 
my $admin = $schema->resultset('Admin');

sub add_account
{
	my $self = shift;

	my $username = $self->session('username');
	my $acc_username = $self->param('username_account');
	my $acc_type = $self->param('acc_type');
	my $desc = $self->param('description');

	$admin->create({
		acc_type => $acc_type,
		description => $desc,
		username => $acc_username,
		user_id => $username	
	});

	my @accounts = find_accounts($username);
	return $self->render('admin/overview', accounts => \@accounts);
}

sub find_accounts
{
	my $username = shift;
	return $admin->search({
		user_id => $username
	})->all;
}

sub show_accounts
{
	my $self = shift;
	my $username = $self->session('username');

	my @accounts = find_accounts($username);
	return $self->render('admin/overview', accounts => \@accounts);
}

sub delete_account
{
	my $self = shift;
	my $id = $self->param('id');
	$admin->find($id)->delete;

	my $username = $self->session('username');
	my @accounts = find_accounts($username);
	return $self->render('admin/overview', accounts => \@accounts);
}