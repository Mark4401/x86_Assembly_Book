cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
set(CMAKE_C_STANDARD_REQUIRED 17 ON)

project(Root_cmake_possition VERSION 0.0.5)
set(Invine_libs
    "${CMAKE_CURRENT_SOURCE_DIR}\\Dependencies\\Irvine_Libs\\Irvine32.lib"
)

# add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Assembly_Source/MASM_Demo)
# add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Assembly_Source/Chapter_3)
# add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Assembly_Source/Chapter_4)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Assembly_Source/Assembly_files_x86)



