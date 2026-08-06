.386
.model flat, stdcall
.stack 4092

ExitProcess PROTO, dwExitCode:DWORD
WriteHex    PROTO

.data
Byte_Val    SBYTE    10000000b

.code

main_other PROC

    movzx eax,    Byte_Val

    call WriteHex

    mov eax, 0
	mov eax, WriteHex

    INVOKE ExitProcess, 0

main_other ENDP
END
