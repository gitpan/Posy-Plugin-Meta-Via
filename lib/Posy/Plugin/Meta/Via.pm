package Posy::Plugin::Meta::Via;

#
# $Id: Via.pm,v 1.3 2005/03/04 03:39:10 blair Exp $
#

use 5.008001;
use strict;
use warnings;

=head1 NAME

Posy::Plugin::Meta::Via - Prepend via information contained in metadata.

=head1 VERSION

This document describes Posy::Plugin::Meta::Via version B<0.1>.

=cut

our $VERSION = '0.1';

=head1 SYNOPSIS

  @plugins = qw(
    Posy::Core
    ...
    Posy::Plugin::Meta
    Posy::Plugin::Meta::Via
  );
  @entry_actions = qw(header
    ...
    parse_entry
    parse_meta
    meta_via
    render_entry
    ...
  );

=head1 DESCRIPTION

This module prepends a via comment to the beginning of an entry's body
if via metadata is found.
  
=head1 INTERFACE

=head2 meta_via()

  $self->meta_via($flow_state, $current_entry, $entry_state)

Alters $current_entry->{body} by prepending a via attribution if 
C<$current_entry->{meta}{via}> is populated.

=cut
sub meta_via {
  my ($self, $flow_state, $current_entry, $entry_state) = @_;
  if  (
        defined $current_entry->{meta}      and 
        defined $current_entry->{meta}{via}
      ) 
  {
    $current_entry->{body} = 
      "<p>Via " . $current_entry->{meta}{via} . "</p>\n" .
      $current_entry->{body};
  }
  1;
} # meta_via()

=head1 SEE ALSO

L<Perl>, L<Posy>, L<Posy::Plugin::Meta>

=head1 AUTHOR

blair christensen., E<lt>blair@devclue.comE<gt>

<http://devclue.com/blog/code/posy/Posy::Plugin::Meta::Via/>

=head1 COPYRIGHT AND LICENSE

Copyright 2005 by blair christensen.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=head1 DISCLAIMER OF WARRANTY                                                                                               

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO
WARRANTY FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE
LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS
AND/OR OTHER PARTIES PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY
OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
OF THE SOFTWARE IS WITH YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE,
YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA
BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
OR A FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE),
EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY
OF SUCH DAMAGES.

=cut

1;

