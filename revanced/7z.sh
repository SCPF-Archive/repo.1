#!/bin/bash

# tar cvfa packages/latest/app/tar.tar.lzma packages/latest/app/*.apk

7z a -mx=9 -t7z packages/latest/app/7z.7z packages/latest/app/*.apk

rm -rf packages/latest/app/*.apk
