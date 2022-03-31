#!/bin/bash -x

# This script is used to create take an existing directory and create a new github repo from it.
# It will also create a new branch called master and push it to the new repo.

# Prerequisites:
# - You must have a github account
# - You must have set the git config variables
#   using git config --global user.name "Your Name" and git config -- global user.email "email@example.com"
# - Your ssh key must have been created and set in github.com with r/w permissions

#  Test github.com ssh connection by going:
#  ssh -T git@github.com

# Usage:
# ./dir-to-rep.sh <dir-to-copy> 


GITHUB_USERNAME=raymondlowe

# Get the first parameter as the name of the dir
DIR_OF_REPO=$1


# change into the folder and do git init and add and commit all files
cd $1
git init
git add .
git commit -m "initial commit"

# use gh to make a repo on github using the name of the dir
gh repo create $1 --private --description "This is a repo created from $DIR_OF_REPO" 

# set the git remote to the github repo
git remote add origin git@github.com:$GITHUB_USERNAME/$1.git

# force upload git
git push -u origin master

