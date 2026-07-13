; ; ; ; ;  x86 version ; ; ; ;

 .model flat, stdcall
 option casemap:none

 EXTERN GetStdHandle@4:PROC
 EXTERN WriteConsoleA@20:PROC
 EXTERN ExitProcess@4:PROC

 .data
     msg     db "Hello world! from MASM - ASM", 0dh, 0ah
     msgLen  DWORD ($ - msg)

 .data?
     hStdOut  DWORD ?
     written  DWORD ?

 .code
 MainEntry PROC C                     ; PROC C keeps this symbol undecorated so /ENTRY:MainEntry still matches
     ; hStdOut = GetStdHandle(STD_OUTPUT_HANDLE)
     push -11                         ; arg1: STD_OUTPUT_HANDLE = -11 (pushed right-to-left, stdcall)
     call GetStdHandle@4
     mov hStdOut, eax                 ; stash hStdOut in .data? (no red-zone/shadow-space concept on x86)

     ; WriteConsoleA(hStdOut, msg, msgLen, &written, NULL)
     push 0                           ; arg5: lpReserved = NULL
     push OFFSET written              ; arg4: &lpNumberOfCharsWritten
     push msgLen                     ; arg3: nNumberOfCharsToWrite
     push OFFSET msg                  ; arg2: lpBuffer
     push hStdOut                     ; arg1: hConsoleOutput
     call WriteConsoleA@20            ; callee (stdcall) cleans all 5 pushed args off the stack

     ; ExitProcess(0)
     push 0                           ; exit code 0
     call ExitProcess@4
     ret                              ; unreachable  ExitProcess never returns  kept for symmetry
 MainEntry ENDP
 END MainEntry

