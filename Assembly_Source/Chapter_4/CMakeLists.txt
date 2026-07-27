cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
set(CMAKE_C_STANDARD_REQUIRED 17)
# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(Chapter_4 LANGUAGES C ASM_MASM)

function(Chapter_4_Directives_and_usecase Program_name Program_files Program_entry_name)

    add_executable(${Program_name} ${Program_files})
    set_target_properties(${Program_name} PROPERTIES LINKER_LANGUAGE C)
    target_compile_options(${Program_name} PRIVATE
        "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zi>"
        "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zf>"
        "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Sa>"
    )
    target_link_libraries(${Program_name} PRIVATE kernel32.lib)
    target_link_options(${Program_name} PRIVATE
        "/ENTRY:${Program_entry_name}"
        "/SUBSYSTEM:CONSOLE"
        "/NODEFAULTLIB"
        "/$<$<CONFIG:Debug>:/DEBUG>"
    )

endfunction()

Chapter_4_Directives_and_usecase(Data_Transfer_Addressing_and_Arithmetic
    Data_Transfer_Addressing_and_Arithmetic.asm
    "Memory_Entry"
)

Chapter_4_Directives_and_usecase(Assembly_Basics
    Masm_specific_aspects.asm
    "Fundamental_Assembly_Elements"
)
