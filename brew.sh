#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.

brew upgrade

brew install coreutils
brew install mc
brew install git
brew install ledger

brew install grep
brew install openssh
brew install screen

brew install p7zip
brew install rsync
brew install rclone
brew install pandoc
brew install tree
brew install fzf
brew install rg
brew install gibo
brew install cheat
brew install romkatv/powerlevel10k/powerlevel10k
#brew install cmus
#brew install aria2

# Install zsh and make it default
brew install zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

echo "Installing apps..."

brew install --cask alfred
brew install --cask android-studio
brew install --cask appcleaner
brew install --cask basictex
brew install --cask contexts
brew install --cask dropbox
brew install --cask enpass
brew install --cask iterm2
brew install --cask jettison
brew install --cask karabiner-elements
brew install --cask macvim
brew install --cask marked
brew install --cask paragon-ntfs
brew install --cask parallels
brew install --cask scroll-reverser
brew install --cask skype
brew install --cask the-unarchiver
brew install --cask vlc
brew install --cask xnviewmp

echo "Installing fonts..."
brew install --cask font-dejavu-sans-mono-for-powerline

brew tap nickolasburr/pfa
brew install sc-im

# Remove outdated versions from the cellar.
brew cleanup
