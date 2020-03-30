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
function Registrar() {
	var usuario1 = document.formulario.usuario1.value;
	var user1 = usuario.length;
	var usuario2 = document.formulario.usuario2.value;
	var user2 = contraseña.length;
	var usuario3 = document.formulario.usuario3.value;
	var user3 = usuario.length;
	var usuario4 = document.formulario.usuario4.value;
	var user4 = contraseña.length;
	if (usuario1>20 || users1<5 || usuario2>20 || user2<5 || usuario3>20 || users3<5 || usuario4>20 || user4<5) {
		alert("bien")
	}else{
		alert("Maximo 20 letras y minimo 5")
	}
}