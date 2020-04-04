<%-- 
    Document   : Admin
    Created on : 23/04/2019, 12:24:58 AM
    Author     : Usuario
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Controlador.*"%>
<!DOCTYPE html>
<%
    try {
        HttpSession sesion = request.getSession();
        Usuario user;
        Usuario nulo = new Usuario();
        String clave;

        try {
            user = (Usuario) sesion.getAttribute("seguimiento");
        } catch (Exception e) {
            user = nulo;
        }

        try {
            clave = user.getClave();
            if (clave == null) {
                clave = "";
            }
        } catch (Exception e) {
            clave = "";
        }
        if (clave.equals("")) {

%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo2.png">
        <header class="azul-f espaciado">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <h2 class="blanco-l">Suspension de Usuarios</h2>
                    </div>            
                    <img width="55" height="55" src="img/Seguridad.png" alt="">
                    <div class="col-md-3">                
                    </div>
                </div>
            </div>
        </header>
        <section align="center">
            ¡Lo siento!
            <br>
            <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
            <a href="login.jsp">Inicio Sesión</a>
        </section
    </body>
</html>
<%} else {

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suspension de Usuarios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
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
                            <h2 class="blanco-l">Suspension de Usuarios</h2>
                        </div>            
                        <img width="55" height="55" src="img/Seguridad.png" alt="">
                        <div class="col-md-3">                
                        </div>
                    </div>
                </div>
            </header>
            <%                List<Usuario> lista = Datos.ConsultaAdmin();
                int t;
                int e;
                String uno = "Tutor";
                String dos = "Alumno";
                String tres = "Jefe de Area";
                String activo = "Habilitado";
                String suspendido = "Suspendido";

            %>
            <h5 class="td1_2">Elija el registro que desea suspender:</h5>
            <br>
            <form method="post" action="SuspenderUsuario">
                <table border="2" align="center" width="100%">
                    <tr>
                        <td align="center"><h5 align="center" class="blanco-f">Clave</h5></td>
                        <td align="center"><h5 align="center" class="blanco-f">Tipo</h5></td>
                        <td align="center"><h5 align="center" class="blanco-f">Estado</h5></td>
                    </tr>
                    <%for (Usuario u : lista) {
                    %>
                    <tr>

                        <td><input type="radio" name="seleccion" value="<%=u.getClave()%>"><%=u.getClave()%></td>


                        <%t = u.getTipo();
                            e = u.getEstado();
                            if (t == 1) {%><td align="center"><b><%=uno%></b></td>
                                <%} else if (t == 2) {%>
                        <td align="center"><b><%=dos%></b></td>
                                <%} else if (t == 3) {%>
                        <td align="center"><b><%=tres%></b></td>
                                <%}
                                    if (e == 0) {%>
                        <td align="center"><b><%=suspendido%></b></td>
                                <%} else if (e == 1) {%>
                        <td align="center"><b><%=activo%></b></td>
                                <%}%>
                    </tr>
                    <%}%>
                </table>
                <br>
                <table align="center" width="100%">
                    <tr>
                        <td><input type="submit" value="Suspender" name="Accion" class="btn1" align="center"></td>
                        <td><input type="submit" value="Habilitar" name="Accion" class="btn1" align="center"></td>
                        <td class="td3"><a href="login.jsp"><input type="button" value="Regresar" class="btn1"></a></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
<%
    }
} catch (Exception e) {
%>
<section>
    <p>Ha ocurrido un error regresa a Inicio Sesion</p>
    <a href="login.jsp">Inicio Sesion</a>
</section>
<%}%>