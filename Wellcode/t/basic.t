use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
#CMD ca sa rulezi un test: prove -lv t
my $t = Test::Mojo->new('MyApp');

$t->post_ok('/register' => form => {
	username => 'UserTest', password => 'UserTest122'
})->status_is(302);

done_testing();