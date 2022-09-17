#!/bin/bash

cd ~
git clone --depth=1 -b lineage-19.1 https://github.com/Linux-Mobile/android_kernel_oneplus_sdm845.git ~/linux
#wget https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/961622e926a1b21382dba4dd9fe0e5fb3ee5ab7c.tar.gz
mkdir toolchain
git clone https://github.com/radcolor/aarch64-elf.git toolchain
cd toolchain

#tar -xpf ../*.tar.gz
cd ~
export ANDROID_AARCH64=~/toolchain/bin
export ARCH=arm64
export SUBARCH=arm64
export PATH=$PATH:$ANDROID_AARCH64
export CROSS_COMPILE=aarch64-elf-
cd ~/linux
mkdir output
make O=output enchilada_defconfig -j8
cd output
make O=output -j8
