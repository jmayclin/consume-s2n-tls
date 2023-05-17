set -ex

# invoke this script from the s2n-tls folder
nukeable_install=/home/ubuntu/workspace/nukeable-install

# i don't trust C
rm -rf build
cmake . -Bbuild -DBUILD_SHARED_LIBS=ON -DBUILD_TESTING=OFF
cmake --build build -j $(nproc)
cmake --install build --prefix $nukeable_install