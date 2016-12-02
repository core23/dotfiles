#!/bin/bash

echo 'You are about to install the dot-files and other cool stuff.'
read -p 'Continue? ' -n 1 -r
echo #
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi


backup() {
    BACKUP_DIR=~/migration

    echo 'Creating backup'
    echo #

    mkdir -p $BACKUP_DIR/home

    # modules
    brew leaves                > $BACKUP_DIR/home/brew-list.txt
    npm list -g --depth=0      > $BACKUP_DIR/home/npm-g-list.txt

    # configs
    declare -a BACKUP_FILES=(
        '.aliases'
        '.bash_profile'
        '.bash_prompt'
        '.bashrc'
        '.exports'
        '.extra'
        '.functions'

        '.zshrc'

        '.gitattributes'
        '.gitconfig'
        '.gitconfig.local'
        '.gitignore'
    )

    for file in "${BACKUP_FILES[@]}"; do
        cp ~/$file $BACKUP_DIR/home
    done

    # ssh / pgp keys
    cp -R ~/.ssh $BACKUP_DIR/home
    cp -R ~/.gnupg $BACKUP_DIR/home

    # sublime text settings
    mkdir -p $BACKUP_DIR/subl
    cp -R ~/Library/Application\ Support/Sublime\ Text\ 3/Packages $BACKUP_DIR/subl

    # wifi
    mkdir -p $BACKUP_DIR/osx
    cp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist $BACKUP_DIR/osx

    # bin
    mkdir -p $BACKUP_DIR/bin
    cp -R ~/bin $BACKUP_DIR/bin

    echo 'Backup finished'
    echo #
}


install() {
    echo "Installing brew modules"
    echo #
    (cd brew; install.sh)

    echo "Installing gem modules"
    echo #
    (cd gem; install.sh)

    echo "Installing npm modules"
    echo #
    (cd npm; install.sh)

    # oh-my-zsh
    echo "oh-my-zsh"
    wget -O - https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh - && $0
    wget -O ~/.oh-my-zsh/themes/powerline.zsh-theme https://raw.githubusercontent.com/jeremyFreeAgent/oh-my-zsh-powerline-theme/master/powerline.zsh-theme
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

    # git tools
    echo "Installing git tools"
    echo #
    wget -O - https://raw.github.com/jamiew/git-friendly/master/install.sh | sh - && $0

    # graph-composer
    wget -O - https://github.com/clue/graph-composer/releases/download/v1.0.0/graph-composer.phar
}


symlink() {
    ./create-symlinks.sh
}


backup
install
symlink
