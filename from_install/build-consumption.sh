nukeable_install=/home/ubuntu/workspace/nukeable-install

# remove the cache everytime to prevent cmake from zealously
# stabbing you in the back
rm -rf build
cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=$nukeable_install
cmake --build build -j $(nproc)
