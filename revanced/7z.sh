#!/bin/bash

# tar cvfa packages/latest/app/tar.tar.lzma packages/latest/app/*.apk

7z a -mx=9 -t7z release/archive.7z release/*.apk

rm -rf release/*.apk
