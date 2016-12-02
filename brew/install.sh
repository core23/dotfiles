#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

while read module || [ -n "$module" ]; do
    [[ ${module} =~ ^# ]] && continue
    [[ ${module} =~ ^\s*$ ]] && continue

    echo "Downloading ${module}"
    brew install ${module}
done  < "modules.txt"

# Install java
brew cask install --appdir="~/Applications" java

# Remove outdated versions from the cellar
brew cleanup

exit 0
