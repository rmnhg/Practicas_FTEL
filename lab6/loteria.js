// número aleatorio entre 0 y 255
var num = Math.random();     // Entre 0 y 1
num = Math.floor(num * 256); // Entre 0 y 255

var str = "\nLo sentimos, no hay premio";

if (num < 64) {  // probabilidad=25% (64/256)
 str = "\nHa ganado 10 Euros";
}

console.log(str);

console.log("num: " + num);
