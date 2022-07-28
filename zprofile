### LOGIN SHELLS OPTIONS
### (ALSO SOURCED FOR INTERACTIVE SHELLS, BEFORE .zshrc)

# Setup the PATH for pyenv binaries and shims ;-)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Loads pyenv / virtualenv
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
