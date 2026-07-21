.386
.model flat, stdcall
.stack 4092

ExitProcess PROTO, dwExitCode:DWORD

; EQU declarations can be set here!

PI EQU <3.1416>

.data

First_Val  DWORD 20002000h
Second_Val DWORD 11111111h
Third_Val  DWORD 22222222h
Sum        DWORD ?

                                ; ? can be used over the decimal 0 to initialized it.
                                ; Creating uninitialized data declaration for 16-bit, 8-bit unsigned, 8-bit signed
Val_16_bit_signed SWORD 0FFFFh
Val_8_bit_unsgied BYTE  0FFh
Val_8_bit_signed  SBYTE 0FFh
Val_64_bit        QWORD 0FFFFFFFFFFFFFFFFh

List       BYTE 10, 20, 30, 40
List_Size  WORD ($ - List)

My_String BYTE "This is a long string, containing"
          BYTE "any number of Characters"

String_Leng BYTE ($ - My_String)        ; This method can be used to find the length of an String way more simply
                                        ; Than manually counting it.
                                        ; `$` is used as the current position the subtract the address from `My_String`


List_word_array         WORD 1000h, 2000h, 3000h, 4000h
List_word_array_Size    WORD ($ - List_word_array) / 2          ; Always divide by bytes in size
                                                                ; This case being a `WORD` size array equates to a 16 bits

List_dword_array       DWORD 10000000h, 20000000h, 30000000h, 40000000h
List_dword_array_Size  DWORD ($ - List_dword_array) / 4          ; Always divide by bytes in size
                                                                ; This case being a `DWORD` size array equates to a 32 bits

PI_Val DWORD PI

.code

main PROC

    mov eax, First_Val          ; EAX
    add eax, Second_Val
    add eax, Third_Val
    mov Sum, eax

    movzx eax, List_Size        ; MOVZX means = Move with Zero-Extend

    mov eax, 0
    movzx eax, String_Leng

    mov eax, 0
    movzx eax, List_word_array_Size

    mov eax, 0
    mov eax, List_dword_array_Size      ; Since the DWORD size equates to 32 bits, theirs no need to use MOVZX at this size

    mov eax, 0
    mov eax, PI_Val

    INVOKE ExitProcess, 0

main ENDP
END main
