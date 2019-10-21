use v6.d;
use Net::IRC::CommandHandler;
use Net::IRC::TextUtil;
unit class RedBot:ver<0.0.1>:auth<cpan:FCO>;

multi method said( $_ ) {
    when .what.starts-with: "red: " { self.red: $_ }
}

multi method red ( $ev ) is cmd {
    my $p = run 'docker', 'run', '-v', "%*ENV<PWD>/red.db:/code/red.db", 'red-bot', $ev.what.substr(4), :out;
    $ev.msg: $p.out.slurp
}

# vim: ft=perl6 tabstop=4 shiftwidth=4
