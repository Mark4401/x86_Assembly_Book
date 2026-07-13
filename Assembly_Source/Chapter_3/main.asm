; ; ; ; ; Basic_language_Elements ; ; ; ; ;

.386
.model flat, stdcall
.stack 4092

ExitProcess PROTO, dwExitCode:DWORD

.data

sum DWORD 0

.code

main PROC

    mov eax, 6
    add eax, 5
    mov sum, eax

    INVOKE ExitProcess, 0

main ENDP
END main
