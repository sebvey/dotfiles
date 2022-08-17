Personal tools to setup a new MacOS/Linux machine.  
Inspired by [Le Wagon Data Setup](https://github.com/lewagon/data-setup).

# Oh my zsh
Simple script that installs Oh my Zsh and zsh-syntax-highlighting plugin (in custom).  

# Dotfiles
Will symlink a bunch of configuration files. Links will replace original file
(that will backuped)

How To :
- clone this repo in ~/code/ for example so all dotfiles will be in ~/code/dotfiles
- execute the dotfiles_setup.sh script

Includes :
- zprofile, zshrc, aliases -> my config/aliases for oh my zsh
- settings.json -> config for VSCode
- config (MacOS only) -> config for ssh (a host alias defined for personal gitlab, it will use a special ssh pair)
- gitconfig, gitconfig-sebvey, gitconfig-ippon -> git configuration with :
    - gitconfig-sebvey used when in ~/code/sebvey/ directory (and subs)
    - gitconfig-ippon used when in ~/code/ippon/ directory (and subs)

# Homebrew (MacOS Specific)
- Homebrew : uninstall native homebrew if needed :  
    ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"```

- Execute brew_setup.sh. It will install brew, repos from bre/Brewrepos and
  formulae from brew/Brewfile (including cask : Google Chrome, Docker, VS Code ...)

# Full Setup
Le Wagon Data Setup is great -> [Le Wagon Data Setup](https://github.com/lewagon/data-setup).  
Can be followed and adapted :
- MacOS : Use this brew script instead
- Dotfiles : Use this 
