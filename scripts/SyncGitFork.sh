#!/usr/bin/env bash
# Semantics: 
# $1 is remote url
# $2 is the name of the remote main/master branch
# $3 is the name of the local main/master branch
set -eux
git remote add upstream $1
git pull --rebase upstream $2
git push --force origin $3
