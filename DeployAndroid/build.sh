export ANDROID_NDK_ROOT=/media/art/data/Sdk/ndk-bundle
export ANDROID_NDK_PLATFORM=android-28
export ANDROID_SDK_ROOT=/media/art/data/Sdk
python3.7 build.py --target android-32 --installed-qt-dir /home/art/Qt/5.12.3 --verbose --source-dir ./external-sources
