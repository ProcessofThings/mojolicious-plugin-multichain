#!/usr/bin/env perl

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::Multichain',
  VERSION_FROM => 'lib/Mojolicious/Plugin/Multichain.pm',
  ABSTRACT     => 'Multichain JSON-RPC client for Mojolicious',
  LICENSE      => 'artistic_2',
  AUTHOR       => 'dexteruk',
  PREREQ_PM    => {
    'Mojolicious' => '5.54',
  },
  test         => { TESTS => 't/*.t' }
);
