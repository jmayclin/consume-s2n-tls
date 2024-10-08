cmake_minimum_required(VERSION 3.13)
project (source_consumption C)

# By not providing "Findcrypto.cmake" in CMAKE_MODULE_PATH this project has
# asked CMake to find a package configuration file provided by "crypto", but
# CMake did not find one.
# list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../s2n-tls/cmake")
add_subdirectory(${CMAKE_SOURCE_DIR}/../s2n-tls ${CMAKE_BINARY_DIR}/s2n-tls-build)

add_executable(project project.c)
target_link_libraries(project s2n)
