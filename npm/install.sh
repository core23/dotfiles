#!/bin/bash

# Make sure we’re using the latest Homebrew
#npm update

# Upgrade any already-installed formulae
#npm upgrade

while read spec || [ -n "$spec" ]; do
    module=(${spec//:/ });
    [[ ${module[0]} =~ ^# ]] && continue
    [[ ${module[0]} =~ ^\s*$ ]] && continue

    echo "Downloading ${module[0]} ${module[1]}"
    if [[ -z ${module[1]} ]]; then
        npm install -g "${module[0]}"
    else
        npm install -g "${module[0]}@${module[1]}"
    fi
done  < "modules.txt"

exit 0
