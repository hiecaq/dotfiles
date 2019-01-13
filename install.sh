#!/usr/bin/env bash

# return the path to the directory of this scripts
function get_dir() {
    local DIR="$BASH_SOURCE[0]"
    echo $(cd $(dirname $DIR) && pwd)
}


DIR=$(get_dir)
. $DIR/scripts/lib.sh

PROFILE=($(read_profile $DIR $1))

QUINOA42_INSTALL_OS=${QUINOA42_INSTALL_OS:-ARCH}
QUINOA42_INSTALL_DIR=$DIR

TASKS=$(ABS_DIR_PATH=$DIR abs_path ${PROFILE[@]})
for f in $TASKS; do
    _=$(. $f)
    if [[ $? != 0 ]]; then
        echo "Something wrong happened!"
        exit 1
    fi
done
