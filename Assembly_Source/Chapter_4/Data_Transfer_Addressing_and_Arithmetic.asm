option casemap:none

Extern ExitProcess:PROC

.data
    Var_1   WORD ?
    Var_2   WORD ?

    ; Overlapping Memory_Entry
    One_Byte   BYTE   78h
    One_Word   WORD   1234h
    One_Dword  DWORD  12345678h

    ; Data transfer from smallest to largest registers
    Count   WORD    1

    ;Signed - Data transfer from smallest to largest registers
    Singed_Val  SWORD  -16         ; FFF0h

    ; MOVZX Instruction variable
    Byte_Val    BYTE    10001111b       ; NOTE! XXXXXX<B noation for Binary definition>

    ; MOVSX Instruction variable
    ; Direct-Offset Operands

    Byte_Array BYTE     10h, 20h, 30h, 40h
.code

Memory_Entry PROC

    ; mov     ax, Var_1
    ; mov     Var_2, ax
    ; Overlapping Memory_Entry

	; NOTE! eax, ax, al are the same physical register but diff sizes.

    ; mov     eax, 0           ; EAX = 00000000h
    ; mov     al, One_Byte     ; EAX = 00000078h
    ; mov     ax, One_Word     ; EAX = 00001234h
    ; mov     eax, One_Dword   ; EAX = 12345678h
    ; mov     ax, 0            ; EAX = 12340000h

    mov     eax, 0           ; EAX = 00000000h
    mov     al, One_Byte     ; EAX = 00000078h
    mov     ax, One_Word     ; EAX = 00001234h
    mov     eax, One_Dword   ; EAX = 12345678h
    mov     ax, 0            ; EAX = 12340000h

    ; Data transfer from smallest to largest registers

    mov     ecx, 0
    mov     cx, Count

    ; Signed - Data transfer from smallest to largest registers

    mov     ecx, 0
    mov     cx, Singed_Val     ; ECX = 0000FFF0h i.e. (+65,520)
    ; Overlapping Memory_Entry

    ; MOVZX Instruction variable | ZX ==> Zero extended
    mov     eax, 0
    movzx   ax, Byte_Val       ; 0000000010001111b i.e. 16 bit binary value i.e. | Byte_Val	143 ''	unsigned char | 0x8F in Hex notation

    ;   EDX, EAX

    mov     edx, 0
    mov     eax, 0

    ; Direct-Offset Operands
    mov     al, Byte_Array          ; 10h
    mov     al, [Byte_Array + 1]    ; 20h
    mov     al, [Byte_Array + 2]    ; 30h
    mov     al, [Byte_Array + 3]    ; 40h

    ;   EDX, EAX

    mov     eax, 0
    sub     rsp, 28h  ; shadow space + alignment

	mov		rcx, 0
    call    ExitProcess

Memory_Entry ENDP
END

