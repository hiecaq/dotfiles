#!/usr/bin/env bash


# $1: path to dotfiles
# $2: profile name
function read_profile() {
    local DIR=$1
    local PROFILE=$DIR/profiles/$2
    if [[ ! -f $PROFILE ]]; then
        exit 1
    fi
    while read p; do
        echo -n "$p "
    done < $PROFILE
}

function abs_path() {
    for f in "$@" ; do
        echo $ABS_DIR_PATH/scripts/tasks/$f
    done
}

function link() {
    if [[ -L $2 ]]; then
        echo "a symlink at $2 already exists" >&2
        exit 0
    fi
    ln -sh $1 $2 || exit 1

    echo "linked $1 at $2" >&2
    exit 0
}
