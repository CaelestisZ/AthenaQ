#!/bin/bash
#           _                           
#         _| |____   ______   ____        
#        / |  ___/  |  ___/\  \ | \         
#       / /| | | |__| |__|  \ | |\ \       
#      / /_| |_|  __   __| \ \| |_\ \     
#     / ___|   / |  | |__| |\   |___ \      
#    /_/    \_/|_/  /_____\| \__\   \_\     
#
#      Athena Kernel Build Script 
#         Coded by CaelestisZ @2020
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
clear
# Init Fields
AT_VERSION=Testing
AT_DATE=$(date +%Y%m%d)
AT_TOOLCHAIN=/home/caelestisz/AndroidBuilds/Toolchains/linaro-7.5.0-aarch64/bin/aarch64-linux-gnu-
AT_DIR=$(pwd)
# Init Methods
CLEAN_SOURCE()
{
	make clean
	make mrproper
	rm -r -f $AT_DIR/out
}
BUILD_ZIMAGE()
{
    echo "----------------------------------------------"
	echo "Building zImage for $AT_VARIANT..."
	echo " "
	export ARCH=arm64
	export CROSS_COMPILE=$AT_TOOLCHAIN
	export LOCALVERSION=-Athena-$AT_VERSION-$AT_VARIANT-$AT_DATE
    export ANDROID_MAJOR_VERSION=q
    export ANDROID_PLATFORM_VERSION=10
	make O=./out $AT_DEFCON
    make O=./out -j5
	echo " "
}
# Main Menu
clear
echo "             _                                "
echo "           _| |____   ______   ____           "
echo "          / |  ___/  |  ___/\  \ | \          "
echo "         / /| | | |__| |__|  \ | |\ \         "
echo "        / /_| |_|  __   __| \ \| |_\ \        "
echo "       / ___|   / |  | |__| |\   |___ \       "
echo "      /_/    \_/|_/  /_____\| \__\   \_\      "
echo "                                              "
echo "        Athena $AT_VERSION Build Script       "
echo "             Coded by CaelestisZ              "
echo "                                              "
PS3='Please select your option (1-3): '
menuvar=("a6lte" "j7y17lte" "Exit")
select menuvar in "${menuvar[@]}"
do
    case $menuvar in
        "a6lte")
            clear
            AT_VARIANT=a6lte
            AT_DEFCON=exynos7870-a6lte_defconfig
            BUILD_ZIMAGE
            read -n1 -r key
            break
            ;;
        "j7y17lte")
            clear
            AT_VARIANT=j7y17lte
            AT_DEFCON=exynos7870-j7y17lte_defconfig
            BUILD_ZIMAGE
            read -n1 -r key
            break
            ;;
        "Exit")
            break
            ;;
        *) echo Invalid option.;;
    esac
done
