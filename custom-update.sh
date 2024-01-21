#!/bin/bash
currentDir=$(pwd)

pwndrop stop
pwndrop remove
rm -rf "$currentDir/build"
git fetch -a -v
git pull origin master
make build
cp vars.js "$currentDir/build/admin/pages/vars.js"
./build/pwndrop install
cp pwndrop.ini /usr/local/pwndrop/pwndrop.ini
pwndrop start -no-autocert -no-dns
