# Mojolicious::Plugin::Multichain

This is a fork of the orginal Bitcoin JSON-RPC client for Mojolicious.  

https://github.com/bitnoize/mojolicious-plugin-bitcoin

This fork is to work with multichain and has been updated to support the multichain functions that very with bitcoin.

### Futures

* Non-blocking / blocking access to multichaind.
* Separate module for stand-alone use: MojoX::Multichain.

### Build Debian package

```
$ sudo apt-get install build-essential devscripts
$ dpkg-buildpackage -us -uc -b
$ dpkg -i ../libmojolicious-plugin-bitcoin-perl*.deb
```

### Non-blocking usage example via Lite app

```
use Mojolicious::Lite;

plugin 'Multichain' => { url => "wallet:secret\@localhost:8332" };

get '/' => sub {
  my $c = shift->render_later;

  $c->delay(
    sub {
      my ( $delay ) = @_;

      $c->app->multichain->getinfo( [ ] => $delay->begin );
    },

    sub {
      my ( $delay, $err, $rpc ) = @_;

      die "getinfo failed: $err" if $err;
      die "getinfo error:  $rpc->{error}" if $rpc->{error};

      $c->render( json => $rpc->{result} );
    }
  );
};

app->start;
```

### Blocking usage example via standalone script

```
use Mojo::Base -base;

use MojoX::Multichain;
use Data::Dumper;

my $bitcoin = MojoX::Multichain->new( url => "wallet:secret\@localhost:8332" );
my $rpc = $multichain->getinfo( [ ] );

say Dumper $rpc->{result};
```
