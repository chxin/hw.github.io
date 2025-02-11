#!/bin/sh
# security delete-keychain ios-build.keychain
# rm -f ~/Library/MobileDevice/Provisioning\ Profiles/hocHipRock.mobileprovision

security create-keychain -p travis ios-build.keychain
security default-keychain -s ios-build.keychain
security lock-keychain -a

security unlock-keychain -p travis ios-build.keychain
security set-keychain-setting -t 3600 -l ~/Library/Keychains/ios-build.keychain

security import ./ios/RockCer/ios_distribution.cer -A -k ~/Library/Keychains/ios-build.keychain
# security import ./ios/RockCer/privateKey.p12 -A -k ~/Library/Keychains/ios-build.keychain -P 1******
security import ./ios/RockCer/privateKey.p12 -A -k ~/Library/Keychains/ios-build.keychain -P System.getenv("keyP12")
security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k travis ios-build.keychain

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./ios/RockCer/hocHipRock.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/

security find-identity -p codesigning ~/Library/Keychains/ios-build.keychain
security list-keychains
