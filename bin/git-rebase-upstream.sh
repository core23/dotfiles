#!/bin/bash

if [[ `git remote | grep upstream` ]]; then
    git fetch upstream && git rebase --interactive --autosquash upstream/master
fi
