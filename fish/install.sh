#!/usr/bin/env bash

# Setup fish shell
if [ "$(grep /usr/local/bin/fish /etc/shells)" == "" ]; then
  echo "Adding fish to /etc/shells"
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi

if ! [ "${SHELL}" == "/usr/local/bin/fish" ]; then
  chsh -s /usr/local/bin/fish
fi

if ! [ -d $HOME/.tacklebox ]; then
  curl -L https://raw.githubusercontent.com/justinmayer/tacklebox/master/tools/install.fish | fish
fi

#for src in $HOME/.dotfiles/fish/*.fish
#do
#  dst="$HOME/.config/fish/$(basename "${src}")"
#  if ! [ -h $dst ]; then
#    if [ -f $dst ]; then
#      mv $dst $dst.backup-$(date -u +"%Y-%m-%dT%H:%M:%SZ")
#    fi
#    echo "Symlinking $src -> $dst"
#    ln -s $src $dst
#  fi
#done
