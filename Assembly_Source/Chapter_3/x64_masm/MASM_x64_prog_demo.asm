option casemap:none

Extern ExitProcess:PROC

.data

    SUM_VAL QWORD ?

.code

MasmEntry PROC

    mov     rax, 5
    add     rax, 6
    mov     SUM_VAL, rax

    sub     rsp, 28h  ; shadow space + alignment
	
	mov		rcx, SUM_VAL
    call    ExitProcess

MasmEntry ENDP
END

