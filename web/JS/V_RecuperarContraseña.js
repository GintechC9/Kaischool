function validarL(e) {

	var teclado=(document.all) ? e.keyCode: e.which;

	if (teclado === 10) return true;

	var patron = /^[a-záéíóúü ]+$/i;

	var tecla = String.fromCharCode(teclado);

	return patron.test(tecla);
	// body...
}


function validarN(e) {

	var teclado=(document.all) ? e.keyCode: e.which;

	if (teclado == 10) return true;

	var patron = /[0-9\d]/;

	var tecla = String.fromCharCode(teclado);

	return patron.test(tecla);
	// body...
}

function Recuperarpass() {
	var usuario1 = document.formulario.respuesta.value;
	var user1 = usuario.length;
	var usuario2 = document.formulario.pass.value;
	var user2 = contraseña.length;
	
	if (usuario1>20 || users1<5 || usuario2>20 || user2<5) {
		alert("bien")
	}else{
		alert("Maximo 20 letras y minimo 5")
	}
}


