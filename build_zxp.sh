#!/bin/bash

# get version of extension
ver=$(grep -m1 'ExtensionBundleVersion' com.simon.demo-plugin/CSXS/manifest.xml | cut -f2 -d'"')

# set a password
pw=35ff1db5cf45bf7de5c4c4b548926d7343761999c2822e160b5cc17a88e0660d

# remove any prev builds
rm -rf DemoPlugin*.zxp DemoPlugin.p12 &>/dev/null

# make a cert
./ZXPSignCmd-64bit -selfSignedCert UK London Simon DemoPlugin-$ver $pw DemoPluginCert.p12

# build the signed .zxp, using our cert
./ZXPSignCmd-64bit -sign "com.simon.demo-plugin" DemoPlugin-$ver.zxp DemoPluginCert.p12 $pw