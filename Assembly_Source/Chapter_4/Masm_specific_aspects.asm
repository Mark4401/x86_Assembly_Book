option casemap:none

Extern ExitProcess:PROC

.data

; 64 bit - Unsigned Min and Max

Minimum_Byte    BYTE    00h					; 00h
Minimum_Word    WORD    0000h				; 0000h
Minimum_Dword   DWORD   00000000h			; 0000 0000h
Minimum_Qword   QWORD   0000000000000000h	; 0000 0000 0000 0000h

Maximum_Byte    BYTE    0FFh				; 0FFh
Maximum_Word    WORD    FFFFh				; 0FFFFh
Maximum_Dword   DWORD   FFFFFFFFh			; 0FFFF FFFFh
Maximum_Qword   QWORD   0FFFFFFFFFFFFFFFFh	; 0FFFF FFFF FFFF FFFFh

; 64 bit - Unsigned Min and Max

; 64 bit - Signed Min and Max

Signed_Minimum_Byte    SBYTE    80h					; 80h
Signed_Minimum_Word    SWORD    8000h				; 8000h
Signed_Minimum_Dword   SDWORD   80000000h			; 8000 0000h
Signed_Minimum_Qword   SQWORD   8000000000000000h	; 8000 0000 0000 0000h

Signed_Maximum_Byte    SBYTE    7Fh
Signed_Maximum_Word    SWORD    7FFFh
Signed_Maximum_Dword   SDWORD   7FFFFFFFh
Signed_Maximum_Qword   SQWORD   7FFFFFFFFFFFFFFFh

; 64 bit - Signed Min and Max

.code

Fundamental_Assembly_Elements PROC

    mov     eax, 0
    sub     rsp, 28h  ; shadow space + alignment

	mov		rcx, 0
    call    ExitProcess

Fundamental_Assembly_Elements ENDP
END

