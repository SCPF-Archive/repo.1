#!/bin/bash

WGET_UA="Mozilla/5.0 (Linux; Android 9; Redmi 6A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36"

wget --progress=dot:mega --random-wait --user-agent=$WGET_UA https://ota.thedise.me/instander/instander-17.2.apk
