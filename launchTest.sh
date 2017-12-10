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
rm -rf ./CordovaAppTest/platforms/ios/build/emulator/CordovaAppTest.app.dSYM
rm ./CordovaAppTest/platforms/android/build/outputs/apk/android-debug.apk

git clone git@github.com:CanalTP/$CordovaNavitiaSDK_GitHubRepository.git

cd CordovaAppTest

ionic cordova plugin add ../$CordovaNavitiaSDK_GitHubRepository

#ionic cordova platform add android
#ionic cordova build android
#ensureFileExists "./platforms/android/build/outputs/apk/android-debug.apk"

npm rebuild node-sass --force
ionic cordova platform add ios
ionic cordova build ios
ensureFolderExists "./platforms/ios/build/emulator/CordovaAppTest.app.dSYM"

cd ..
