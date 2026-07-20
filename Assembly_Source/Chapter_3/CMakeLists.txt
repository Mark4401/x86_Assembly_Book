cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
set(CMAKE_C_STANDARD_REQUIRED 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(Basic_language_Elements LANGUAGES C ASM_MASM)

add_executable(${PROJECT_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/main.asm
)

set_target_properties(${PROJECT_NAME}  PROPERTIES
    LINKER_LANGUAGE C
)

target_compile_options(${PROJECT_NAME} PRIVATE
    "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zi>"
    "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zf>"
    "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Sa>"
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    kernel32.lib
)

target_link_options(${PROJECT_NAME} PRIVATE
    "/ENTRY:main"
    "/SUBSYSTEM:CONSOLE"
    "/NODEFAULTLIB"
    "/$<$<CONFIG:Debug>:/DEBUG>"
)

# # # # # BYTE-LENGHT-PORG # # # # #

project(Byte_Lenghts_prog LANGUAGES C ASM_MASM)

add_executable(${PROJECT_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/Byte_Lenghts.asm
)

set_target_properties(${PROJECT_NAME}  PROPERTIES
    LINKER_LANGUAGE C
)

target_compile_options(${PROJECT_NAME} PRIVATE
    "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zi>"
    "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zf>"
    "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Sa>"
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    kernel32.lib
)

target_link_options(${PROJECT_NAME} PRIVATE
    "/ENTRY:main"
    "/SUBSYSTEM:CONSOLE"
    "/NODEFAULTLIB"
    "/$<$<CONFIG:Debug>:/DEBUG>"
)
