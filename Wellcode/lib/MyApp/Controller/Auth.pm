package MyApp::Controller::Auth;
use Mojo::Base 'Mojolicious::Controller';
use MyApp::Schema; 
my $wrongUser;
my $schema = MyApp::Schema->connectDB(); 
my $users = $schema->resultset('Users'); 
sub register
{
	my $self = shift;

	my $username = $self->param('username');
	my $password = $self->param('password');
	chomp $username;
	chomp $password; 
	if($username =~ /^[a-zA-Z][a-zA-Z0-9_]*$/ and $password =~ /(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{6,}$/)
	{
		$users->create({ username => $username, password => $password });
		$self->redirect_to('login_form');
	}
	else
	{
		$self->stash(wrongUser => 'Wrong');
	}
}

sub user_exists
{
	my ($username, $password) = @_;
	chomp $username;
	chomp $password;

	my $check = $users->search({username => $username, password => $password})->count;
	if($check == 1) 
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

sub login
{
	my $self = shift;

	#Grab username and password
	my $username = $self->param('username');
	my $password = $self->param('password');

	if(user_exists($username, $password))
	{
		$self->session(logged_in => 1);
		$self->session(username => $username);

		$self->redirect_to('restricted_area');
	}
	else
	{
		$self->stash(wrongUser => 'Wrong');
	}
}

sub logout
{
	my $self = shift;

	$self->session(expires => 1);
	return $self->redirect_to('/');
}

sub is_logged_in
{
	my $self = shift;
	return 1 if($self->session('logged_in'));

	$self->redirect_to('login_form');
}

1;