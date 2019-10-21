FROM        jjmerelo/alpine-perl6
WORKDIR     /code
ENV         PERL6LIB /code/samples
COPY        META6.json .
COPY        .red.json  .
COPY        run.sh     .
COPY        samples    ./samples
RUN         apk add gcc libc-dev libuuid sqlite-libs \
            && zef install "NativeLibs:ver<0.0.7>:auth<github:salortiz>" Config Config::Parser::json DBIish DB::Pg UUID Red --/test \
            && perl6 -e 'use Post; use Person;'
ENTRYPOINT  ["./run.sh"]
CMD         ["die 'No code passed'"]
