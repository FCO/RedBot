#!/bin/sh
echo "use Red <red-do>; red-defaults-from-config; use lib './samples'; " > ./code.p6
echo $* >> ./code.p6

perl6 ./code.p6
