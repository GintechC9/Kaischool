<%-- 
    Document   : login
    Created on : 20/04/2019, 09:11:20 PM
    Author     : Usuario
--%>

<%@page import="Controlador.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <%
        try {
            //Datos.RendimientoA();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", 0);
            sesion.setAttribute("mensaje", "");
            Usuario u = new Usuario();
            sesion.setAttribute("USER", u);
            sesion.setAttribute("contrasena", "");
            sesion.setAttribute("respuesta", "");
            sesion.setAttribute("seguimiento", "");
            sesion.setAttribute("ERRORALU", "");
            sesion.setAttribute("ERRORALUT", "");
            sesion.setAttribute("ERRORALUJ", "");;
            sesion.setAttribute("ListaF", "");
            sesion.setAttribute("ErrorRG", "");
            sesion.setAttribute("ErrorRG2", "");
            sesion.setAttribute("Alumnos", "");
            sesion.setAttribute("menerror", "");
            String error;
            try {
                error = sesion.getAttribute("login").toString();
            } catch (Exception e) {
                error = "";
            }

            String suspension;
            try {
                suspension = sesion.getAttribute("estado").toString();
                if (suspension == null) {
                    suspension = "";
                }
            } catch (Exception e) {
                suspension = "";
            }

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
        <script type="text/javascript" src="JS/validar.js"></script>
    </head>
    <body background="img/fondo2.png">
        <div>
            <header class="azul-f espaciado">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9"><h2 class="blanco-l">Inicio de sesión</h2></div>
                        <div class="col-md-3"><img width="55" src="img/Seguridad.png" alt=""></div>
                    </div>
                </div>
            </header>
            <section>
                <div class="container" align="center">
                    <br>
                    <div class="gris-f">
                        <table border="0" align="center" width="80%">
                            <form method="post" action="VerificarUsuario">
                                <tr>
                                    <td colspan="2"><br><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25%" align="center"><h4 class="td1_2">Usuario:</h4></td><td class="td2"><input type="text" name="clave" class="inp1" onkeypress="return validarC(event)" placeholder="Usuario..." pattern=".{3,20}"  required title="Minimo 3 caracteres maximo 20" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                                </tr>
                                <%                            if (error.equals("")) {
                                    } else {
                                %>
                                <tr><td colspan="2">Ingresa la clave O contraseña correcta</td></tr>

                                <%
                                        sesion.setAttribute("login", "");
                                    }
                                %>
                                <tr><td></td></tr><tr><td></td></tr>
                                <tr>
                                    <td width="25%" align="center"><h5 class="td1_2">Contraseña:</h5></td><td class="td2"><input type="password" name="password" class="inp1" onkeypress="return validarC(event)" placeholder="Contraseña..." pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                                </tr>
                                <%
                                    if (suspension.equals("")) {
                                    } else if (suspension.equals("0")) {
                                %>
                                <tr><td>ERROR: Su cuenta ha sido suspendida para mas informacion hable con el administrador</td></tr>
                                <%                        sesion.setAttribute("estado", "");
                                    }%>
                                <tr>
                                    <td colspan="2" class="td2"><br><input type="submit" value="Inicio Sesion" class="btn1"></td><br>
                                </tr>
                                </from>
                                <tr>
                                    <td colspan="2" class="td2"><br><a href="TipoUsuario.jsp" class="a1_2"><u>Registrar</u></a></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="td2"><br><a href="Recuperar_Password.jsp" class="a1_2" class="btn1"><u>Recuperar contraseña</u></a></td>
                                </tr>
                                <tr><td colspan="2" align="center" class="blanco-l azul-f"><b>No se aceptan los siguientes caracteres: ' " = ? ¿ ¡ ! ( ) ; $ %  * - + ; : {} [] < > | ¬ °</b> <br></td></tr>
                                <tr><td></td></tr>
                        </table>
                    </div>
                    <table>
                        <tr>
                            <td class="td3"><br><br><a href="index.html"><input type="button"  name="salir" value="Salir"  class="btn1"></a></td>
                        </tr>
                    </table>
                </div>
            </section>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
<%} catch (Exception e) {

//Corregir el error
    HttpSession sesion = request.getSession();
    sesion.setAttribute("usuario", 0);
    sesion.setAttribute("mensaje", "");
    Usuario u = new Usuario();
    sesion.setAttribute("USER", u);
    sesion.setAttribute("contrasena", "");
    sesion.setAttribute("respuesta", "");
    sesion.setAttribute("seguimiento", "");
    String error;
    try {
        error = sesion.getAttribute("login").toString();
    } catch (Exception h) {
        error = "";
    }

    String suspension;
    try {
        suspension = sesion.getAttribute("estado").toString();
        if (suspension == null) {
            suspension = "";
        }
    } catch (Exception h) {
        suspension = "";
    }


%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Kaischool Systems</title>
    <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
    <link rel="icon" href="img/logo.ico">
    <script type="text/javascript" src="JS/validar.js"></script>
</head>
<body background="img/fondo2.png">
    <div>
        <nav>
            <table width="90%" align="center">
                <tr>
                    <td align="left"><h1 class="titulo">Inicio de sesión</h1></td>
                    <td align="right"><img width="55" src="img/Seguridad.png" alt=""></td>
                </tr>
            </table>
        </nav>

        <section>
            <table border="0" align="center" width="100%">
                <form method="post" action="VerificarUsuario">
                    <tr>
                        <td colspan="2"><br><br><br>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%"><h3 class="td1_2">Clave:</h3></td><td class="td2"><input type="text" name="clave" class="inp1" onkeypress="return validar(event)" placeholder="Clave..."></td>
                    </tr>
                    <%                            if (error.equals("")) {
                        } else {
                    %>
                    <tr><td>Ingresa la clave correcta</td></tr>
                    <%
                            sesion.setAttribute("login", "");
                        }
                    %>
                    <tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <td width="25%"><h3 class="td1_2">Contraseña:</h3></td><td class="td2"><input type="password" name="password" class="inp1" onkeypress="return validar(event)" placeholder="Contraseña..."></td>
                    </tr>
                    <%
                        if (error.equals("")) {
                        } else {
                    %>
                    <tr><td>Ingresa la contraseña correcta</td></tr>
                    <%
                            sesion.setAttribute("login", "");
                        }

                        if (suspension.equals("")) {
                        } else if (suspension.equals("0")) {
                    %>
                    <tr><td>ERROR: Su cuenta ha sido suspendida para mas informacion hable con el administrador</td></tr>
                    <%                        sesion.setAttribute("estado", "");
            }%>
                    <tr>
                        <td colspan="2" class="td2"><br><br><input type="submit" value="Inicio Sesion" class="btn1"></td><br>
                    </tr>
                    </from>
                    <tr>
                        <td colspan="2" class="td2"><br><br><a href="TipoUsuario.jsp" class="a1_2"><u>Registrar</u></a></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="td2"><br><br><a href="Recuperar_Password.jsp" class="a1_2" class="btn1"><u>Recuperar contraseña</u></a></td>
                    </tr>
                    <tr><td colspan="2"><br><br><br></td></tr>
                    <tr>
                        <td colspan="2"  class="td3"><br><br><a href="index.html"><input type="button"  name="salir" value="Salir" onclick="salir()" class="btn1"></a></td>
                    </tr>
            </table>
        </section>
    </div>
</body>
</html>
<%}%>
