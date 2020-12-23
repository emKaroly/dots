#!/usr/bin/env bash

git clone --bare https://github.com/emKaroly/dots.git $HOME/.dots

function dots {
   /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}

mkdir -p .dots-backup
dots checkout
if [ $? = 0 ]; then
  echo "Checked out dots.";
  else
    echo "Backing up pre-existing dot files.";
  dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dots-backup/{}
fi;

dots checkout
dots config status.showUntrackedFiles no
