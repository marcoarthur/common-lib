use strict;
use Test::More;
use Test::Fatal;
use Common;

BEGIN { use_ok($_) for qw( Common::User ); }

like(
    exception {
        my $cu = Common::User->new();
    },
    qr/.*require.*/,
    "User requires name id"
);

isa_ok my $u = Common::User->new( name => "None", id => "none" ), "Common::User";
is_deeply $u->roles, ['regular'], "A regular user";

done_testing;
