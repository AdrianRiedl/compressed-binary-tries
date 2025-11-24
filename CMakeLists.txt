cmake_minimum_required(VERSION 3.5)

project(COMP_BINARY_TRIES VERSION 1.0)

include(vendor/sdsl.cmake)
include_directories(${COMP_BINARY_TRIES_SOURCE_DIR}/include)

set(CMAKE_CXX_STANDARD 14)

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    add_compile_definitions("LINUX")
else()
    add_compile_definitions("MACOS")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DNDEBUG")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
add_library(intersection ${COMP_BINARY_TRIES_SOURCE_DIR}/src/intersection.cpp ${COMP_BINARY_TRIES_SOURCE_DIR}/include/intersection.hpp)
add_library(fastTrieIntersection ${COMP_BINARY_TRIES_SOURCE_DIR}/src/fastTrieIntersection.cpp ${COMP_BINARY_TRIES_SOURCE_DIR}/include/fastTrieIntersection.hpp)
target_link_libraries(intersection PUBLIC sdsl_lite::sdsl divsufsort divsufsort64)
target_link_libraries(fastTrieIntersection PUBLIC sdsl_lite::sdsl divsufsort divsufsort64)
#add_subdirectory(test)
#add_subdirectory(tools)

