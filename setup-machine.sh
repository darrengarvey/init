#!/bin/bash

this_dir=$(dirname $BASH_SOURCE)

# Run all of the executable scripts in ./setup.d/
# NB. This script guarantees the scripts are run from the directory that
#     *this* script is in. (ie. $this_dir)
cd ${this_dir}

setup_dir="${this_dir}/setup.d"
if [[ -d ${setup_dir} && -r ${setup_dir} && -x ${setup_dir} ]]; then
    for i in $(LC_ALL=C command ls ${setup_dir}); do
        if [[ -x ${setup_dir}/$i ]]; then
            printf "Running \"%s\"..." $(basename ${setup_dir}/$i)
            ${setup_dir}/$i && printf " DONE\n"
        fi
    done
fi

