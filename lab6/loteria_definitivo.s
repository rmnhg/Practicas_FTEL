.equ    stdout,      1
.equ    timer,       0x6d
.equ    writeNum,    0x6b
.equ    writeString, 0x69
.equ    halt,        0x11

  /*  Generar número aleatorio entre 0 y 255:
  var num = Math.random();     // Entre 0 y 1
  num = Math.floor(num * 256); // Entre 0 y 255 */
start:
  swi   timer       ; //Número de milisegundos a R0
  and   r0,r0,#0xFF ; //Aplicar máscara que deja 8 últimos bits
  ldr   r4,=num     ; //Cargar puntero a variable num en R4
  str   r0,[r4]     ; //Guardar número aleatorio (en R0) en num
  add   r9,r0,#0    ; //Almaceno el número en R9

  /*  var str = "\nLo sentimos, no hay premio."; */
  ldr   r1,=SinPremio ; //Cargar puntero a msj: SinPremio en R0

  /*  if (num < 64) { probabilidad=25% (64/256) */
  ldr   r0,[r4]     ; //restaurar num en R0
  cmp   r0,#64      ; //R0 < 64 (probabilidad=25%)
  bge   seguir      ; //Saltar si mayor o igual que 64

  /*  else {str = "\nHa ganado 10 Euros."; */
  ldr   r1,=Premio 	  ; //Cargar puntero a msj: Premio en R0

  /* } // Etiqueta seguir: permite saltar fuera del bloque */
seguir:
  /*  console.log(str); */
  mov  r0,#stdout   ; //Salida a consola (stdout)
  swi  writeString  ; //writeString

  /*  console.log("Numero: " + num); */
  ldr  r1,=StringNum ; //Cargar en r1 la variable num
  swi  writeString   ; //writeString
  add  r1,r9,#0      ; //Saco el número de R9
  swi  writeNum      ; //writeNum

final:
  swi   halt        ; //Finalizar ejecución


.data ;    /*  definición de variables y mensajes    */
num:        .word  0  ; //variable num
StringNum:	.asciz "Numero: "
Premio:     .asciz "Ha ganado 10 Euros.\n"
SinPremio:  .asciz "Lo sentimos, no hay premio.\n"
.end
