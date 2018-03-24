package Mojolicious::Plugin::Multichain;
use Mojo::Base 'Mojolicious::Plugin';

use MojoX::Multichain;

our $VERSION = '0.01';

sub register {
  my ( $plugin, $app, $conf ) = @_;

  my $bitcoin = MojoX::Multichain->new(
    map { $_ => $conf->{ $_ } } grep { exists $conf->{ $_ } } qw/url account/
  );

  $app->attr( multichain => sub { $multichain } );
}


1;
