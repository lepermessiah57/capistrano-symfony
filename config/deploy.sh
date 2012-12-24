#!/bin/bash
# Why?
#
# see innovation-hub/application/scripts/deploy.sh
#
source ~/.bashrc
ssh-add
cap $1 $2 