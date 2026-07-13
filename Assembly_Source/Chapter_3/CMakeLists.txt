cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
project(Basic_language_Elements LANGUAGES C ASM_MASM)

set(CMAKE_C_STANDARD_REQUIRED 17)

add_executable(${PROJECT_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/main.asm
)

set_target_properties(${PROJECT_NAME}  PROPERTIES
    LINKER_LANGUAGE C
)

target_compile_options(${PROJECT_NAME} PRIVATE
    "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zi>"
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    kernel32.lib
)

target_link_options(${PROJECT_NAME} PRIVATE
    "/ENTRY:main"
    "/SUBSYSTEM:CONSOLE"
    "/NODEFAULTLIB"
    "/$<CONFIG:Debug>"
)
