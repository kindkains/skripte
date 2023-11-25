#!/bin/bash
git clone git://source.winehq.org/git/wine.git ~/wine-git
wget http://phoenix.inf.upol.cz/~prochapa/public_storage/wine-patches/multibuffering/0001-wined3d-Allowing-infinity-count-of-backbuffers.patch
wget http://phoenix.inf.upol.cz/~prochapa/public_storage/wine-patches/multibuffering/0002-wined3d-_Present-relevant-to-windows-implementation.patch
wget http://phoenix.inf.upol.cz/~prochapa/public_storage/wine-patches/multibuffering/0003-ddraw-tests-Add-multibuffering-test.patch
cd /home/sandro/wine-git/
git apply ../0001-wined3d-Allowing-infinity-count-of-backbuffers.patch
git apply ../0002-wined3d-_Present-relevant-to-windows-implementation.patch
git apply ../0003-ddraw-tests-Add-multibuffering-test.patch
./configure
make depend && make
sudo make install
cd
rm *.patch 
sudo poweroff
