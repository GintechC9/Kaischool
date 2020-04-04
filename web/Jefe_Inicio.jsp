<%-- 
    Document   : Jefe_Inicio
    Created on : 26/04/2019, 12:24:33 AM
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
            if(tipo!=3){
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
        <div align="center">
            <header class="azul-f">   
                <br>
                <div class="row">
                    <div class="col-md-9"><h2 class="blanco-l">Jefe de Área </h2>  </div> 
                    <div class="col-md-3"><img width="55" src="img/Gráficas.png" alt="">  </div>
                </div>
            </header>
            <nav id="menu">
                <div align="center">
                    <div class="row">
                        <div class="col-md-12">  
                            <ul class="nav nav-tabs nav-justified">
                                <li role="presentation" class="active"><a href="Jefe_Inicio.jsp" class="a1">Inicio</a>    </li>
                                <li role="presentation"> <a href="Alumnos_Grupos.jsp" class="a1">Listado Alumnos</a>   </li> 
                                <li role="presentation"><a href="Reporte_Grupos.jsp" class="a1">Reporte grupal</a>    </li> 
                                <li role="presentation"> <a href="Editar_Grupos.jsp" class="a1">Editar Grupos</a>   </li>     
                            </ul> 
                        </div>   
                    </div>
                </div>
            </nav>
            <br><br>
            <section align=" center">
                ¡Lo siento!
                <br>
                <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
                <a href="login.jsp">Inicio Sesión</a>
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
                <div class="container">
                    <br>
                    <div class="row">
                        <div class="col-md-9"><h2 class="blanco-l"> Jefe de Área </h2>  </div> 
                        <div class="col-md-3"><img width="55" src="img/Gráficas.png">  </div>
                    </div>
                </div>
            </header>
            <nav id="menu">
                <div align="center">
                    <div class="row">
                        <div class="col-md-12">  
                            <ul class="nav nav-tabs nav-justified">
                                <li role="presentation" class="active"><a href="Jefe_Inicio.jsp" class="a1">Inicio</a>    </li>
                                <li role="presentation"> <a href="Alumnos_Grupos.jsp" class="a1">Listado Alumnos</a>   </li> 
                                <li role="presentation"><a href="Reporte_Grupos.jsp" class="a1">Reporte grupal</a>    </li> 
                                <li role="presentation"> <a href="Editar_Grupos.jsp" class="a1">Editar Grupos</a>   </li>     
                            </ul> 
                        </div>   
                    </div>
                </div>
            </nav>
            <br>
            <div class="mensaje">Bienvenido <%=user.getClave()%><br></div>
            <div class="navegador">
                <div class="Regresar"><br><a href="login.jsp"><input type="button" name="return" value="Cerrar Sesion" class="btn1"></a></div>
            </div>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
<%}%>
<%} catch (Exception e) {%>
<section>
    <p>Ha ocurrido un error regresa a Iniciar Sesion</p>
    <a href="login.jsp">Inicio Sesion</a>
</section>
<%}%>