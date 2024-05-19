#!/bin/bash

export CROSS_COMPILE=$(pwd)/toolchain/bin/aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=$(pwd)/toolchain/bin/arm-linux-gnueabi-
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
ROOT_DIR=$(pwd)
KERNEL_DIR=$ROOT_DIR

	if [ -e "toolchain/bin/clang-14" ]; then
		{
			echo " "
			echo " ${GREEN}Using Clang 14 as compiler ${STD}"
			echo " "
			GCC_ARM64_FILE=aarch64-linux-gnu-
			GCC_ARM32_FILE=arm-linux-gnueabi-
			echo " "
		}
	elif [ -e "toolchain/bin/clang-13" ]; then
		{
			echo " "
			echo " ${GREEN}Using Clang 13 as compiler ${STD}"
			echo " "
			GCC_ARM64_FILE=aarch64-linux-gnu-
			GCC_ARM32_FILE=arm-linux-gnueabi-
			echo " "
		}
	else
		{
			echo " "
			echo " ${RED}WARNING: Correct toolchain could not be found! Downloading latest Clang 19 neutron toolchain. ${STD}"
			echo " "
			rm -rf toolchain
        	        #git clone --depth=1 https://github.com/kdrag0n/proton-clang.git toolchain/
			echo -e "${YELLOW}Downloading Neutron-Clang Toolchain ...${NC}\n"
			mkdir -p toolchain
			cd toolchain
			bash <(curl -s "https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman") -S
			cd $KERNEL_DIR
			sleep 1
		}
	fi

export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export LOCALVERSION=-$VERSION

make  O=out ARCH=arm64 exynos7885-jackpotlte_defconfig

CORES=$(nproc)

PATH="$KERNEL_DIR/toolchain/bin:$KERNEL_DIR/toolchain/bin:${PATH}" \
make -j$CORES O=out \
ARCH=arm64 \
LLVM_DIS=llvm-dis AR=llvm-ar NM=llvm-nm LD=ld.lld OBJDUMP=llvm-objdump STRIP=llvm-strip \
CC=clang \
LD_LIBRARY_PATH="$KERNEL_DIR/toolchain/lib:$LD_LIBRARY_PATH" \
CLANG_TRIPLE=aarch64-linux-gnu- \
CROSS_COMPILE=$KERNEL_DIR/toolchain/bin/aarch64-linux-gnu- \
CROSS_COMPILE_ARM32=$KERNEL_DIR/toolchain/bin/arm-linux-gnu-
