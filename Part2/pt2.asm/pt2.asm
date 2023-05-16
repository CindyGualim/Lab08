; -----------------------------------------------
; UNIVERSIDAD DEL VALLE DE GUATEMALA 
; Organizaci�n de computadoras y Assembler
; Seci�n 30
; Ciclo 1 - 2023
;
; Nombre: Lab08.asm
; Descripci�n: Programa Laboratorio 8, 
;			segundo laboratorio programado.
; Autor: Cindy Mishelle Gualim P�rez
;        Sebastian Espinal
;       
; EAX: preclasificador de prestamos bancarios
; ----------------------------------------------- */
.386
.model flat, stdcall, c


.stack 4096
ExitProcess proto,dwExitCode:dword

.data
noAplica DWORD 0


nameApe db "Nombre y Apellido               Cindy Gualim ", 0Ah, 0
edad db 20
age byte "Edad                            %d                   OK", 0Ah, 0
montoSoli dd 30000
MontoPS byte "Monto solicitado                Q%d", 0Ah, 0
ingresosAge dw 20000
mensualidad byte "Ingresos mensuales              Q%d               OK", 0Ah, 0
calificacion dd "A" ; Excelente, "B" para bueno, "C" para regular, "D" para malo, "E" para fatal, 0Ah, 0
aprov db "Aprobado", 0
noAprov db "No Aprobado", 0
ageEL dd 3
mesesEL byte "Meses de estabilidad laboral    %d                    OK", 0Ah, 0
calificacionSIB byte "Calificacion promedio SIB:                           OK", 0Ah, 0

msg1 byte "Datos                           Valor                Aprobado ", 0Ah, 0
msg2Aprov db "OK", 0
msg3NoAprov db "NO", 0
msg4Aprobacion db "prestamo aprobado", 0



.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near



public main
main proc


push OFFSET msg1
call printf

push OFFSET nameApe
call printf


;Edad------------------------------------------------------------------
;Verificar edad mayor o igual a 18 a�os
.IF byte ptr [edad] >= 18
    mov edx, OFFSET aprov
    push OFFSET msg2Aprov 
.ELSE
    mov edx, OFFSET noAprov
.ENDIF

movzx eax, byte ptr [edad] ; Ampliar el byte a un word
push eax
push OFFSET age
call printf
add esp, 8



;400%------------------------------------------------------------------
;Verificar monto solicitado menor o igual a 400% del salario actual
mov ax, [ingresosAge] 
mov ebx, [montoSoli] 
mov ecx, 400         
mul ecx              
cmp ebx, eax         
.IF ingresosAge 
    mov edx, OFFSET aprov
.ELSE                
    mov edx, OFFSET noAprov
    mov noAplica, 1
.ENDIF

lea eax, [MontoPS]
mov ebx, [montoSoli]
push ebx
push eax
call printf
add esp, 8

lea eax, [mensualidad]
push eax
movzx eax, word ptr [ingresosAge]
push eax
push OFFSET mensualidad
call printf
add esp, 12 ; Limpiar la pila despu�s de la llamada a printf




;1 a�o------------------------------------------------------------------
;Verificar al menos 1 a�o de estabilidad laboral
mov eax, [ageEL]
.IF eax >= 1
    mov edx, OFFSET aprov
.ELSE    
    mov edx, OFFSET noAprov
.ENDIF  

mov eax, [ageEL] 
push eax         
lea eax, [mesesEL] 
push eax         
call printf      
add esp, 8       


;Calificaci�n------------------------------------------------------------------
;Verificar calificaci�n en Super Intendencia de Bancos es "A"
mov eax, [calificacion]
cmp eax, "A"

.IF calificacion == "A"
    mov byte ptr [calificacionSIB+27], "A"
    mov edx, OFFSET aprov
.ELSE
    mov byte ptr [calificacionSIB+27], "E"
    mov edx, OFFSET noAprov
.ENDIF

push OFFSET calificacionSIB
call printf
add esp, 4

push OFFSET msg4Aprobacion
call printf

RET

salir:

    push 1
    call exit


main endp
end