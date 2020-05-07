export ANDROID_NDK_ROOT=/media/art/data/Android/Sdk/ndk-bundle
export ANDROID_NDK_PLATFORM=android-28
export ANDROID_SDK_ROOT=/media/art/data/Android/Sdk
pyrcc5 main.qrc -o lib/main_rc.py
python3.7 build.py --target android-32 --installed-qt-dir /media/art/data/Qt/5.12.2 --no-sysroot --verbose --source-dir ./../../DeployAndroid/external-sources