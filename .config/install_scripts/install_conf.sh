declare -A status_sudo=(
    [yes]="sudo"
    [no]=""
)

declare -A installCMD=(
    [dnf]="dnf install"
    [dnf-y]="dnf -y install"
    [dnf2]="dnf"
    [pip]="pip -y install"
    [cargo]="cargo install"
    [no]=""
    [git]="git clone"

)
