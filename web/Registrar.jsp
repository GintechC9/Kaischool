<%-- 
    Document   : Registar
    Created on : 20/04/2019, 10:07:42 PM
    Author     : Usuario
--%>

<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registro de usuario</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
        <script type="text/javascript" src="JS/validar.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script type="text/javascript" src="JS/validar.js"></script>
    </head>
    <body background="img/fondo2.png">
        <%
            try {

                try {
                    HttpSession sesion = request.getSession();

                    Usuario antes = (Usuario) sesion.getAttribute("Anterior");

                    String c = "";
                    try {
                        c = request.getParameter("TipoUsuario");
                    } catch (Exception e) {
                    }
                    if (c == null) {
                        c = "";
                    }

                    int tipo = 0;
                    try {
                        tipo = Integer.parseInt(sesion.getAttribute("usuario").toString());
                    } catch (Exception e) {
                        tipo = 0;
                    }

                    String mensaje = "";
                    if (tipo != 0) {
                        try {
                            mensaje = sesion.getAttribute("mensaje").toString();
                        } catch (Exception e) {
                        }
                        if (mensaje == null) {
                            mensaje = "";
                        }
                    }

                    if (c.equalsIgnoreCase("Tutor") || tipo == 1) {
        %>
        <div>
            <header class="azul-f espaciado">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9"><h2 class="blanco-l">Registro de Tutor</h2></div>
                        <div class="col-md-3"><img width="55" src="img/Seguridad.png" alt=""></div>
                    </div>
                </div>
            </header>
            <br>
            <form method="post" action="GuardarUsuario" name="registro">
                <div class="container gris-f" algin="center">
                    <section>
                        <table border="0" align="center" width="100%">
                            <tr>
                                <td colspan="2"><br></td>
                            </tr>
                            <%                            if (mensaje.equals("")) {
                                } else {
                            %>
                            <tr><td><%=mensaje%></td></tr>
                            <%
                                    sesion.setAttribute("mensaje", "");
                                }
                            %>
                            <tr>
                                <td width="25%"><h3 class="td1">Clave Usuario:</h3></td><td class="td2" colspan="2"><input type="text" name="clave" class="inp1" pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false" placeholder="Usuario..."></td>
                            </tr> 
                            <tr><td></td></tr><tr><td></td></tr>
                            <tr>
                                <td width="25%"><h3 class="td1">Contraseña:</h3></td><td class="td2" colspan="2"><input type="password" name="password" class="inp1" pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false" placeholder="Contraseña..."></td>
                            </tr><tr><td></td></tr><tr><td></td></tr>
                            <tr>
                                <td width="25%"><h3 class="td1">Comprobar Contraseña:</h3></td><td class="td2" colspan="2"><input type="password" name="passwordcon" pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" class="inp1" onkeypress="return validarC(event)" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false" placeholder="Comprobar Contraseña..."></td>
                            </tr><tr><td></td></tr><tr><td></td></tr>
                            <tr>
                                <td width="25%"><h3 class="td1">Pregunta de seguridad:</h3></td>
                                <td colspan="2">     
                                    <select class="PS1" name="pregunta">
                                        <option value="1">¿Cuál es tu pelicula favorita?</option>
                                        <option value="2">¿Nombre de tu Mascota?</option>
                                        <option value="3">¿Cuál es tu canción favorita?</option>
                                    </select>
                                </td>
                            </tr><tr><td></td></tr><tr><td></td></tr>
                            <tr>
                                <td width="25%" colspan="2"><h3 class="td1">Respuesta:</h3></td><td class="td2"><input type="text" name="respuesta" class="inp1" pattern=".{0,20}"  required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false" placeholder="Respuesta..."></td>
                            </tr>
                        </tr><tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <td width="25%" colspan="2"><h3 class="td1">Codigo Alumno:</h3></td><td class="td2"><input type="text" name="codigoalu" class="inp1" pattern=".{5}"  required title="El codigo debe de ser de 5 caracteres" onkeypress="return validarG(event)" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false" placeholder="Codigo..."></td>
                    </tr>
                    <tr><td colspan="3" align="center" class="blanco-l azul-f"><b>No se aceptan los siguientes caracteres: ' " = ? ¿ ¡ ! ( ) ; $ %  * - + ; : {} [] < > | ¬ °</b> <br></td></tr>
                <tr><td colspan="2"> <br>
                        
                        </td></tr>
            </table>
            </section>
        </div>
        <div align="center">
            <table>
                <tr>
                    <td>
                        <br><br><input type="submit" name="Registrar" value="Registrar" onclick="return Contra()" class="btn1">  
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div align="center">
        <table align="center" width="100%">
            <tr>
                <td class="td3"><br><br><a href="TipoUsuario.jsp"><input type="button" value="Regresar" class="btn1"></a></td>
                <td class="td3"><br><br><a href="login.jsp"><input type="button" value="Volver a menu principal" class="btn1"></a></td>
            </tr>
        </table>
    </div>
    <%} else if (c.equalsIgnoreCase("Alumno") || tipo == 2) {%>
    <div>
        <header class="azul-f espaciado">
            <div class="container">
                <div class="row">
                    <div class="col-md-9"><h2 class="blanco-l">Registro de Alumno</h2></div>
                    <div class="col-md-3"><img width="55" src="img/Seguridad.png" alt=""></div>

                </div>
            </div>
        </header>
        <br>
        <form method="post" action="GuardarUsuario" name="registro">
            <div align="center" class="container gris-f">
                <section>
                    <table border="0" align="center" width="100%">
                        <tr>
                            <td colspan="2"><br></td>
                        </tr>
                        <%                            if (mensaje.equals("")) {
                            } else {
                        %>
                        <tr><td><%=mensaje%></td></tr>
                        <%
                                sesion.setAttribute("mensaje", "");
                            }
                        %>
                        <tr>
                            <td width="25%"><h3 class="td1">Boleta:</h3></td><td class="td2" colspan="2"><input type="text" name="boleta" class="inp1" pattern=".{10}"  required title="La boleta debe ser de 10 caracteres" onkeypress="return validarN(event)" placeholder="Boleta..." ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                        </tr><tr><td></td></tr><tr><td></td></tr>
                        <tr>
                            <td width="25%"><h3 class="td1">Codigo del Grupo:</h3></td><td class="td2" colspan="2"><input type="text" name="codigogrupo" class="inp1" pattern=".{5}"  required title="El codigo debe de ser de 5 caracteres."  placeholder="Codigo Grupo..." onkeypress="return validarG(event)" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                        </tr><tr><td></td></tr><tr><td></td></tr>
                        <tr>
                            <td width="25%"><h3 class="td1">Clave Usuario:</h3></td><td class="td2" colspan="2"><input type="text" name="clave" class="inp1" pattern=".{3,20}" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false" required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" placeholder="Usuario..."></td>
                        </tr>
                        <tr><td></td></tr><tr><td></td></tr>
                        <tr>
                            <td width="25%"><h3 class="td1">Contraseña:</h3></td><td class="td2" colspan="2"><input type="password" name="password" class="inp1" pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" placeholder="Contraseña..." ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                        </tr><tr><td></td></tr><tr><td></td></tr>
                        <tr>
                            <td width="25%"><h3 class="td1">Comprobar Contraseña:</h3></td><td class="td2" colspan="2"><input type="password" name="passwordcon" pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" class="inp1" onkeypress="return validarC(event)" placeholder="Comprobar Contraseña..."  ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                        </tr><tr><td></td></tr><tr><td></td></tr>
                        <tr>
                            <td width="25%"><h3 class="td1">Pregunta de seguridad:</h3></td>
                            <td colspan="2" align="center">
                                <select class="PS1" name="pregunta">
                                    <option value="1">¿Cuál es tu pelicula favorita?</option>
                                    <option value="2">¿Nombre de tu Mascota?</option>
                                    <option value="3">¿Cuál es tu canción favorita?</option>
                                </select>
                            </td>
                        </tr><tr><td></td></tr><tr><td></td></tr>
                        <tr>
                            <td width="25%" colspan="2"><h3 class="td1">Respuesta:</h3></td><td class="td2"><input type="text"  name="respuesta" class="inp1" pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" placeholder="Respuesta..."  ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                        </tr>
                    <tr><td colspan="3" align="center" class="blanco-l azul-f"><b>No se aceptan los siguientes caracteres: ' " = ? ¿ ¡ ! ( ) ; $ %  * - + ; : {} [] < > | ¬ °</b> <br></td></tr><tr><td></td></tr>
                    <tr><td colspan="2"> <br>
                        
                        </td></tr>
            </table>
        </section>
    </div>
    <div align="center">
        <table align="center">
            <tr>
                <td colspan="2"  class="td3"><br><br><input type="submit" name="Registrar" value="Registrar" onclick="return Contra()" class="btn1"></td>
            </tr>
        </table>
    </div>
</form>
<div align="center">
    <table align="center" width="100%">
        <tr>
            <td class="td3" align="center"><br><br><a href="TipoUsuario.jsp"><input type="button" value="Regresar" class="btn1"></a></td>
            <td class="td3" align="center"><br><br><a href="login.jsp"><input type="button" value="Volver a menu principal" class="btn1"></a></td>   
        </tr>
    </table>
</div>
</div>
<%} else if (c.equalsIgnoreCase("JefeArea") || tipo == 3) {%>
<div>
    <header class="azul-f espaciado">
        <div class="container">
            <div class="row">
                <div class="col-md-9"><h2 class="blanco-l">Jefe de Área</h2></div>
                <div class="col-md-3"><img width="55" src="img/Seguridad.png" alt=""></div>

            </div>
        </div>
    </header>
    <br>
    <form method="post" action="GuardarUsuario" name="registro">
        <div align="center" class="container gris-f">
            <section>
                <table border="0" align="center" width="100%">
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <%                            if (mensaje.equals("")) {
                        } else {
                    %>
                    <tr><td><%=mensaje%></td></tr>
                    <%
                            sesion.setAttribute("mensaje", "");
                        }%>
                    <tr>
                        <td width="25%"><h3 class="td1">Numero de Empleado:</h3> </td><td class="td2" colspan="2"><input type="text" name="numerojefe" class="inp1" pattern=".{5,10}"  required title="El numero de empleado debe ser entre 5 y 10 caracteres" onkeypress="return validarN(event)" placeholder="Numero de Empleado..." ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                    </tr><tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <td width="25%"><h3 class="td1">Clave Usuario:</h3></td><td class="td2" colspan="2"><input type="text" name="clave" class="inp1" pattern=".{0,20}"  required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" placeholder="Usuario..." ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                    </tr>
                    <tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <td width="25%"><h3 class="td1">Contraseña:</h3></td><td class="td2" colspan="2"><input type="password" name="password" class="inp1" pattern=".{0,20}"  required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" placeholder="Contraseña..." ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                    </tr><tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <td width="25%"><h3 class="td1">Comprobar Contraseña:</h3></td><td class="td2" colspan="2"><input type="password" name="passwordcon" pattern=".{0,20}"  required title="minimo 3 caracteres maximo 20" class="inp1" onkeypress="return validarC(event)" placeholder="Comprobar Contraseña..." ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                    </tr><tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <td width="25%"><h3 class="td1">Pregunta de seguridad:</h3></td>
                        <td colspan="2">
                            <select class="PS1" name="pregunta">
                                <option value="1">¿Cuál es tu pelicula favorita?</option>
                                <option value="2">¿Nombre de tu Mascota?</option>
                                <option value="3">¿Cuál es tu canción favorita?</option>
                            </select>
                        </td>
                    </tr><tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <td width="25%" colspan=""><h3 class="td1">Respuesta:</h3></td><td class="td2"><input type="text" name="respuesta" class="inp1" pattern=".{3,20}"  required title="minimo 3 caracteres maximo 20" onkeypress="return validarC(event)" placeholder="Respuesta..." ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                    </tr>
                </tr><tr><td colspan="3" align="center" class="blanco-l azul-f"><b>No se aceptan los siguientes caracteres: ' " = ? ¿ ¡ ! ( ) ; $ %  * - + ; : {} [] < > | ¬ °</b> <br></td></tr><tr><td></td></tr>
                <tr><td colspan="2"> <br>
                        
                        </td></tr>
        </table>
    </section>
</div>
                    <div align="center">
                    <table>
    <tr>
        <td>
            <br><br><br><br><input type="submit" name="Registrar" value="Registrar" onclick="return Contra()" class="btn1">
        </td>
    </tr>
</table
</div>
</form>
<div align="center">
    <table width="100%">
        <tr>
            <td class="td3"><br><br><a href="TipoUsuario.jsp"><input type="button" value="Regresar" class="btn1"></a></td>
            <td class="td3"><br><br><a href="login.jsp"><input type="button" value="Volver a menu principal" class="btn1"></a></td>
        </tr>
    </table>
</div>
</div>

<%
        }
    } catch (Exception e) {
        e.getMessage();
        e.getStackTrace();
    }
%>
</body>
</html>
<%} catch (Exception e) {%>
<div>
    <section>
        <p>Ha ocurrido un error regresa a Inicio Sesion</p>
        <a href="login.jsp">Inicio Sesion</a>
    </section>
</div>
<%}%>