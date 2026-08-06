project(Binary_Dump_map_prog LANGUAGES C CXX)

set (CMAKE_CXX_EXTENSIONS OFF)
set (CMAKE_CXX_STANDARD 23)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(Binary_Dump_map main.cpp)

target_link_options(Binary_Dump_map PRIVATE
    "/SUBSYSTEM:CONSOLE"
    "$<$<CONFIG:Debug>:/DEBUG>"
)
