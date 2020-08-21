package Common::Role::User;

use Moo::Role;
use Mojo::Base -strict, -signatures;
use Common::Types::User qw(:types);
use Sub::Install;
use List::Util qw(first);

my @attributes = qw( name id );
my %roles      = ( regular => 1, admin => 2, root => 3 );

requires @attributes;

has roles => (
    is      => 'ro',
    isa     => ArrayRef->of( Enum [ keys %roles ] ),
    default => sub { [qw(regular)] },
);

for my $role ( keys %roles ) {
    my $method = "is_$role";

    Sub::Install::install_sub(
        {
            code => sub ( $self ) {
                defined( first { $_ eq $role } @{ $self->roles } );
            },
            as => $method,
        }
    );
}

1;

__END__

=head1 DESCRIPTION

=head1 SYNOPSYS

=cut

