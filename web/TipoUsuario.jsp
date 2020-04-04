<%-- 
    Document   : TipoUsuario
    Created on : 21/04/2019, 02:16:59 PM
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <%
        try {
            HttpSession sesion = request.getSession();

            sesion.setAttribute("usuario", 0);
            sesion.setAttribute("mensaje", "");

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="icon" href="img/logo.ico">
        <script type="text/javascript" src="JS/validar.js"></script>
    </head>
    <body background="img/fondo2.png">
        <div>
            <header class="azul-f espaciado">    
                <div class="container">
                    <div class="row">
                        <div class="col-md-9">
                            <h2 class="blanco-l"> ¿Qué tipo de usuario eres?</h2> 
                        </div>
                        <div class="col-md-3">  
                            <img width="55" src="img/Seguridad.png" alt="">
                        </div>
                    </div>   
                </div>
            </header>
            <section>
                <br>
                <form method="post" action="Registrar.jsp">
                    <div class="container gris-f">
                        <table border="0" align="center" width="100%">
                            <tr>
                                <td colspan="2"><br><br><br>
                                </td>
                            </tr>
                            <tr>
                                <td width="25%" align="center">
                                    <input type="radio" name="TipoUsuario" id="JefeArea" value="JefeArea" checked>
                                    <label for="JefeArea">Jefe de Area</label><br><br>
                                    <input type="radio" name="TipoUsuario" id="Tutor" value="Tutor">
                                    <label for="Tutor">Tutor</label><br><br>
                                    <input type="radio" name="TipoUsuario" id="Alumno" value="Alumno">
                                    <label for="Alumno">Alumno</label><br><br>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                        </table>
                    </div>
                    <div align="center">
                    <table align="center">
                        <tr>
                            <td colspan="2" class="td2" align="center"><br><br><input type="submit" class="btn1"value="Siguiente"></td>
                        </tr>
                    </table>
                    </div>
                </form>
            </section>
            <table>
                <tr><td colspan="2"><br><br><br></td></tr>
                <tr>
                    <td colspan="2"  class="td2"><br><br><a href="login.jsp"><input type="button" class="btn1" value="Regresar"></a></td>
                </tr>
            </table>
        </div>

    </body>

</html>
<%} catch (Exception e) {%>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo2.png">
        <section>
            <p>Ha ocurrido un error regresa a Inicio Sesion</p>
            <a href="login.jsp">Inicio Sesion</a>
        </section>
    </body>
</html>

<%}%>