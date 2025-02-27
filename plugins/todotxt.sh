#!/usr/bin/env bash

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$current_dir/../lib/utils.sh"

todotxt_icon=$(get_tmux_option "@tmux2k-todotxt-icon" "")

main() {
    strout=$(todo-txt report)
    # get second line
    strout=$(echo "$strout" | awk 'NR == 2')
    # get second token corresponding to todo count
    strout=$(echo "$strout" | awk '{print $2}')

    if [[ "$strout" == "0" ]]; then
        echo ""
    else
        echo "$todotxt_icon $strout"
    fi
}

main
