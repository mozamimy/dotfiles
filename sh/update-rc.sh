#!/bin/bash

REPO_DIR=~/var/repo/diy/sh/dotfiles
BRANCH=develop
REMOTE_REPO=origin

cd $REPO_DIR
git pull $REMOTE_REPO $BRANCH
