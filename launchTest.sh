#!/bin/bash

# TRACING ON
# set -x

SET CordovaNavitiaSDK_GitHubRepository='CDVNavitiaSDK'

git checkout . && git clean -fd

git clone git@github.com:CanalTP/$CordovaNavitiaSDK_GitHubRepository.git
#ionic cordova platform add ios
ionic cordova platform add android
ionic cordova plugin add ./$CordovaNavitiaSDK_GitHubRepository

#ionic cordova build ios
ionic cordova build android