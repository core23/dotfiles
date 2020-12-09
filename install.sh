#!/bin/bash

echo 'You are about to install the dot-files and other cool stuff.'
read -p 'Continue? ' -n 1 -r
echo #
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi


backup() {
    ./backup.sh
}

install() {
    echo "Installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "Installing brew modules"
    echo #
    (cd brew; install.sh)

    echo "Installing gem modules"
    echo #
    (cd gem; install.sh)

    # oh-my-zsh
    echo "oh-my-zsh"
    wget -O - https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh - && $0
    wget -O ~/.oh-my-zsh/themes/powerline.zsh-theme https://raw.githubusercontent.com/jeremyFreeAgent/oh-my-zsh-powerline-theme/master/powerline.zsh-theme
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

    # git tools
    echo "Installing git tools"
    echo #
    wget -O - https://raw.github.com/jamiew/git-friendly/master/install.sh | sh - && $0

    # Symfony CLI
    echo "Symfony CLI"
    echo #
    wget -O - https://get.symfony.com/cli/installer | bash
}


symlink() {
    ./create-symlinks.sh
}

backup
install
symlink
