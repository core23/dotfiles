#!/bin/bash

# Make sure we’re using the latest gemrc
gem update

while read module || [ -n "$module" ]; do
    [[ ${module} =~ ^# ]] && continue
    [[ ${module} =~ ^\s*$ ]] && continue

    echo "Downloading ${module}"
    gem install ${module}
done  < "modules.txt"

exit 0
