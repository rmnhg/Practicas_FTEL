/* Practica 2 JavaScript
   Ramón Hernández García Grupo 15
   Laboratorio 2 FTEL
   27/09/18
*/

console.log("Ramon Hernandez Garcia - Grupo 15\n"); //Mi nombre

console.log ("Grupo de laboratorio G15. Tabla de unidades binarias."); //Información del programa
console.log("Este programa le muestra la tabla de prefijos de potencias de 2:"); // Explicación

var exponente; //Declaro la variable exponente para usarla con la función unidad

function unidad (exponente) { //Esta funcion usa la variable exponente para definir el prefijo necesario a la tabla
	if (exponente == 10) { //Si vale 10 devuelve Kibi
		return "Kibi";
	} else if (exponente == 20) { //Si vale 20 devuelve Mebi
		return "Mebi";
	} else if (exponente == 30) { //Si vale 30 devuelve Gibi
		return "Gibi";
	} else if (exponente == 40) { //Si vale 40 devuelve Tebi
		return "Tebi";
	} else if (exponente == 50) { //Si vale 50 devuelve Pebi
		return "Pebi";
	} else if (exponente == 60) { //Si vale 60 devuelve Exbi
		return "Exbi";
	} else if (exponente == 70) { //Si vale 70 devuelve Zebi
		return "Zebi";
	} else if (exponente == 80) { //Si vale 80 devuelve Yobi
		return "Yobi";
	} else return "error"; //En caso de usar otro valor devuelve error
  }

//Muestro la tabla con las potencias de 2 y sus respectivos prefijos
console.log("1 " + unidad(10) + "byte son 2^10 Bytes.");
console.log("1 " + unidad(20) + "byte son 2^20 Bytes.");
console.log("1 " + unidad(30) + "byte son 2^30 Bytes.");
console.log("1 " + unidad(40) + "byte son 2^40 Bytes.");
console.log("1 " + unidad(50) + "byte son 2^50 Bytes.");
console.log("1 " + unidad(60) + "byte son 2^60 Bytes.");
console.log("1 " + unidad(70) + "byte son 2^70 Bytes.");
console.log("1 " + unidad(80) + "byte son 2^80 Bytes.");

console.log("\nGracias por usar el programa! "); //Despedida