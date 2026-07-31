# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(Chapters_4_x86 LANGUAGES C ASM_MASM)

function(Chapter_4_Directives_and_usecase Program_name Program_files Program_entry_name)

    add_executable(${Program_name} ${Program_files})
    set_target_properties(${Program_name} PROPERTIES LINKER_LANGUAGE C)
    target_compile_options(${Program_name} PRIVATE
        "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zi>"
        "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zf>"
        "$<$<COMPILE_LANGUAGE:ASM_MASM>:/Sa>"
    )
    target_link_libraries(${Program_name} PRIVATE kernel32.lib ${Invine_libs})
    target_link_options(${Program_name} PRIVATE
        "/ENTRY:${Program_entry_name}"
        "/SUBSYSTEM:CONSOLE"
        "/NODEFAULTLIB"
        "$<$<CONFIG:Debug>:/DEBUG>"
    )

endfunction()

Chapter_4_Directives_and_usecase(Adding_extern_functions_vghjkl
    Adding_extern_functions.asm
    "main_other"
)
