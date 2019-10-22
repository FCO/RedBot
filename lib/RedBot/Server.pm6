use Red;

unit model RedBot::Server is table<red_bot_server>;

has Str $.name     is id;
has Str $.nicks    is column{ :nullable };
has Str $.channels is column{ :nullable };
has Str $.host     is column{ :nullable }

method Hash(--> Hash()) {
    $!name => %(
        :$!host,
        :nicks($!nicks.split(" ")),
        :channels($!channels.split(" ")),
    )
}
