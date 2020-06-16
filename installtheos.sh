#!/bin/bash
export THEOS=/opt/theos >> ~/.profile
source ~/.profile
sudo apt-get install software-properties-common gnupg1 gnupg2 gnupg3 gnupg unzip
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt-get install fakeroot git perl clang-6.0 build-essential
sudo git clone --recursive https://github.com/theos/theos.git $THEOS
sudo rm -rf $THEOS/toolchain*
curl -LO https://github.com/sbingner/llvm-project/releases/download/v10.0.0-1/linux-ios-arm64e-clang-toolchain.tar.lzma
TMP=$(mktemp -d)
echo $TMP
tar --lzma -xf linux-ios-arm64e-clang-toolchain.tar.lzma -C $TMP
sudo mkdir -p $THEOS/toolchain/linux/iphone
sudo mv $TMP/ios-arm64e-clang-toolchain/* $THEOS/toolchain/linux/iphone/
rm -rf $TMP
cd $HOME
wget https://github.com/xybp888/iOS-SDKs/archive/master.zip
unzip master.zip
sudo mkdir $THEOS/sdks
sudo mv $HOME/iOS-SDKs-master/*.sdk $THEOS/sdks
rm -rf $HOME/iOS-SDKs-master
rm -rf $HOME/master.zip
curl https://kabiroberai.com/toolchain/download.php?toolchain=swift-ubuntu-latest -Lo swift-toolchain.tar.gz
sudo tar xzf swift-toolchain.tar.gz -C $THEOS/toolchain
rm swift-toolchain.tar.gz
echo "All done!"