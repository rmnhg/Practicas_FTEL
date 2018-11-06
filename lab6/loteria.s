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

  /*  var str = "\nLo sentimos, no hay premio."; */
  ldr   r5,=str       ; //Cargar puntero a variable str en R5
  ldr   r0,=SinPremio ; //Cargar puntero a msj: SinPremio en R0
  str   r0,[r5]       ; //Guardar puntero (en R0) en variable str

  /*  if (num < 64) { probabilidad=25% (64/256) */
  ldr   r0,[r4]     ; //restaurar num en R0
  cmp   r0,#64      ; //R0 < 64 (probabilidad=25%)
  bge   seguir      ; //Saltar si mayor o igual que 64

  /*  else {str = "\nHa ganado 10 Euros."; */
  ldr   r0,=Premio 	  ; //Cargar puntero a msj: Premio en R0

  /* } // Etiqueta seguir: permite saltar fuera del bloque */
seguir:
  /*  console.log(str); */
  ldr  r1,=str      ; //Carga en r1 la variable str
  mov  r0,#stdout   ; //Salida a consola (stdout)
  swi  writeString  ; //writeString

  /*  console.log("Numero: " + num); */
  ldr  r5,=StringNum ; //Cargar puntero a msj: StringNum en R0
  ldr  r1,=str       ; //Cargar en r1 la variable num
  swi  writeString   ; //writeString
  /*
  mov  r1,#num
  swi  writeNum     ; //writeNum
  */

final:
  swi   halt        ; //Finalizar ejecución


.data ;    /*  definición de variables y mensajes    */
num:        .word  0  ; //variable num
str:        .word  0  ; //variable str
StringNum:	.asciz "\nNumero: "
Premio:     .asciz "\nHa ganado 10 Euros.\n"
SinPremio:  .asciz "\nLo sentimos, no hay premio.\n"
.end
