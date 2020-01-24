#!/bin/sh
find -type f \( -name *.c -o -name *.h -name *.cpp -name *.java \) > cscope.file
cscope -b -i cscope.file
ctags -R
