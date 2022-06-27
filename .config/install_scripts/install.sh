#!/usr/bin/env bash
source ./modules.sh
source ./process_fn.sh
source ./install_conf.sh

echo "Press 0 for zsh tuning, WARNING time intensive\
        Press 1 for Basic utilities install\
        Press 2 for Sway install\
        Press 3 for Doom Emacs install, only after SSH key has been added"

read choice
case $choice in

     0)
declare -A status_install_zsh_tuning=(
       [fonts-install]="${status_sudo[no]} ${installCMD[git]} ${pkgs[fonts]}"
       [chsh-install]="${status_sudo[no]} ${installCMD[no]} ${zsh[chsh]}"
       [pack-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${zsh[pack]}"
       [awesome-fonts-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${zsh[awesome-fonts]}"
       [pwl10k-install]="${status_sudo[no]} ${installCMD[git]} ${zsh[pwl10k]}"
       [fzf-tab-install]="${status_sudo[no]} ${installCMD[git]} ${zsh[fzf-tab]}"
       [vi-mode-install]="${status_sudo[no]} ${installCMD[git]} ${zsh[vi-mode]}"
       [config1-install]="${status_sudo[no]} ${installCMD[no]} ${zsh[config1]}"
)

process_request "status_install_zsh_tuning"
;;

    1)
declare -A status_install_basicUtils=(
    [zsh-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[zsh]}"
    [foot-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[foot]}"
    [lsd-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[lsd]}"
    [exa-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[exa]}"
    [bat-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[bat]}"
    [zoxide-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[zoxide]}"
    [fzf-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[fzf]}"
    [cargo-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[cargo]}"
    [pip-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[pip]}"
)

process_request "status_install_basicUtils"

declare -A status_install_git=(
    [git-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[git]}"
    [git-name]="${git[add-user-name]}"
    [git-email]="${git[add-user-email]}"
)

declare -A status_setup_zsh=(

)

process_request "status_install_git"
echo "Remember to create you git ssh key!"
;;


    2)
declare -A status_init_setup=(
     [albert1-install]="${status_sudo[yes]} ${installCMD[no]} ${coprs[albert1]}"
    [albert2-install]="${status_sudo[yes]} ${installCMD[dnf2]} ${coprs[albert2]}"
    [cargo-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[cargo]}"
    [pip-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[pip]}"
)
process_request "status_init_setup"

declare -A status_install_sway=(
    [albert-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[albert]}"
    [sway-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[sway]}"
    [swaybg-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[swaybg]}"
    [mako-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[mako]}"
    [brightnessctl-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[brightnessctl]}"
    [pactl-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[pactl]}"
    [swayr-install]="${status_sudo[no]} ${installCMD[cargo]} ${sway[swayr]}"
    [udiskie-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[udiskie]}"
    [lxpolkit-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[lxpolkit]}"
    [safeeyes-install]="${status_sudo[no]} ${installCMD[pip]} ${sway[safeeyes]}"
    [waybar-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${pkgs[waybar]}"
    [fonts]="${fonts[meslo]}"
    )

process_request "status_install_sway"
echo "Sway has been installed"

echo "Want to install wf-recorder and gammastep?(y/n)"
read choice2

if [[ "${choice2}" == "y" ]]
then

declare -A status_install_sway_opts=(
    [gammastep-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[gammastep]}"
    [wf-recorder-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${sway[wf-recorder]}"
    )

process_request "status_install_sway_opts"
fi
;;


    3)
declare -A status_install_doom=(
    [emacs-copr]="${status_sudo[yes]} ${coprs[deathwish]}"
    [wl-clipboard-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${emacs[wl-clipboard]}"
    [emacs-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${emacs[emacs]}"
    [ripgrep-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${emacs[ripgrep]}"
    [fd-find-install]="${status_sudo[yes]} ${installCMD[dnf-y]} ${emacs[fd-find]}"
)
process_request "status_install_doom"
echo "Doom emacs has been installed"
;;

esac
