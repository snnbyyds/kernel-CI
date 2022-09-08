#!/bin/bash

cd ~
git clone https://github.com/acuicultor/Radioactive_kernel_op6.git ~/linux
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 ~/aarch64-linux-android-4.9
export ANDROID_AARCH64=~/aarch64-linux-android-4.9/bin
export ARCH=arm64
export SUBARCH=arm64
export PATH=$PATH:$ANDROID_AARCH64
export CROSS_COMPILE=aarch64-linux-android-
mkdir output
make O=output radioactive_defconfig
cd output
make O=output -j16
