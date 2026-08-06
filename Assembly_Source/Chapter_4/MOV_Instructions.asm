.386
.model flat, stdcall
.stack 4092

ExitProcess PROTO, dwExitCode:DWORD

.data

Word_Val_1  WORD 1000h
Word_Val_2  WORD 2000h

;   8 bit element array i.e. offset by 1 bytes which equates to 8 bits for every element in the array.
Byte_Array  BYTE    10h, 20h, 30h, 40h, 50h

;   16 bit element array i.e. offset by 2 bytes which equates to 16 bits for every element in the array.
Word_Array  WORD    100h, 200h, 300h

;   32 bit element array i.e. offset by 4 bytes which equates to 16 bits for every element in the array.
Dword_Array  DWORD  1000h, 2000h, 3000h

.code

MOV_Instructions PROC
    ;  Demonstrating MOVZX instruction:

    mov     bx,  0A69Bh
    movzx   eax, bx         ; EAX = 0000A69Bh
    movzx   ebx, bl         ; EBX = 0000009Bh
    movzx   cx,  bl         ; CX  = 009Bh

    mov     eax, 0
    mov     ebx, 0
    mov     ecx, 0
    mov     edx, 0

    ; Demonstrating MOVSX instruction
    mov     bx,  0A96Bh
    movsx   eax, bx         ; EAX = FFFFA96Bh
    movsx   edx, bl         ; EDX = FFFFFF6Bh
    mov     bl,  78h
    movsx   cx,  bl         ; CX = 007Bh

    mov     eax, 0
    mov     ebx, 0
    mov     ecx, 0
    mov     edx, 0

    ; Memory-to-memory exchange:
    mov     ax,  Word_Val_1 ; AX = 1000h
    xchg    ax,  Word_Val_2 ; Ax = 2000h, Word_Val_2 = 1000h
	; `XCHG` operand rotates the data within the register & Variable from one to the other.
	; i.e. Data swapping information, data, address, offsets, etc....

    ; Direct-Offset Addressing (byte array):
    ; BYTE Example;
    mov     eax, 0
    mov     al, Byte_Array
    mov     al, [Byte_Array + 1]
    mov     al, [Byte_Array + 2]
    mov     al, [Byte_Array + 3]
    mov     al, [Byte_Array + 4]

    ; WORD Example:
    mov     eax, 0
    mov     ax, Word_Array          ; 100h
    mov     ax, [Word_Array + 2]    ; 200h
    mov     ax, [Word_Array + 4]    ; 300h

    ; DWORD Example:
    mov     eax, 0
    mov     eax, Dword_Array          ; 1000h
    mov     eax, [Dword_Array + 4]    ; 2000h
    mov     eax, [Dword_Array + 8]    ; 3000h
    mov     eax, 0
    ; END of Array distillation


	mov     eax, 0
    ; sub     rsp, 28h  ; shadow space + alignment

	; mov		ecx, 0
    INVOKE  ExitProcess, 0

MOV_Instructions ENDP
END

