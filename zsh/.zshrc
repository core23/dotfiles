DEFAULT_USER="gripp"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git symfony2 npm gulp grunt)

# User configuration
if [[ -f $ZSH/oh-my-zsh.sh ]]; then
    source $ZSH/oh-my-zsh.sh
fi

# You may need to manually set your language environment
export LANG=de_DE.UTF-8

# Autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Home / End key fix
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# Numpad Enter key fix
bindkey -s "^[OM" "^M"

# Load default dotfiles
source ~/.bash_profile
