/* Practica 3 JavaScript
   Ramón Hernández García
   Laboratorio 3 FTEL
   05/10/18
*/

console.log("Ramon Hernandez Garcia - Grupo 15.1\n"); //Mi nombre

console.log("Este programa le muestra la tabla de prefijos de potencias de 2:"); // Explicación

var res,i,e,n; //Declaro las variables que usaré

function unidad (e) { //Esta funcion usa la variable e para definir el prefijo necesario a la tabla
	if (e == 10) { //Si vale 10 devuelve Kibi
		return "Kibi";
	} else if (e == 20) { //Si vale 20 devuelve Mebi
		return "Mebi";
	} else if (e == 30) { //Si vale 30 devuelve Gibi
		return "Gibi";
	} else if (e == 40) { //Si vale 40 devuelve Tebi
		return "Tebi";
	} else if (e == 50) { //Si vale 50 devuelve Pebi
		return "Pebi";
	} else if (e == 60) { //Si vale 60 devuelve Exbi
		return "Exbi";
	} else if (e == 70) { //Si vale 70 devuelve Zebi
		return "Zebi";
	} else if (e == 80) { //Si vale 80 devuelve Yobi
		return "Yobi";
	} else return "error"; //En caso de usar otro valor devuelve error
}

function dos_a (n) { //Esta función usa la variable n para definir el resultado de la potencia
	i=0;
	res=1;
	while (i<n) { //Se ejecuta n veces (de i=0 a i=n-1)
		i++
		res = res * 2
	}
//Sería similar a un for:
/*
	res=1;
	for (i=0;i<n;i++) {
		res = res * 2
	}
*/
	return res;
}

//Muestro la tabla con las potencias de 2 y sus respectivos prefijos
i=10;
while (i<=80) { //Se ejecuta 8 veces (de i=10 a i=80)
	console.log("1 " + unidad(i) + "byte = 2^" + i + " Bytes = " + dos_a(i) +" Bytes");
	i=i+10;
}

//Sería similar a un for:
/*
for (i=10;i<=80;i+=10) {
	console.log("1 " + unidad(i) + "byte = 2^" + i + " Bytes = " + dos_a(i) +" Bytes");
}
*/

console.log("\nGracias por usar el programa! "); //Despedida
