#!/bin/zsh

# Renames a `target` file to `target.backup` if the file
# exists and if it's not a symlink
backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

# Creates a Symlink to a file
# if symlink already exists, removes it first
symlink() {
  file=$1
  link=$2

  if [ -L "$link" ]; then
    echo "-----> Removing previous Symlink $link"
    rm  $link
  fi

  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
  fi


}

# For all files `$name` in the present folder except `*.sh`, `README.md`, `settings.json`,
# and `config`, backup the target file located at `~/.$name` and symlink `$name` to `~/.$name`
for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    if [[ ! "$name" =~ '\.sh$' ]] && [ "$name" != 'README.md' ] && [[ "$name" != 'settings.json' ]] && [[ "$name" != 'config' ]]; then
      backup $target
      symlink $PWD/$name $target
    fi
  fi
done

# Symlink VS Code settings to the present `settings.json` file
# If it's a macOS
if [[ `uname` =~ "Darwin" ]]; then
  CODE_PATH=~/Library/Application\ Support/Code/User
# Else, it's a Linux
else
  CODE_PATH=~/.config/Code/User
  # If this folder doesn't exist, it's a WSL
  if [ ! -e $CODE_PATH ]; then
    CODE_PATH=~/.vscode-server/data/Machine
  fi
fi
target="$CODE_PATH/settings.json"
backup $target
symlink $PWD/settings.json $target

# Symlink SSH config file to the present `config` file for macOS and add SSH
# passphrase to the keychain
if [[ `uname` =~ "Darwin" ]]; then
  target=~/.ssh/config
  backup $target
  symlink $PWD/config $target
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
fi

# Refresh the current terminal with the newly installed configuration
zsh ~/.zshrc
