#!/bin/bash
BACKUP_DIR=~/migration

echo 'Do you want a backup of your old files?'
read -p 'Continue? ' -n 1 -r
echo #
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo 'Creating backup'
echo #

mkdir -p $BACKUP_DIR/home

# brew
if hash brew 2>/dev/null; then
    brew leaves > $BACKUP_DIR/home/brew-list.txt
fi

# npm
if hash npm 2>/dev/null; then
    npm list -g --depth=0 > $BACKUP_DIR/home/npm-g-list.txt
fi

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
