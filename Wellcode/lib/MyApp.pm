package MyApp;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  # Normal route :)
  $r->get('/')->to('home#index');

  $r->get('/register')->to(template => 'auth/register');
  $r->post('/register')->name('on_register')->to('auth#register');
  $r->get('/login')->name('login_form')->to(template => 'auth/login');
  $r->post('/login')->name('on_login')->to('auth#login');
  $r->get('/logout')->name('on_logout')->to('auth#logout');

  # Partea de management a conturilor

  my $auth = $r->under('/admin')->to('auth#is_logged_in');
  $auth->get('/')->name('restricted_area')->to('admin#show_accounts');
  $auth->post('/')->name('add_account')->to('admin#add_account');
  $auth->get('/:id')->name('delete_account')->to('admin#delete_account');
}

1;
