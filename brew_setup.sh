#!/bin/bash

#  Install Brew and formulae in Brewfile
# (for MacOS configuration only)
# Thanks to Homebrew bundle (https://github.com/Homebrew/homebrew-bundle)

if [[ "$OSTYPE" == "darwin"* ]] then

    echo "--- MacOS detected, will proceed to Homebrew installation...\n"

    # Installs/updates brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update
    brew upgrade

    echo "-> Brew installed/updated."

    # Installs Brew repositories
    # (from ./brew/Brewrepos file, could be handled with Brewfile... saw it too late)
    echo "--- Will now add repos listed in ./brew/Brewrepos file to brew...\n"

    filter_regex='/^[[:blank:]]*$/d;/^[[:blank:]]*#/d;s/[[:blank:]]*#.*//'
    repos_file='./brew/Brewrepos'

    sed $filter_regex $repos_file | while read -r repo
    do
        echo "-> brew tap ${repo}..."
        brew tap $repo
    done

    echo "-> Brew repos configured\n"

    # Installs Brew formulae

    echo "--- Will now install formulae in ./brew/Brewfile...\n"
    brew bundle --file './brew/Brewfile'

    # Removes ''./brew/Brewfile.lock.json'
    echo "-- Will now clean temporary brew file(s)..."
    rm -f ./brew/Brewfile.lock.json

    echo "=> Installation completed"

fi
