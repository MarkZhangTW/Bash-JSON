#!/usr/bin/env bash

user_bin="$HOME/bin"

if [ ! -d "$user_bin" ]; then
    mkdir "$user_bin"
fi

if [[ ! ":$PATH:" == *":$user_bin:"* ]]; then
    PATH="$user_bin:$PATH"
fi

script="bash-json.sh"
source_path="`pwd`/$script"

if [ ! -f "$source_path" ]; then
    echo "$source_path" don\'t exists!
fi

destination_path="$HOME/bin/bj"

if [ -f "$destination_path" ]; then
    echo "$destination_path" already exists!
else
    ln -s "$source_path" "$destination_path"
fi
