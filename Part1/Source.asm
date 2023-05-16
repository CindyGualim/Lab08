; -----------------------------------------------
; UNIVERSIDAD DEL VALLE DE GUATEMALA 
; Organización de computadoras y Assembler
; Seciòn 30
; Ciclo 1 - 2023
;
; Nombre: Lab08.asm
; Descripción: Programa Laboratorio 8, 
;			segundo laboratorio programado.
; Autor: Cindy Mishelle Gualim Pérez
;       
;
; EAX: Evaluador de regimen apropiado en SAT y obligaciones fiscales
; ----------------------------------------------- */
.386
.model flat, stdcall, c

.stack 4096
;ExitProcess proto,dwExitCode:dword

.data

    IvaT DW 20
    total DD 0 

    jun22 DW 1300
    ivajun22 DD ?
    jul22 DW 800
    ivajul22 DD ?
    ago22 DW 522
    ivaago22 DD ?
    sep22 DW 200
    ivasep22 DD ?
    oct22 DW 600
    ivaoct22 DD ?
    nov22 DW 798
    ivanov22 DD ?
    dic22 DW 5000
    ivadic22 DD ?
    ene23 DW 850
    ivaene23 DD ?
    feb23 DW 1160
    ivafeb23 DD ?
    mar23 DW 1200
    ivamar23 DD ?
    abr23 DW 5100
    ivaabr23 DD ?
    may23 DW 9100
    ivamay23 DD ?
   
    msg1 byte "Junio 2022 facturado: 1300  IVA: %d",0Ah,0
    msg2 byte "Julio 2022 facturado: 800  IVA: %d",0Ah,0
    msg3 byte "Agosto 2022 facturado: 522  IVA: %d",0Ah,0
    msg4 byte "Septiembre 2022 facturado: 200  IVA: %d",0Ah,0
    msg5 byte "Octubre 2022 facturado: 600  IVA: %d",0Ah,0
    msg6 byte "Noviembre 2022 facturadao: 798  IVA: %d",0Ah,0
    msg7 byte "Diciembre 2022 facturadao: 5000  IVA: %d",0Ah,0
    msg8 byte "Enero 2023 facturadao: 850  IVA: %d",0Ah,0
    msg9 byte "Febrero 2023 facturadao: 1160  IVA: %d",0Ah,0
    msg10 byte "Marzo 2023 facturadao: 1200  IVA: %d",0Ah,0
    msg11 byte "Abril 2023 facturadao: 5100  IVA: %d",0Ah,0
    msg12 byte "Mayo 2023 facturadao: 9100  IVA: %d",0Ah,0

    msgT13 byte "Monto total de los 12 meses es de: Q%d",0Ah,0  ; total del monto
    msgC14 byte "Se le sugiere mantenerse en pequeno contribuyente" ,0Ah,0; Si el monto es menor a Q150,000.00 
    msgG15 byte "Se le sugiere cambiar a IVA General",0Ah,0 ; Si el monto se excede los Q150,000.00 
    

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib
includelib msvcrt.lib

extrn printf:near
extrn exit:near


public main
main proc

; Junio 2022 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, jun22
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivajun22,eax

    push dword ptr [ivajun22]
    push offset msg1
    call printf
    push 0

; Julio 2022 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, jul22
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivajul22,eax

    push dword ptr [ivajul22]
    push offset msg2
    call printf

; Agosto 2022 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, ago22
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivaago22,eax

    push dword ptr [ivaago22]
    push offset msg3
    call printf

; Septiembre 2022 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, sep22
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivasep22,eax

    push dword ptr [ivasep22]
    push offset msg4
    call printf

; Octubre 2022 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, oct22
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivaoct22,eax

    push dword ptr [ivaoct22]
    push offset msg5
    call printf
     
; Noviembre 2022 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, nov22
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivanov22,eax

    push dword ptr [ivanov22]
    push offset msg6
    call printf

; Diciembre 2022 ---------------------------------
    mov eax,0
    mov ebx,0

    mov ax, dic22
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivadic22,eax

    push dword ptr [ivadic22]
    push offset msg7
    call printf
    
; Enero 2023 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, ene23
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivaene23,eax

    push dword ptr [ivaene23]
    push offset msg8
    call printf

; Febrero 2023 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, feb23
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivafeb23,eax

    push dword ptr [ivafeb23]
    push offset msg9
    call printf

; Marzo 2023 ---------------------------------
    
    mov eax,0
    mov ebx,0

    mov ax, mar23
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivamar23,eax

    push dword ptr [ivamar23]
    push offset msg10
    call printf

; Abril 2023 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, abr23
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivaabr23,eax

    push dword ptr [ivaabr23]
    push offset msg11
    call printf

; Mayo 2023 ---------------------------------

    mov eax,0
    mov ebx,0

    mov ax, may23
    mov bx, 20
    mov dx, 0
    div bx; Realizar division 
    mov ivamay23,eax

    push dword ptr [ivamay23]
    push offset msg12
    call printf


; Suma del Monto total ---------------------------------

    mov ax,jun22
    add ax,jul22
    add ax,ago22
    add ax,sep22
    add ax,oct22
    add ax,nov22
    add ax,dic22
    add ax,ene23
    add ax,feb23
    add ax,mar23
    add ax,abr23
    add ax,may23
    mov total,eax

    push dword ptr [total]
    push offset msgT13
    call printf
    push 0
    
    ; Comparar el monto 
    mov eax, total
    cmp eax, 150000

    ; Saltar a "esMayor" si el valor es mayor que 150,000
    jg esMayor

    ; Imprimir  "pequeño contribuyente"
    push offset msgC14
    call printf
    add esp, 7

    jmp salir

esMayor:
    ; Imprimir mensaje para "IVA General"
    push offset msgG15
    call printf
    add esp, 7



;para salir precionar 1
salir:

    push 1
    call exit


main endp
end