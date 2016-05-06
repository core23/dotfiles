#!/bin/bash

branches_to_die=$(git branch --no-color --merged origin/master | grep -v '^[\* ] master')
echo "Branches to be deleted:"
echo $branches_to_die

echo ""
echo "Enter Y to confirm"
read -p "> " confirm


kill_branches(){
    echo $branches_to_die | xargs -n 1 git branch -d
}

[[ $confirm == "Y"  ]] && kill_branches
