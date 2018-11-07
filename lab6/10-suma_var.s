
.equ    stdout,   1
.equ    cout_r1,  0x6b
.equ    exit,     0x11

  /*     res = num1 + num2; */
  ldr   r2,=num1   ; //Carga un enlace a "num1" en R2 -> R2=4148 => [R2]=num1
  ldr   r8,[r2]    ; //Carga valor de R2 (variable "num1") a R8 -> R8=7

  ldr   r3,=num2   ; //Carga un enlace a "num2" en R3 -> R3=4152 = [R3]=num2
  ldr   r9,[r3]    ; //Carga valor de R3 (variable "num2") a R9 -> R9=9
  
  add   r7,r9,r8   ; //Suma R8 + R9 = R7
  ldr   r6,=res    ; //Carga puntero a "res" en R6 -> R6=4156 => R6=res
  str   r7,[r6]    ; //Carga en R6 ("res") el resultado de R7 -> R6=16
  ldr   r1,[r6]    ; //Carga en R1 el valor de R6 (variable "res") -> R1=16

  /*     console.log(res); */
  mov   r0,#stdout ; //Salida a consola (stdout)
  swi   cout_r1    ; //Escribir número

  swi   exit       ; //Finalizar ejecución

.data
/*     var num1 = 7; */
num1:   .word 7

/*     var num2 = 9; */
num2:   .word 9

/*     var res; */
res:    .word 0
.end