
   /* factorial(4) = 4 * 3 * 2 * 1  */

       mov   r0, #1      ; //var r0 = 1;
       mov   r1, #4      ; //var r1 = 4;

bucle: cmp   r1, #1      ; //while (r1 > 1){
       ble   salir
       mul   r0, r1, r0  ; //  r0 = r1 * r0;
       sub   r1, r1, #1  ; //  r1 = r1 - 1; // 
       b     bucle       ; //}
salir: swi   0x11
.end

