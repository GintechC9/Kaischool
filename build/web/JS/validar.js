/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.oncontextmenu = function () {
    return false
}
function right(e) {
    var msg = "Prohibido usar Click Derecho";
    if (navigator.appName == 'Netscape' && e.which == 3) {
        alert(msg); //- Si no quieres asustar a tu usuario entonces quita esta linea...
        return false;
    } else if (navigator.appName == 'Microsoft Internet Explorer' && event.button == 2) {
        alert(msg); //- Si no quieres asustar al usuario que utiliza IE,  entonces quita esta linea...
        //- Aunque realmente se lo merezca...
        return false;
    }
    return true;
}
document.onmousedown = right;


function bloquearTeclasFuncion() {
    if (window.event) {
        if ((window.event.keyCode == 8) ||
                ((window.event.keyCode >= 113) && (window.event.keyCode <= 123)))
        {
            //Bloquear Backspace
            //Bloquear Teclas Fxx (excepto F1)
            window.event.cancelBubble = true;
            window.event.keyCode = 8;
            window.event.returnValue = false;
            return false;
        }
    }

    if (event.altLeft) {
        if ((window.event.keyCode == 37) || (window.event.keyCode == 39)) {
            //Bloquear Alt + Cursor Izq/Der.
            return false;
        }
    }

    if (event.ctrlKey) {
        //Bloquear Ctrl
        return false;
    }

    //alert(window.event.keyCode);
    return true;
}

document.onkeydown = function (event)
{
    event = (event || window.event);
    if (event.keyCode == 123 || event.keyCode == 18)
    {
        /* alert("La funcion F12 Esta deshabillitada.");*/
        return false;
    }
}

function validarL(e) {

    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado === 10)
        return true;

    var patron = /^[A-Za-zÁÉÍÓÚáéíóúü0123456789 ]+$/i;

    var tecla = String.fromCharCode(teclado);

    return patron.test(tecla);
    // body...
}

function validarR(e) {

    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado === 10)
        return true;

    var patron = /^[a-záéíóúü 1234567890]+$/i;

    var tecla = String.fromCharCode(teclado);

    return patron.test(tecla);
    // body...
}

function validarG(e) {

    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado === 10)
        return true;

    var patron = /^[0-9QWERTYUIOPASDFGHJKLÑZXCVBNM]+$/i;

    var tecla = String.fromCharCode(teclado);

    return patron.test(tecla);
    // body...
}

function validarC(e) {
    var teclado = (document.all) ? e.keyCode : e.which;
    if (teclado === 10)
        return true;
    var patron = /^[A-ZÁÉÍÓÚa-záéíóúü,.-0123456789#_ ]+$/i;
    var tecla = String.fromCharCode(teclado);
    return patron.test(tecla);
    // body...
}

function validarN(e) {
    var teclado = (document.all) ? e.keyCode : e.which;
    if (teclado == 10)
        return true;
    var patron = /[0-9\d]/;
    var tecla = String.fromCharCode(teclado);
    return patron.test(tecla);
    // body...
}

function Contra() {
    var x = document.registro.password.value;
    var y = document.registro.passwordcon.value;
    if (x !== y) {
        alert("Las contraseñas no coinciden");
        document.registro.passwordcon.value = "";
        return false;
    } else {
        return true;
    }
}

function cambia(src) {
    document.getElementById("im").src = im.src;
}

function cambia(src) {
    document.getElementById("img").src = img.src;
} 