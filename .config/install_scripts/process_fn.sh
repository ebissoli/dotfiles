#!/usr/bin/env bash
process_request() {
    dict_ref=$(declare -p "$1")
    eval "declare -A pkgList=${dict_ref#*=}"
    for key in "${!pkgList[@]}"
    do
    echo ${pkgList[$key]}
    eval ${pkgList[$key]}
    done
}
