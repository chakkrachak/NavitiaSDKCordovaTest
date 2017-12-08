#!/bin/bash

# TRACING ON
# set -x

# Utils
function ensureFileExists {
    if [  -f "$*" ]; then
        echo "$* exists => OK"
    else
        echo "$* does not exist => ## PROBLEM FILE NOT FOUND ##";
        exit 1;
    fi    
}

function ensureFolderExists {
    if [  -d "$*" ]; then
        echo "$* exists => OK"
    else
        echo "$* does not exist => ## PROBLEM FOLDER NOT FOUND ##";
        exit 1;
    fi    
}

# Script

CordovaNavitiaSDK_GitHubRepository='CDVNavitiaSDK'

rm -rf ./$CordovaNavitiaSDK_GitHubRepository
git checkout . && git clean -fd

git clone git@github.com:CanalTP/$CordovaNavitiaSDK_GitHubRepository.git

cd CordovaAppTest

ionic cordova platform add ios
ionic cordova platform add android
#ionic cordova plugin add ../$CordovaNavitiaSDK_GitHubRepository

npm rebuild node-sass --force

ionic cordova build ios
ionic cordova build android

cd ..

ensureFolderExists "./CordovaAppTest/platforms/ios/build/emulator/CordovaAppTest.app"
ensureFileExists "./CordovaAppTest/platforms/android/build/outputs/apk/android-debug.apk"
