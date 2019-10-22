use v6.d;
unit class RedBot:ver<0.0.1>:auth<cpan:FCO>;

multi method irc-to-me($_) {
    my $p = run 'docker', 'run',
            '-v', "%*ENV<PWD>/red.db:/code/red.db",
            '--rm',
            'red-bot',
            .Str.substr(4).subst(/"␤"/, "\n", :g),
            :out
    ;
    $p.out.slurp.subst: /\n/,"␤", :g
}

# vim: ft=perl6 tabstop=4 shiftwidth=4
