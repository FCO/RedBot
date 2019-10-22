#!/bin/sh
echo "use Red <red-do>; red-defaults(default => database('SQLite', :database<red.db>)); use lib './samples'; " > ./code.p6
echo $* >> ./code.p6

perl6 ./code.p6 2>&1
