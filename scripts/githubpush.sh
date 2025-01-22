#!/bin/bash

read -rp "Enter commit message: " commit_msg

git add .
git commit -m "$commit_msg"
git push origin main
