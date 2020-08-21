package Common::Types::User;

use strictures 2;
use Type::Library -base;
use Type::Utils qw( extends );

BEGIN { extends("Types::Standard") }

# type definition table
my %CODE_REF = (
    UserName => sub { $_ =~ m/.*/ },
    UserID   => sub { length($_) > 0 },
);

__PACKAGE__->add_type(
    Type::Tiny->new(
        name       => $_,
        parent     => Str,
        constraint => $CODE_REF{$_},
        message    => sub {
            sprintf "%s is not a $_", Type::Tiny::_dd($_);
        },
    )
) for keys %CODE_REF;

__PACKAGE__->make_immutable;

1;

__END__

=head1 DESCRIPTION

Common Types for Common::User

=head1 SYNOPSYS

=cut

