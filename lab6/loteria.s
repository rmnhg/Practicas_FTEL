.equ    stdout,      1
.equ    timer,       0x6d
.equ    writeNum,    0x6b
.equ    writeString, 0x69
.equ    halt,        0x11

start:
  /* 
  Genera un número aleatorio entre 0 y 255:
  var num = Math.random();      Entre 0 y 1
  num = Math.floor(num * 256);  Entre 0 y 255
  */
  swi   timer       ; //Pasa el tiempo en milisegundos a R0
  and   r0,r0,#0xFF ; //Aplica una máscara que deja los 8 últimos bits, éste será nuestro número aleatorio
  ldr   r4,=num     ; //Carga la variable "num" en R4 -> R4=4204 => [R4]=0
  str   r0,[r4]     ; //Guarda el número aleatorio (que está en R0) en el módulo de R4 (valor de la variable "num") R0=nºaleatorio->[R4]

  /*  var str = "\nLo sentimos, no hay premio\n"; */
  ldr   r5,=str       ; //Carga la variable "str" en R5 -> R5=4204
  ldr   r0,=SinPremio ; //Carga la variable "SinPremio" en R0 -> R0=4123
  str   r0,[r5]       ; //Guarda la frase (de R0) en el módulo de R5 (contenido de la variable "str") R0=frase->[R5]=str

  /*  var StringNum = "Numero: "; */
  ldr   r6,=StringNum ; //Carga la variable "StringNum" en R6 -> R6=4123

  /*  var Nombre = "Ramon Hernandez Garcia - G15 FTEL | 14/11/18\n"; */
  ldr   r7,=Nombre    ; //Carga la variable "Nombre" en R7 -> R7=4123

  /*  if (num < 64) { // probabilidad=25% (64/256)*/
  ldr   r0,[r4]     ; //Restaura el número aleatorio (contenido en [R4]) en R0 -> R0=nºaleatorio
  cmp   r0,#64      ; //R0 < 64 (probabilidad=25%)
  bge   seguir      ; //Lo salta si el número es >= 64 (R0 >= 64)

  /*  else {str = "\nHa ganado 10 Euros!\n";} //*/
  ldr   r5,=str        ; //Carga la variable "str" en R5 -> R5=4204
  ldr   r0,=Premio    ; //Carga la variable "Premio" en R0 -> R0=4123
  str   r0,[r5]       ; //Guarda la frase (de R0) en el módulo de R5 (contenido de la variable "str") R0=frase->[R5]=str

  /* } // Etiqueta seguir: permite saltar fuera del bloque */
seguir:

  /*  console.log(Nombre); */
  mov r1,r7         ; ///Guarda la frase de R7 (contenido de la variable "Nombre") en R1 -> R7=Nombre -> R1
  mov r0,#stdout    ; //Manda un 1 (#stdout = 1) a R0 para que el comando siguiente (writeString) funcione
  swi writeString   ; //Escribe la frase contenida en R1

  /*  console.log(str); */
  ldr r1,[r5]       ; //Guarda la frase del módulo de R5 (contenido de la variable "str") en R1 -> [R5]=str -> R1
  mov r0,#stdout    ; //Manda un 1 (#stdout = 1) a R0 para que el comando siguiente (writeString) funcione
  swi writeString   ; //Escribe la frase contenida en R1

  /*  console.log(StringNum); */
  mov r1,r6        ; //Guarda la frase de R6 (contenido de la variable "StringNum") en R1 -> R6=StringNum -> R1
  mov r0,#stdout    ; //Manda un 1 (#stdout = 1) a R0 para que el comando siguiente (writeString) funcione
  swi writeString   ; //Escribe la frase contenida en R1

  /*  console.log(num); */
  ldr r1,[r4]       ; //Guarda el número del módulo de R4 (valor de la variable "num") en R1 ->[R4]=num->R1
  mov r0,#stdout    ; //Manda un 1 (#stdout = 1) a R0 para que el comando siguiente (writeNum) funcione
  swi writeNum      ; //Escribe la frase contenida en R1

final:
  swi   halt          ; //Detiene el programa


.data
/*  Definición de variables y mensajes  */
num:        .word 0    ; //variable num
str:        .word 0    ; //variable str

Premio:     .asciz "\nHa ganado 10 Euros!"
SinPremio:  .asciz "\nLo sentimos, no hay premio."
StringNum:  .asciz "\nNumero: "
Nombre:     .asciz "Ramon Hernandez Garcia - G15 | FTEL 14/11/18\n"
.end