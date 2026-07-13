# Cmake CLI options when compiling
# cmake -S . -B ./build/Demo_Asm_build_x64 -G "Ninja" -DCMAKE_BUILD_TYPE=Debug -DBUILD_x64_ONLY=ON
# cmake -S . -B ./build/Demo_Asm_build_x86 -G "Ninja" -DCMAKE_BUILD_TYPE=Debug -DBUILD_x86_ONLY=ON

cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
project(MASM_Env_Repo_book LANGUAGES C ASM_MASM)

option(BUILD_x64_ONLY "Configure only the x64 target" OFF)
option(BUILD_x86_ONLY "Configure only the x86 target" ON)

if(BUILD_x64_ONLY AND BUILD_x86_ONLY)
	message(FATAL_ERROR "Specify at most one of the following BUILD_x64_ONLY / BUILD_x86_ONLY!")
endif()

function(MASM_ARCH_TARGET Name_Arch Masm_File_or_Files)
	add_executable(${Name_Arch} ${Masm_File_or_Files})
	set_target_properties(${Name_Arch} PROPERTIES LINKER_LANGUAGE C)
	target_compile_options(${Name_Arch} PRIVATE
		"$<$<COMPILE_LANGUAGE:ASM_MASM>:/Zi>")
	target_link_libraries(${Name_Arch} PRIVATE kernel32.lib)
	target_link_options(${Name_Arch} PRIVATE
		"/ENTRY:MainEntry"
		"/SUBSYSTEM:CONSOLE"
		"/NODEFAULTLIB"
		"/$<CONFIG:Debug>"
	)
endfunction()

if(NOT BUILD_x64_ONLY)
	MASM_ARCH_TARGET(MASM_Env_Repo_book_86 "${CMAKE_CURRENT_SOURCE_DIR}/MASM_demo_x86.asm")
endif()
if(NOT BUILD_x86_ONLY)
	MASM_ARCH_TARGET(MASM_Env_Repo_book_64 "${CMAKE_CURRENT_SOURCE_DIR}/MASM_demo_x64.asm")
endif()

# --------------------------------------------------------------------------------------------------- #

# # # # # OLD CMAKE VERSION CONFIG # # # # #

#
# add_executable(${PROJECT_NAME}
# 	${CMAKE_CURRENT_SOURCE_DIR}Assembly_Source/Main_64.asm
# )
#
# set_target_properties(${PROJECT_NAME}  PROPERTIES
#  	LINKER_LANGUAGE C
# )
#
# target_link_libraries(${PROJECT_NAME} PRIVATE
# 	kernel32.lib
# )
#
# target_link_options(${PROJECT_NAME} PRIVATE
# 	"/ENTRY:MainEntry"
# 	"/SUBSYSTEM:CONSOLE"
#  	"/NODEFAULTLIB"
# )
#
#
# project(MASM_Env_Repo_book_86 LANGUAGES C ASM_MASM)
#
# add_executable(${PROJECT_NAME}
# 	${CMAKE_CURRENT_SOURCE_DIR}Assembly_Source/Main_86.asm
# )
#
# set_target_properties(${PROJECT_NAME}  PROPERTIES
#  	LINKER_LANGUAGE C
# )
#
# target_link_libraries(${PROJECT_NAME} PRIVATE
# 	kernel32.lib
# )
#
# target_link_options(${PROJECT_NAME} PRIVATE
# 	"/ENTRY:MainEntry"
# 	"/SUBSYSTEM:CONSOLE"
#  	"/NODEFAULTLIB"
# )
#

# # # # # OLD CMAKE VERSION CONFIG # # # # #
