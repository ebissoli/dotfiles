#!/usr/bin/env bash

file_name=nix-user-chroot-bin-1.2.2-x86_64-unknown-linux-musl
nix_dir=$HOME

#install the nix-shell
chmod +x "../$file_name"
mkdir -m 0755 ~/.nix
cp ../$file_name $HOME
$nix_dir/$file_name ~/.nix bash -c "curl -L https://nixos.org/nix/install | bash"

#Properly setup home-manager+emacs
echo 'installing nix...'
$nix_dir/$file_name $HOME/.nix bash -l "$HOME/Downloads/test2022.2/Documents/install_nix_doom2.sh"
