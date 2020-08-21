package Common::User;

use Moo;
use Common::Types::User qw(:types);
use namespace::autoclean;

has name => ( 
    is => 'ro', 
    isa => UserName,
    required => 1,
);

has id => (
    is => 'ro',
    isa => UserID,
    required => 1,
);

with qw(Common::Role::User);

1;

__END__

=head1 DESCRIPTION

A common User, defining the basic structure from a common design

=head1 SYNOPSYS

=cut

