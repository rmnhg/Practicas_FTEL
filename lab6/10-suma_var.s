
.equ    stdout,   1
.equ    writeNum, 0x6b
.equ    halt,     0x11

          /*     num = num + 4; */

  ldr   r2,=num    ; //cargar puntero a "num"
  ldr   r1,[r2]    ; //carga indirecta de "num"
  add   r1,r1,#4   ; //sumar R1 + 4
  str   r1,[r2]    ; //guardar resultado en "num"

          /*     console.log(num); */

  mov   r0,#stdout ; //Salida a consola (stdout)
  swi   writeNum   ; //Escribir número

  swi   halt       ; //Finalizar ejecución

.data     /*     var num = 3; */
num:    .word 8
.end

