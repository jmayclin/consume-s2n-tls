cmake_minimum_required(VERSION 3.13)
project (consumption C)

add_executable(simple simple.c)

find_package(s2n)

add_executable(stable stable.c)
target_link_libraries(stable AWS::s2n)

add_executable(unstable unstable.c)
target_link_libraries(unstable AWS::s2n)
