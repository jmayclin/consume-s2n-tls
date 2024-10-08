cmake_minimum_required(VERSION 3.13)
project (source_consumption C)

# when I tried to specify cmake args this failed with a weird "git" error?
include(FetchContent)

FetchContent_Declare(
    s2n
    GIT_REPOSITORY https://github.com/aws/s2n-tls.git
    GIT_TAG main
)

FetchContent_MakeAvailable(s2n)

add_executable(project project.c)
target_link_libraries(project s2n) # project needs to link against libs2n.a
