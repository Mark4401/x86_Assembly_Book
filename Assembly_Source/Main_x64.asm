; ; ; ; ;  x86_64 version ; ; ; ;

 option casemap:none

 EXTERN GetStdHandle:PROC
 EXTERN WriteConsoleA:PROC
 EXTERN ExitProcess:PROC

 .data
     msg     db "Hello world! from MASM - ASM", 0dh, 0ah
     msgLen  DWORD ($ - msg)

 .code

 MainEntry PROC
     sub rsp, 58h                     ; shadow space + 5th-arg slot + locals, keeps 16-byte alignment before each call

                                      ; hStdOut = GetStdHandle(STD_OUTPUT_HANDLE)
     mov ecx, -11                     ; STD_OUTPUT_HANDLE = -11
     call GetStdHandle
     mov [rsp+28h], rax               ; stash hStdOut in a local slot

     ; WriteConsoleA(hStdOut, msg, msgLen, &written, NULL)
     mov rcx, [rsp+28h]               ; arg1: hConsoleOutput
     lea rdx, msg                     ; arg2: lpBuffer
     mov r8d, msgLen                  ; arg3: nNumberOfCharsToWrite
     lea r9, [rsp+30h]                ; arg4: &lpNumberOfCharsWritten (scratch slot)
     mov qword ptr [rsp+20h], 0       ; arg5: lpReserved = NULL (passed on stack, Win64 ABI)
     call WriteConsoleA

     ; ExitProcess(0)
     xor ecx, ecx                     ; exit code 0
     call ExitProcess

     add rsp, 58h                     ; unreachable — ExitProcess never returns — kept for symmetry
     ret
 MainEntry ENDP

 END




