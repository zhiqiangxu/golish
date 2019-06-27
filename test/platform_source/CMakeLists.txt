
cmake_minimum_required(VERSION 3.12)

project(platform_source)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../GolishUtils.cmake)


golish_collect_files(
    DIR .
    OUTPUT_VAR ALL_SOURCES
)

add_executable(main ${ALL_SOURCES})