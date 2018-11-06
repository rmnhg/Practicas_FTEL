
/* factorial(n) = n * n-1 * .. * 2 * 1 */

       mov   r0, #1      ; //var r0 = 1;
       mov   r1, #1      ; //var r1 = 1;

                         ; //while (true) {
bucle: mul   r0, r1, r0  ; //  r0 = r1 * r0;
       add   r1, r1, #1  ; //  r1 = r1 + 1;
       b     bucle       ; //}
       swi   0x11
.end

