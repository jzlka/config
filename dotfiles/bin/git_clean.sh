#!/bin/sh
#   @file       git_clean.sh
#   @brief      Brief description
#   @author     Jozef Zuzelka <jozef.zuzelka@gmail.com>
#   @date
#    - Created: 18.11.2020 10:01
#    - Edited:  18.11.2020 10:01
#   @version    1.0.0
#   @par        SHELL: zsh 5.8 (x86_64-apple-darwin20.0)
#   @bug
#   @todo



git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
