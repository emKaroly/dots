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
brew install cmus
brew install aria2

# Install zsh and make it default
brew install zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

echo "Installing apps..."
brew tap caskroom/cask

APPS=(
    alfred
    android-studio
    appcleaner
    basictex
    contexts
    dropbox
    enpass
    flux
    iterm2
    jettison
    karabiner-elements
    limechat
    macvim
    marked
    paragon-ntfs
    parallels
    scroll-reverser
    skype
    teamviewer
    the-unarchiver
    vlc
    xnviewmp
)

brew cask install ${APPS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-dejavu-sans-mono-for-powerline
)

brew cask install ${FONTS[@]}

brew tap nickolasburr/pfa
brew install sc-im

# Remove outdated versions from the cellar.
brew cleanup
