<%-- 
    Document   : Alumno_Inicio
    Created on : 25/04/2019, 11:52:23 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Controlador.*"%>
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
            if(tipo!=2){
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
        <header class="azul-f espaciado">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <h2 class="blanco-l">Alumno</h2>
                </div>            
                <img width="55" height="55" src="img/Lapiz.png" alt="">
                <div class="col-md-3">                
                </div>
            </div>
        </div>
    </header>
    <nav id="menu">
        <div align="center">
            <div class="row">
                <div class="col-md-12">  
                    <ul class="nav nav-tabs nav-justified">
                        <li role="presentation" class="active"><a href="Alumno_Inicio.jsp" class="a1">Inicio</a>    </li>
                        <li role="presentation"> <a href="Rendimiento_Alumno.jsp" class="a1">Mi rendimiento</a>   </li> 
                        <li role="presentation"><a href="Modificar_Datos.jsp" class="a1">Modificar Datos</a>    </li> 
                    </ul> 
                </div>   
            </div>
        </div>
    </nav>
    <section>
        ¡Lo siento!
        <br>
        <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
        <a href="login.jsp">Inicio Sesión</a>
    </section
</body>
</html>
<%} else {%>
<!DOCTYPE html>
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
        <header class="azul-f espaciado">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <h2 class="blanco-l">Alumno</h2>
                    </div>            
                    <img width="55" height="55" src="img/Lapiz.png" alt="">
                    <div class="col-md-3">                
                    </div>
                </div>
            </div>
        </header>
        <nav id="menu">
            <div align="center">
                <div class="row">
                    <div class="col-md-12">  
                        <ul class="nav nav-tabs nav-justified">
                            <li role="presentation" class="active"><a href="Alumno_Inicio.jsp" class="a1">Inicio</a>    </li>
                            <li role="presentation"> <a href="Rendimiento_Alumno.jsp" class="a1">Mi rendimiento</a>   </li> 
                            <li role="presentation"><a href="Modificar_Datos.jsp" class="a1">Modificar Datos</a>    </li> 
                        </ul> 
                    </div>   
                </div>
            </div>
        </nav>
        <div class="mensaje">Bienvenido <%=user.getClave()%><br></div>
        <div class="navegador">
            <div class="codPadre"><br><pre class="btn2">Codigo para Tutor: <%=user.getCodigo()%></pre></div>
		<div class="Regresar"><br><a href="login.jsp"><input type="button" value="Cerrar Sesion" class="btn1"></a></div>
</div>
</body>
</html>
<%}%>

<%} catch (Exception e) {%>
            <section>
                <p>Ha ocurrido un error regresa al Inicio Sesion</p>
                <a href="login.jsp">Inicio Sesion</a>
            </section>
<%}%>