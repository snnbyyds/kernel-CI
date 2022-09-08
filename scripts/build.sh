#!/bin/bash

cd ~
git clone https://github.com/acuicultor/Radioactive_kernel_op6.git ~/linux
#git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 ~/aarch64-linux-android-4.9
wget https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/961622e926a1b21382dba4dd9fe0e5fb3ee5ab7c.tar.gz
mkdir toolchain
cd toolchain
tar -xpvf ../*.tar.gz && ls -l
cd ~
export ANDROID_AARCH64=~/toolchain/bin
export ARCH=arm64
export SUBARCH=arm64
export PATH=$PATH:$ANDROID_AARCH64
export CROSS_COMPILE=aarch64-linux-android-
cd ~/linux
mkdir output
make O=output radioactive_defconfig
cd output
make O=output -j16
