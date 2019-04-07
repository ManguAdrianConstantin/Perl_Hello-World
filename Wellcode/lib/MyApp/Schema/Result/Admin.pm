package MyApp::Schema::Result::Admin;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('admin');
__PACKAGE__->add_columns(

	acc_id => {
		data_type => 'integer',
		is_auto_increment => 1,
	},

	acc_type => {
		data_type => 'text',
	},

	description => {
		data_type => 'text',
	},

	username => {
		data_type => 'text',
	},

	user_id => {
		data_type => 'text',
	},
);
__PACKAGE__->set_primary_key('acc_id');

1; 
