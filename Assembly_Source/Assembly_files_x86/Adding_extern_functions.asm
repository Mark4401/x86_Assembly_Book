.386
.model flat, stdcall
.stack 4092

ExitProcess PROTO, dwExitCode:DWORD
WriteHex    PROTO

.code

main_other PROC

    mov eax, -7532954
    call WriteHex

    mov eax, 0
	mov eax, WriteHex

    INVOKE ExitProcess, 0

main_other ENDP
END
