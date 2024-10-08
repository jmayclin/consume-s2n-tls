# CMake is omniscient, and is capable of instantly knowning which build variables 
# would be most inconvenient for it to cache. Then it will cache those.
rm build -rf
echo "DONE REMOVING"
cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=$nukeable_install
echo "COMPILING THE INDIVIDUAL THING"
cmake --build build -j $(nproc)
