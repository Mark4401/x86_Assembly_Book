.386
.model flat, stdcall
.stack 4092

ExitProcess PROTO, dwExitCode:DWORD

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
                                        ; `$` is used as the current possition the subtract the address from `My_String`

.code

main PROC

    mov eax, First_Val          ; EAX
    add eax, Second_Val
    add eax, Third_Val
    mov Sum, eax

    movzx eax, List_Size        ; MOVZX means = Move with Zero-Extend

    mov eax, 0
    movzx eax, String_Leng

    INVOKE ExitProcess, 0

main ENDP
END main
