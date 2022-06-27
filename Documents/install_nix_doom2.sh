#!/usr/bin/env bash
nix-env -iA cachix -f https://cachix.org/api/v1/install
cachix use nix-community
cp -rf $HOME/Downloads/test2022.2/. $HOME
mkdir -p $HOME/.config/nixpkgs/overlays
echo "import (builtins.fetchTarball {
		url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
	})" >> $HOME/.config/nixpkgs/overlays/emacs.nix
 nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
 nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install
#home-manager switch, use . in the cp so can properly recursive copy
#home-manager switch
echo 'installing doom emacs'
git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.emacs.d
$HOME/.emacs.d/bin/doom install
#font config
echo 'instalando fontes'
mkdir -p $HOME/.local/share/fonts/
cp -rf $HOME/Downloads/test2022.2/Downloads/ZIP/PragmataPro-*/. $HOME/.local/share/fonts/
fc-cache -fv
$HOME/.emacs.d/bin/.doom sync
echo 'instalaÃao finalizada'
