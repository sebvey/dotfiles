## INTERACTIVE SHELL OPTIONS

ZSH=$HOME/.oh-my-zsh

# ZSH THEME
ZSH_THEME="af-magic" # default : "robbyrussell"

# Useful oh-my-zsh plugins
plugins=(pyenv git gitfast last-working-dir pip \
  common-aliases zsh-syntax-highlighting history-substring-search \
  ssh-agent gcloud kubectl terraform direnv npm docker aws)

# ssh-agent : loads multiple identities
zstyle :omz:plugins:ssh-agent identities id_ed25519 id_ed25519_sebvey

# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load pyenv (to manage your Python versions)
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Loads aliases from the ~/.aliases file
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export BUNDLER_EDITOR=code

# MacOS Specific
if [[ "$OSTYPE" == "darwin"* ]] then

  # Prevent Homebrew from reporting
  # https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
  export HOMEBREW_NO_ANALYTICS=1

fi

# Enable VIM Mode
bindkey -v
