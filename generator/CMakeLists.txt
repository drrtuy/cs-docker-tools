cmake_minimum_required(VERSION 2.8.9)
project(import-data-generator)

# Disable no-deprecated-declarations
#set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -DDEBUG -Wall -Wunused -Wwrite-strings -Wno-strict-aliasing -Wextra -Wshadow -Werror -Wno-deprecated-declarations")
#
# FORTIFY_SOURCE requires > -O0
#string(TOLOWER ${CMAKE_BUILD_TYPE} LOWERCASE_CMAKE_BUILD_TYPE)
#if (NOT LOWERCASE_CMAKE_BUILD_TYPE STREQUAL "debug")
#    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_FORTIFY_SOURCE=2")
#endif()

# Disable format-truncation since this triggers in mcsapi_types for something that isn't a problem
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11 -Wformat -Wformat-security -fstack-protector-all -fstack-check -Wno-format-truncation -Wno-unused-variable -Wno-unused-parameter -fno-omit-frame-pointer -g")
add_executable(generator edx-io.c generator.c)
