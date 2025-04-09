#!/usr/bin/bash

# Regenerate each post every time
rm ./srv/*

find ./src/*.md -type f | grep -Eo "([a-zA-Z\-]*.md)$" | sed "s/.md//" | xargs -I % pandoc --template ./src/template.html -o ./srv/%.html ./src/%.md

# Update rss feed with new post.
# Thanks to https://github.com/maxhebditch/rss-roller
./bin/roller.sh --auto
