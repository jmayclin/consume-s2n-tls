cmake_minimum_required(VERSION 3.13)
project (source_consumption C)

# By not providing "Findcrypto.cmake" in CMAKE_MODULE_PATH this project has
# asked CMake to find a package configuration file provided by "crypto", but
# CMake did not find one.
# list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../s2n-tls/cmake")
# add_subdirectory(${CMAKE_SOURCE_DIR}/../s2n-tls ${CMAKE_BINARY_DIR}/s2n-tls-build)

# this seems to be surprsingly inteneded to be not-stupid by default. It assumes a 
# cmake project and will configure, build, run the project for you. And it does seem
# to use all available cores to build things.
include(ExternalProject)
ExternalProject_Add(
    s2n_tls
    GIT_REPOSITORY https://github.com/aws/s2n-tls.git
    GIT_TAG main # or a specific tag
    BUILD_TYPE  Release
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/s2n-tls
    #TEST_BEFORE_INSTALL TRUE
    #TEST_COMMAND ctest -parallel
)

include_directories(${CMAKE_BINARY_DIR}/s2n-tls/include)
link_directories(${CMAKE_BINARY_DIR}/s2n-tls/lib)

# This is some sort of sweet exquisite hell. If you assume that the project is a
# cmake project why is "find_dependency" so hard to use :sob: I guess I should be
# using fetchContent instead?

# also I think that we should explicitly ban people from add_subdirectory-ing us
# FetchContent_Declare https://stackoverflow.com/questions/66372317/use-find-package-on-external-project

# set(CMAKE_MODULE_PATH "${CMAKE_BINARY_DIR}/s2n-tls")
# find_package(s2n REQUIRED)

add_executable(project project.c)
target_link_libraries(project s2n) # project needs to link against libs2n.a
add_dependencies(project s2n_tls) # project depends on the external s2n-tls project

# https://cmake.org/cmake/help/latest/module/ExternalProject.html#configure-step-options
# By default, the external project is assumed to be a CMake project, but this can be overridden if required.

# this does seem to be mostly working, because the libs2n.a artifact actually gets outputted.
# try_compile(S2N_COMPILE_RESULT 
#     PROJECT s2n
#     SOURCE_DIR ${CMAKE_SOURCE_DIR}/../s2n-tls
#     BINARY_DIR ${CMAKE_BINARY_DIR}/s2n-tls-build
#     TARGET s2n
#     CMAKE_FLAGS -DCMAKE_BUILD_TYPE=Release -DCMAKE_JOB_POOLS=all -DCMAKE_JOB_POOLS_ALL=j$(nproc)
# )
