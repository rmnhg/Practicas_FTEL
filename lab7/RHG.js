function cuadrado () {
	var x = document.getElementById("n1");
	var error = document.getElementById("error");
	error.innerHTML = "";
	x.value=x.value*x.value;
}

function inverso () {
	var x = document.getElementById("n1");
	var error = document.getElementById("error");
	error.innerHTML = "";
	x.value = 1/x.value;
}

function coseno () {
	var x = document.getElementById("n1");
	var error = document.getElementById("error");
	error.innerHTML = "";
	x.value = Math.cos(x.value);
}

function factorial () {
	var x = document.getElementById("n1");
	var error = document.getElementById("error");
	res = 1;
	var vuelta;
	if (x.value < 0) {
		error.innerHTML = "Error: no existe el factorial de un número negativo.";
	} else {
		for (vuelta = x.value; vuelta >= 1; vuelta--) { //Esto también hace que 0!=1 porque no se cumple que vuelta >= 1 y por tanto el resultado (variables res) es 1.
			res=res*vuelta;
		}
		x.value = res;
	}
}

function raiz () {
	var x = document.getElementById("n1");
	var error = document.getElementById("error");
	if (x.value > 0) {
		x.value = Math.sqrt(x.value);
	} else {
		error.innerHTML = "Error: no existe la raíz de un número negativo en el conjunto de los números reales.";
	}
}

function vaciar () {
	var x = document.getElementById("n1");
	var error = document.getElementById("error");
	x.value = "";
	error.innerHTML = "";
}
