<%-- 
    Document   : Modificar_Datos
    Created on : 26/04/2019, 12:00:28 AM
    Author     : Usuario
--%>

<%@page import="java.util.List"%>
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
            tipo = user.getTipo();
            if (tipo != 2) {
                tipo = 5;
            }
            if (clave == null) {
                clave = "";
            }
            if (tipo == 0) {
                tipo = 5;
            }
        } catch (Exception e) {
            clave = "";
            tipo = 5;
        }
        if (clave.equals("") || tipo == 5) {%>

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
                        <h2 class="blanco-l">Modificar Información</h2>
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
        <section align=" center">
            ¡Lo siento!
            <br>
            <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
            <a href="login.jsp">Inicio Sesión</a>
        </section>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>

<%} else {

    Usuario u = Datos.ConsultaTests(clave);
    int per;
    try {
        per = u.getPersonalidad();
        System.out.println(per);
    } catch (Exception e) {
        per = -1;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <script type="text/javascript" src="JS/validar.js"></script>
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo2.png">
        <div>
            <header class="azul-f espaciado">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9">
                            <h2 class="blanco-l">Modificar Información</h2>
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
            </nav
            <section>
                <div align="center">
                    <h4 align="center" class="blanco-f">Para contertar los Test seleccione el link de abajo y responda las preguntas</h4>
                </div>
                <br>
                <div class="gris-f">
                    <br><br><h4 align="center">
                        <a href="Test_Economico.jsp"><input type="button" class="btn1" value="Estudio Socio-Económico"></a></h4><%
                            if (u.getEconomico() == 0) {
                        %><br><div align="center"><h5 align="center" class="blanco-f" ><b>No haz respondido el Estudio Socioeconomico</b></h5></div><%
                        } else {
                    %><br><div align="center"><h5 align="center" class="blanco-f"><b>Recuerda tener tu Estudio   Acutalizado</b></h5></div><%
                        }
                    %><br>
                    <h4 align="center"><a  href="Test_Personalidad.jsp"><input type="button" class="btn1" value="Test de personalidad"></a></h4>
                    <%if (per == 0) {
                    %><br><div align="center"><h5 align="center" class="blanco-f"><b>No haz respondido el test de Personalidad</b></h5></div><%
                    } else {
                    %>
                    <br><div align="center"><h5 align="center" class="blanco-f"><b>Recuerda tener tu test Acutalizado</b></h5></div>
                    <%
                        }
                    %>
                    <br>
                </div>


                <br><br><br><br><br>
                <table border="0" align="center" width="100%">
                    <tr>
                        <td><div class="codPadre"><br><pre class="btn2">Codigo para Tutor:<%=user.getCodigo()%></pre></div></td>
		<td colspan="2"  class="td3"><br><br><a  href="login.jsp"><input type="button" value="Cerrar Sesion"  class="btn1"></a></td>
	</tr>
	</table>
</section>
	</div>
	
</body>
</html>
<%}%>
<%} catch (Exception e) {%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo2.png">
        <div class="general">
            <nav>

                <table width="90%" align="center">
                    <tr>
                        <td align="left"><h1 class="titulo">Alumno</h1></td>
                        <td align="right"><img width="55" src="img/Lapiz.png" alt=""></td>
                    </tr>
                </table>
            </nav>
            <nav id="menu">
                <ul>
                    <a href="Alumno_Inicio.jsp">Inicio</a>
                    <a href="Rendimiento_Alumno.jsp" class="a1">Mi Rendimiento</a>
                    <a href="Modificar_Datos.jsp" class="a1">Modificar Datos</a>
                </ul>
            </nav>
            <section>
                <p>Ha ocurrido un error regresa a Inicio Sesion</p>
                <a href="login.jsp">Inicio Sesion</a>
            </section>
        </div>
    </body>
</html>
<%}%>