<%-- 
    Document   : Recuperar_Password
    Created on : 21/04/2019, 05:35:56 PM
    Author     : Usuario
--%>

<%@page import="Controlador.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    try {

        HttpSession sesion = request.getSession();
        Usuario user1 = (Usuario) sesion.getAttribute("USER");
        Usuario nulo = new Usuario();
        String clave;
        try {
            clave = user1.getClave();
            if (clave == null) {
                clave = "";
            }
        } catch (Exception e) {
            clave = "";
        }

    
%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Recuperar Contraseña</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
        <script type="text/javascript" src="JS/validar.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body background="img/fondo2.png">
        <div>
            <header class="azul-f espaciado">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9"><h2 class="blanco-l">Recuperar Contraseña</h2></div>
                        <div class="col-md-3"><img width="55" src="img/Seguridad.png" alt=""></div>
                    </div>
                </div>
            </header>
            <br>
            <div align="center" class="container gris-f">
                <section>
                    <table border="0" align="center" width="90%">
                        <tr>
                            <td colspan="2"><br><br><br>
                            </td>
                        </tr>
                        <form method="post" action="Recuperar1">
                            <tr>
                                <td width="25%" align="center"><h3 class="blanco-l azul-f">Nombre:</h3></td><td class="td2"><input <%if (clave.equals("") || clave.equals("Admin") || clave.equals("ERROR")) {
                                            } else {%>readonly<%}%> type="text" name="clave" pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" class="inp1" onkeypress="return validar(event)" <%if (clave.equals("Admin")) {%>placeholder=""<%} else {%> placeholder="<%=clave%>" <%}%>></td>
                            </tr>
                            <%if (clave.equals("") || clave.equals("Admin")) {%>
                            <tr><td></td></tr>
                            <tr><td></td></tr><tr> <tr><td colspan="2" align="center" class="blanco-l azul-f"><b>No se aceptan los siguientes caracteres: ' " = ? ¿ ¡ ! ( ) ; $ %  * - + ; : {} [] < > | ¬ °</b> <br></td></tr>
                            <tr>
                                <td colspan="2" class="td2"><br><input type="submit" value="Buscar Usuario" class="btn1"></td><br>
                            </tr>
                            <%} else if (clave.equals("ERROR")) {
                            %>
                            <tr><td>La clave actual no existe</td></tr>
                            <tr><td></td></tr> <tr><td colspan="2" align="center" class="blanco-l azul-f"><b>No se aceptan los siguientes caracteres: ' " = ? ¿ ¡ ! ( ) ; $ %  * - + ; : {} [] < > | ¬ °</b> <br></td></tr>
                            <tr>
                                <td colspan="2" class="td2"><br><input type="submit" value="Buscar Usuario" class="btn1"></td><br>
                            </tr>
                            <%
                            } else {
                                String res2;
                                String respuesta;
                                String menerror;
                                try {
                                    res2 = sesion.getAttribute("respuesta").toString();
                                    if (res2 == null) {
                                        res2 = "";
                                    }
                                } catch (Exception e) {
                                    res2 = "";
                                }
                                try {
                                    respuesta = sesion.getAttribute("contrasena").toString();
                                    if (respuesta == null) {
                                        respuesta = "";
                                    }
                                } catch (Exception e) {
                                    respuesta = "";
                                }
                                try {
                                    menerror = sesion.getAttribute("menerror").toString();
                                    if (menerror == null) {
                                        menerror = "";
                                    }
                                } catch (Exception e) {
                                    menerror = "";
                                }%>
                        </form>
                        <tr>
                            <td width="25%"><h3 class="td1">Su pregunta fue: </h3></td>
                            <td>
                                <select class="PS1">
                                    <%
                                        if (user1.getPregunta() == 1) {
                                    %>
                                    <option value="¿Cuál es tu pelicula favorita?">¿Cuál es tu pelicula favorita?</option>
                                    <%} else if (user1.getPregunta() == 2) {%>
                                    <option value="¿Nombre de tu Mascota?">¿Nombre de tu mascota?</option>
                                    <%} else if (user1.getPregunta() == 3) {%>
                                    <option value="¿Cuál es tu canción favorita?">¿Cuál es tu canción favorita?</option>
                                    <%}%>
                                </select>
                            </td>
                        </tr><tr><td></td></tr><tr><td></td></tr>
                        <form method="post" action="Recuperar2">
                            <tr>
                                <td width="25%"><h3 class="td1">Escriba su respuesta: </h3></td><td class="td2"><input type="text" name="respuesta" class="inp1" onkeypress="return validar(event)" placeholder="<%=res2%>" <%if (menerror.equals("ERROR") || menerror.equals("")) {
                                                                                                                       } else {%>readonly<%}%>></td>
                            </tr>
                            <%System.out.println(res2+"HOAl");
                                if (menerror.equals("ERROR")) {%><tr><td>La respuesta actual es incorrecta</td></tr><%}%>
                            <tr><td></td></tr><tr><td></td></tr>
                            <tr>
                                <td width="25%"><h3 class="td1">Su Contraseña es:</h3></td><td class="td2"><input readonly type="text" name="pass" class="inp1" readonly placeholder="<%=respuesta%>"></td>
                            </tr><tr><td></td></tr><tr><td></td></tr>

                            <tr>
                                <td colspan="2" class="td2"><br><input type="submit" name="Recuperar" value="Recuperar Contraseña" class="btn1"></button></td><br>
                            </tr>
                        </form>
                        <tr><td colspan="2"><br><br></td></tr>
                                <%
                                        sesion.setAttribute("respuesta", "");
                                        sesion.setAttribute("contrasena", "");
                                        respuesta = "";
                                        //sesion.setAttribute("USER",nulo);
                                    }
                                %>
                    </table>
                </section>
            </div>
            <div align="center">
                <table>
                    <tr>
                        <td colspan="2"  class="td3"><br><br><a href="login.jsp"><input type="button" name="Regresar" value="Regresar" class="btn1"></button></a></td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>

<%} catch (Exception e) {
    System.out.println(e.getMessage());
System.out.println(e.toString());
%>
<section>
    <p>Ha ocurrido un error regresa a Inicio Sesion</p>
    <a href="login.jsp">Inicio Sesion</a>
</section>
<%}%>