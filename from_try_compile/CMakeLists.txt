cmake_minimum_required(VERSION 3.13)
project (source_consumption C)

# By not providing "Findcrypto.cmake" in CMAKE_MODULE_PATH this project has
# asked CMake to find a package configuration file provided by "crypto", but
# CMake did not find one.
# list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../s2n-tls/cmake")
# add_subdirectory(${CMAKE_SOURCE_DIR}/../s2n-tls ${CMAKE_BINARY_DIR}/s2n-tls-build)

# this does seem to be mostly working, because the libs2n.a artifact actually gets outputted.
try_compile(S2N_COMPILE_RESULT 
    PROJECT s2n
    SOURCE_DIR ${CMAKE_SOURCE_DIR}/../s2n-tls
    BINARY_DIR ${CMAKE_BINARY_DIR}/s2n-tls-build
    TARGET s2n
    CMAKE_FLAGS -DCMAKE_BUILD_TYPE=Release -DCMAKE_JOB_POOLS=all -DCMAKE_JOB_POOLS_ALL=j$(nproc)
)

add_executable(project project.c)
target_link_libraries(project s2n)
