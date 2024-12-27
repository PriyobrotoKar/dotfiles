#!/bin/bash

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >>/Users/test/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/test/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install dependencies from BrewFile
brew bundle install --file=./Brewfile

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
