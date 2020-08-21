package Common::Role::User;

use strictures 2;
use Moo::Role;
use Common::Types::User qw(:types);

my @attributes = qw( name id );
my @roles      = qw( admin regular root );

requires @attributes;

has roles => (
    is      => 'ro',
    isa     => ArrayRef->of( Enum [@roles] ),
    default => sub { [qw(regular)] },
);

1;

__END__

=head1 DESCRIPTION

=head1 SYNOPSYS

=cut

