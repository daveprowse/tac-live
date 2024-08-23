#!/bin/bash

## Pushes all content automatically and gives timestamp in the commit description
echo; echo
echo 'Running GitHub Script!'
echo; echo
git add .
git commit -m "$(date '+%m-%d-%Y | %r')"
git push -u origin main
