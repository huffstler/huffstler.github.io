#!/usr/bin/bash

rm ./srv/*

find ./src/*.md -type f | grep -Eo "([a-zA-Z\-]*.md)$" | sed "s/.md//" | xargs -I % pandoc --template ./src/template.html -o ./srv/%.html ./src/%.md

# Later on will update the index.html as well. Somehow
