option casemap:none

Extern ExitProcess:PROC

.data

; 64 bit - Unsigned Min and Max

Minimum_Byte    BYTE    00h					; 00h
Minimum_Word    WORD    0000h				; 0000h
Minimum_Dword   DWORD   00000000h			; 0000 0000h
Minimum_Qword   QWORD   0000000000000000h	; 0000 0000 0000 0000h

Maximum_Byte    BYTE    0FFh				; 0FFh
Maximum_Word    WORD    0FFFFh				; 0FFFFh
Maximum_Dword   DWORD   0FFFFFFFFh			; 0FFFF FFFFh
Maximum_Qword   QWORD   0FFFFFFFFFFFFFFFFh	; 0FFFF FFFF FFFF FFFFh

; 64 bit - Unsigned Min and Max

; 64 bit - Signed Min and Max

Signed_Minimum_Byte    SBYTE    80h					; 80h
Signed_Minimum_Word    SWORD    8000h				; 8000h
Signed_Minimum_Dword   SDWORD   80000000h			; 8000 0000h
Signed_Minimum_Qword   SQWORD   8000000000000000h	; 8000 0000 0000 0000h

Signed_Maximum_Byte    SBYTE    7Fh                 ; 7Fh
Signed_Maximum_Word    SWORD    7FFFh               ; 7FFFh
Signed_Maximum_Dword   SDWORD   7FFFFFFFh           ; 7FFF FFFFh
Signed_Maximum_Qword   SQWORD   7FFFFFFFFFFFFFFFh   ; 7FFF FFFF FFFF FFFFh

; 64 bit - Signed Min and Max

COMMENT !
    Comment 1.
    Comment 2.
!

; BCD | Binary Coded decimal

Int_Val_Tbyte       TBYTE   0FFFFFFFFFFFFFFFFFFFFh      ; 0FFFF FFFF FFFF FFFF FFFFh
Tbyte_Size_Test     TBYTE   ?
Pos_val             REAL8   1.5
Bcd_Val             TBYTE   ?
; BCD | Binary Coded decimal

; Defining Floating-Point Types

Val_1_Real  REAl4       -1.2
Val_2_Real  REAl8       3.2E-260
Val_3_Real  REAl10      4.6E+4096
Val_4_Real  REAl4       20 DUP(0.0)

; Defining Floating-Point Types

; Declaring Uninitialized Data

Small_Array DWORD   10 DUP(0)       ; 40 Bytes
Big_Array   DWORD   5000 DUP(?)     ; 20,000 Bytes, Not Initialized

; Declaring Uninitialized Data

Int_Val_Real_10     TBYTE   800000000000001234h

.code

Fundamental_Assembly_Elements PROC

    fld     Pos_val
    fbstp   Bcd_Val
    mov     eax, 0
    sub     rsp, 28h  ; shadow space + alignment

	mov		rcx, 0
    call    ExitProcess

Fundamental_Assembly_Elements ENDP
END

