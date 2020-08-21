use strict;
use Test::More;
use Test::Fatal;
use Common;

BEGIN { use_ok($_) for qw( Common::User ); }

like(
    exception {
        Common::User->new();
    },
    qr/.*require.*/,
    "Error: User requires name id"
);

like(
    exception { Common::User->new( name => "A", id => "B", roles => [qw(no one)] ) },
    qr/.requires.*(admin|root|regular)/,
    "Error: Trying to set a not defined role to a new user"
);

isa_ok my $u = Common::User->new( name => "None", id => "none" ), "Common::User";
is_deeply $u->roles, ['regular'], "A regular user";
can_ok( $u, qw(is_admin is_regular is_root) );
is $u->is_regular, 1,  "testing if is regular user";
is $u->is_admin,   '', "but not an admin";
is $u->is_root,    '', "but not root";

push $u->roles->@*, qw(root);    # add root
is $u->is_root, 1, "now became root";

done_testing;
