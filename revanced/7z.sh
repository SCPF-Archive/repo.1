#!/bin/bash

# tar cvfa packages/latest/app/tar.tar.lzma packages/latest/app/*.apk

echo "ARCHIVING APPLICATIONS"
7z a -mx=9 -t7z release/archive.7z release/*.apk

echo "DONE ARCHIVING"

echo "REMOVING CACHE"

rm -rf release/*.apk
