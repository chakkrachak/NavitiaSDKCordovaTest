#!/bin/bash

# TRACING ON
# set -x

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