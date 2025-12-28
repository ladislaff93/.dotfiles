#!/bin/bash
 
# Get the starting path of the current tmux pane
cd $(tmux display-message -p "#{pane_current_path}") ||
# cd $(tmux run "echo #{pane_start_path}") || 
exit

# Get Git origin URL
url=$(git remote get-url origin)
 
if [[ $url == *github.com* ]]; then
    if [[ $url == git@* ]]; then
        url="${url#git@}"
        url="${url/://}"
        url=https://$url
    fi

    open "$url"
else
    echo "This repository is not hosted on GitHub"
fi
 
