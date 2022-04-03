#!/usr/bin/env bash

declare -A pkgs=(
    [zsh]="zsh"
    [foot]="foot"
    [lsd]="lsd"
    [exa]="exa"
    [bat]="bat"
    [fzf]="fzf"
    [zoxide]="zoxide"
    [git]="git"
    [pip]="pip"
    [cargo]="cargo"
)

declare -A coprs=(
    [deathwish]="dnf copr -y enable deathwish/emacs-pgtk-nativecomp"
    [albert1]="rpm --import https://build.opensuse.org/projects/home:manuelschneid3r/public_key"
    [config-manager]="config-manager"
    [albert2]="config-manager --add-repo https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_35/home:manuelschneid3r.repo"
)

declare -A fonts=(
    [meslo]="cd ~/.dotFiles/TTF;fc-cache -f -v"
)

declare -A git=(
    [add-user-name]="git config --global user.name \"Enzo Bissoli\""
    [add-user-email]="git config --global user.email \"enzogurgel15@gmail.com\""
    [fonts]="--depth=1 https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts"
    [ssh-agent]="eval "$(ssh-agent -s)""
)

declare -A sway=(
    [swayconfig]="git@github.com:ebissoli/dotFiles.git ~/git/dotFiles;cd ~/git/dotFiles;cp -r * ~/.config/"
    [sway]="sway"
    [swaybg]="swaybg"
    [mako]="mako"
    [brightnessctl]="brightnessctl"
    [pactl]="pulseaudio-utils"
    [swayr]="swayr"
    [albert]="albert"
    [udiskie]="udiskie"
    [waybar]="waybar"
    [lxpolkit]="lxpolkit"
    [safeeyes]="safeeyes"
    [gammastep]="gammastep"
    [wf-recorder]="wf-recorder"
)

declare -A zsh=(
    [chsh]="chsh -s $(which zsh)"
    [pack]="git wget curl ruby ruby-devel zsh util-linux-user redhat-rpm-config gcc gcc-c++ make"
    [config1]="cd .nerd-fonts;sudo ./install.sh"
    [awesome-fonts]="fontawesome-fonts"
    [oh-my-zsh]="sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)""
    [pwl10k]="https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k"
    [fzf-tab]="https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab"
    [vi-mode]="https://github.com/jeffreytse/zsh-vi-mode \
        $ZSH_CUSTOM/plugins/zsh-vi-mode"

)

declare -A emacs=(
    [ripgrep]="ripgrep"
    [fd-find]="fd-find"
    [emacs]="emacs"
    [doom]="--depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d"
    [doom-install]="~/.emacs.d/bin/doom install"
    [wl-clipboard]="wl-clipboard"
)
