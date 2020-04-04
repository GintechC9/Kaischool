<%-- 
    Document   : Tutor_inicio
    Created on : 25/04/2019, 07:34:38 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Controlador.*"%>
<!DOCTYPE html>
<%
    try {

        HttpSession sesion = request.getSession();

        Usuario user;
        Usuario nulo = new Usuario();
        String clave;
        int tipo;
        try {
            user = (Usuario) sesion.getAttribute("seguimiento");
        } catch (Exception e) {
            user = nulo;
        }

        try {
            clave = user.getClave();
            tipo=user.getTipo();
            if(tipo!=1){
            tipo=5;
            }
            if (clave == null) {
                clave = "";
            }
            if(tipo==0){
            tipo=5;
            }
        } catch (Exception e) {
            clave = "";
            tipo=5;
        }
        if (clave.equals("") || tipo==5) {
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
        <div class="general">
            <header class="azul-f">   
                <br>
                <div class="row">
                    <div class="col-md-9"><h2 class="blanco-l">Tutor</h2>  </div> 
                    <div class="col-md-3"><img width="55" src="img/Gráficas.png" alt="">  </div>
                </div>
            </header>
            <br>
            <nav id="menu">
                <ul>
                    <a href="Tutor_inicio.jsp" class="a1">Inicio</a>
                    <a href="Rendimiento_Alumno.jsp" class="a1">Rendimiento de Mi Hijo</a>
                </ul>
            </nav><br><br>
            <section>
                <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
                <a href="login.jsp">Inicio Sesion</a>
            </section>
        </div>
    </body>
</html>
<%} else {%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="icon" href="img/logo.ico">
        <script type="text/javascript" src="JS/validar.js"></script>
    </head>
    <body background="img/fondo2.png">
            <header class="azul-f">   
                <br>
                <div class="row">
                    <div class="col-md-9"><h2 class="blanco-l">Tutor</h2>  </div> 
                    <div class="col-md-3"><img width="55" src="img/Gráficas.png" alt="">  </div>
                </div>
            </header>
            <nav id="menu">
                <div align="center">
                    <div class="row">
                        <div class="col-md-12">  
                            <ul class="nav nav-tabs nav-justified">
                                <li role="presentation" class="active"><a href="Tutor_inicio.jsp" class="a1">Inicio</a>    </li>
                                <li role="presentation"> <a href="Rendimiento_Alumno.jsp" class="a1">Rendimiento Alumno</a>   </li>     
                            </ul> 
                        </div>   
                    </div>
                </div>
            </nav>
            <div class="mensaje">Bienvenido <%=user.getClave()%><br></div>
            <div class="navegador">
                <div class="codPadre"><br><pre class="btn2">Codigo de su Hijo: <%=user.getCodigo()%></pre></div>
		<div class="Regresar"><br><a href="login.jsp"><input type="button" value="Cerar Sesion" class="btn1"></a></div>
</div>
</body>
</html>
<%}%>
<%} catch (Exception e) {%>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo2.png">
        <div class="general">
            <nav>
                <br>
                <table width="90%" align="center">
                    <tr>
                        <td align="left"><h1 class="titulo">Tutor</h1></td>
                        <td align="right"><img width="55" src="img/Gráficas.png" alt=""></td>
                    </tr>
                </table>
            </nav>
            <br>
            <nav id="menu">
                <ul>
                    <a href="Tutor_inicio.jsp" class="a1">Inicio</a>
                    <a href="Rendimiento_Alumno.jsp" class="a1">Rendimiento de Mi Hijo</a>

                </ul>
            </nav><br><br>
            <section>
                <p>Ha ocurrido un error regresa a Inicio Sesion</p>
                <a href="login.jsp">Inicio Sesion</a>
            </section>
        </div>
    </body>
</html>
<%}%>