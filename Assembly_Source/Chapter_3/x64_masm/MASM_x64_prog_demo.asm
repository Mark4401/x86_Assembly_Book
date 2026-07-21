 option casemap:none

EXTERN ExitProcess:PROC

 .data

    Sum QWORD 0

 .code

 main PROC

    sub rsp, 40
    mov rax, 5
    add rax, 6
    mov Sum, rax

    mov rcx, 0

    call ExitProcess

 main ENDP
 END
