
/* Ejemplo con llamadas al S.O. */

.equ  numA,9
.equ  numB,7
.equ  stdout,1

mov   r2,#numA
mov   r3,#numB
add   r1,r2,r3   ; //resultado en R1


mov   r0,#stdout ; //salida a consola
swi   0x6b  ; //Escribe número en consola


swi   0x11   ; //HALT: detiene el programa
.end


