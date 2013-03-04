node default {

  import 'custom/**.pp'
  include baseline

  if $hostname =~ /java/ {
    include java7
  }

  if $hostname =~ /ruby/  {
    include baseline::lang::ruby
  }

  if $hostname =~ /nodejs/ {
    include baseline::lang::nodejs
  }

  if $hostname =~ /lua/ {
    include baseline::lang::lua
  }

  if $hostname =~ /clojure/ {
    include java7
    include baseline::lein
  }

  if $hostname =~ /python/ {
    include baseline::lang::python
  }

  if $hostname =~ /erlang/ {
    include baseline::lang::erlang
  }

  if $hostname =~ /haskell/ {
    include baseline::lang::haskell
  }

  if $hostname =~ /scala/ {
    include java7
    include baseline::lang::scala
  }

  if $hostname =~ /io/ {
    include baseline::lang::io
  }

  if $hostname =~ /prolog/ {
    include baseline::lang::prolog
  }

  if $hostname =~ /go/ {
    include baseline::lang::go
  }

  if $hostname =~ /elixir/ {
    include baseline::lang::erlang
    include baseline::lang::elixir
  }

  if $hostname =~ /redis/ {
    class { 'redis':
      version => '2.6.10',
    }
  }

  if $hostname =~ /mongo/ {
    class { 'mongodb':
      enable_10gen => true,
    }
  }

  if $hostname =~ /postgre/ {
    include baseline::postgre
  }

  if $hostname =~ /couchdb/ {
    class { 'baseline::lang::erlang': version => '1:15.b.3-2~ubuntu~precise' } -> class { 'baseline::couchdb': }
  }

  if $hostname !~ /nodots/ {
    include baseline::dotfiles
  }

}