# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME=$HOME/.config
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$CDPATH:$PATH
export PATH=$HOME/go/bin:$PATH
export LOCAL=$HOME/.local/bin
export PATH=$LOCAL:$PATH
export PATH=$LOCAL/spicetify-cli:$PATH
export PATH=$LOCAL/zls:$PATH
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PATH=$PATH:~/.platformio/penv/bin


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(firewalld zsh-syntax-highlighting zsh-autosuggestions git)
#
plugins=(firewalld
         zsh-vi-mode
         fzf-tab
         zsh-syntax-highlighting
         zsh-autosuggestions
         git
         )

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='emacsclient -t'
 else
   export EDITOR='emacsclient -t'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# keybinds
bindkey -v
enable-fzf-tab
# zoxide
# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    cd "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    zoxide add "$(__zoxide_pwd)"
}

# Initialize hook.
chpwd_functions=(${chpwd_functions[@]} "__zoxide_hook")

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

# Jump to a directory using only keywords.
function __zoxide_z() {
    if [ "$#" -eq 0 ]; then
        __zoxide_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            __zoxide_cd "$OLDPWD"
        else
            echo "zoxide: \\$OLDPWD is not set"
            return 1
        fi
    elif [ "$#" -eq 1 ] &&  [ -d "$1" ]; then
        __zoxide_cd "$1"
    else
        local __zoxide_result
        __zoxide_result="$(zoxide query -- "$@")" && __zoxide_cd "$__zoxide_result"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    local __zoxide_result
    __zoxide_result="$(zoxide query -i -- "$@")" && __zoxide_cd "$__zoxide_result"
}

# Add a new entry to the database.
function __zoxide_za() {
    zoxide add "$@"
}

# Query an entry from the database using only keywords.
function __zoxide_zq() {
    zoxide query "$@"
}

# Query an entry from the database using interactive selection.
function __zoxide_zqi() {
    zoxide query -i "$@"
}

# Remove an entry from the database using the exact path.
function __zoxide_zr() {
    zoxide remove "$@"
}

# Remove an entry from the database using interactive selection.
function __zoxide_zri() {
    zoxide remove -i "$@"
}

# =============================================================================
#
# Convenient aliases for zoxide. Disable these using --no-aliases.
#

# Remove definitions.
function __zoxide_unset() {
    \unalias "$@" &>/dev/null
    \unfunction "$@" &>/dev/null
    \unset "$@" &>/dev/null
}

__zoxide_unset 'z'
function z() {
    __zoxide_z "$@" && lsd
}

__zoxide_unset 'zi'
function zi() {
    __zoxide_zi "$@" && lsd
}

__zoxide_unset 'za'
function za() {
    __zoxide_za "$@" && lsd
}

__zoxide_unset 'zq'
function zq() {
    __zoxide_zq "$@" && lsd
}

__zoxide_unset 'zqi'
function zqi() {
    __zoxide_zqi "$@" && lsd
}

__zoxide_unset 'zr'
function zr() {
    __zoxide_zr "$@" && lsd
}

__zoxide_unset 'zri'
function zri() {
    __zoxide_zri "$@" && lsd
}

# =============================================================================
#
# To initialize zoxide with zsh, add the following line to your zsh
# configuration file (usually ~/.zshrc):
#
#

#config NNNN
export NNN_PLUG='a:autojump;b:bookmarks;c:cdpath;f:finder;F:fzcd;h:fzhist;o:fzopen;i:imgview;k:kdeconnect;m:nmount;n:nuke;u:umounttree;x:xdgdefault;p:preview-tui'
export BOOKMARKS_DIR=$HOME/.config/nnn/bookmarks
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
export NNN_FIFO=/tmp/nnn.fifo
export USE_PISTOL=1

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias e="emacsclient -a "" -t "$@""
alias vim="$EDITOR"
alias lf="nnn -c"
alias ls="lsd"
alias c="z"
alias ci="zi"
#alias rm="gomi"
alias btm="btm --battery --mem_as_value"

edit() {
    zi $1 && vim $(fzf --query "$2") && cd 
}
restart-emacs() {
    pkill -9 --full "emacs --daemon" && emacs --daemon && emacsclient -t $1
}
link() {
    rm -rf $2/$1 ; mkdir $2/$1 && stow -t $2/$1 -Rv $1;
        if [ -z "`ls -A $2/$1/`" ] # check if dir is empty
            then
                rm $2/$1
            else
        fi
}
profile() {
    printf 'Choices: power-saver | balanced | performance (if safe thermals)\n'
    read ans
    gdbus call --system --dest net.hadess.PowerProfiles --object-path /net/hadess/PowerProfiles --method org.freedesktop.DBus.Properties.Set 'net.hadess.PowerProfiles' 'ActiveProfile' "<'$ans'>"

}

profile_status() {
    gdbus introspect --system --dest net.hadess.PowerProfiles --object-path /net/hadess/PowerProfiles
}

# plugin config

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:z:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:imv:*' fzf-preview 'imv $realpath'
zstyle ':fzf-tab:complete:lsd:*' fzf-preview 'bat --style=numbers --color=always --line-range :500 $realpath'
zstyle ':fzf-tab:complete:emacsclient:*' fzf-preview 'bat --style=numbers --color=always --line-range :500 $realpath'

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# evals
#eval "$(zoxide init --cmd c zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f "/home/enzobissoli/.ghcup/env" ] && source "/home/enzobissoli/.ghcup/env" # ghcup-env
