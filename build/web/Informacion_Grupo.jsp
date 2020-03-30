<%-- 
    Document   : Informacion_Grupo
    Created on : 28/04/2019, 12:17:03 PM
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Controlador.*"%>
<!DOCTYPE html>
<%
    try{
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
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo2.png">
        <div>
            <nav>

                <table width="90%" align="center">
                    <tr>
                        <td align="left"><h1 class="titulo">Comparacion de grupos</h1></td>
                        <td align="right"><img width="55" src="img/Lista.png" alt=""></td>
                    </tr>
                </table>
            </nav>
            <div>
                <nav id="menu">
                    <ul>
                        <a href="Jefe_Inicio.jsp" class="a1">Inicio</a>
                        <a href="Alumnos_Grupos.jsp" class="a1">Listado Alumnos</a>
                        <a href="Reporte_Grupos.jsp" class="a1">Reporte grupal</a>
                        <a href="Informacion_Grupo.jsp" class="a1">Comparacion de grupos</a>
                        <a href="Editar_Grupos.jsp" class="a1">Editar Grupos</a>
                    </ul>
                </nav>
                <section>
                    <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
                    <a href="login.jsp">Inicio Sesion</a>
                </section>
            </div>
        </div>
    </body>
</html>
<%
} else {
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
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
                        <td align="left"><h1 class="titulo">Comparacion de grupos</h1></td>
                        <td align="right"><img width="55" src="img/Lista.png" alt=""></td>
                    </tr>
                </table>
            </nav>
            <div>
                <nav id="menu">
                    <ul>
                        <a href="Jefe_Inicio.jsp" class="a1">Inicio</a>
                        <a href="Alumnos_Grupos.jsp" class="a1">Listado Alumnos</a>
                        <a href="Reporte_Grupos.jsp" class="a1">Reporte grupal</a>
                        <a href="Informacion_Grupo.jsp" class="a1">Comparacion de grupos</a>
                        <a href="Editar_Grupos.jsp" class="a1">Editar Grupos</a>
                    </ul>
                </nav>


                <section >
                    <div align="center">
                        <table border="0" align="center" width="100%">


                            <tr>
                                <td ><h1 >Grafica 1  </a></h1></td><td ><h1>Grafica 2</a></td>
                            </tr>
                            <tr>
                                <td >
                                    <img src="img/p1.jpg" width="500" height="500" name="Imagen">
                                    <script>
                                        var _img = new Array();
                                        _img[0] = new Image();
                                        _img[0].src = "img/p1.jpg";
                                        _img[1] = new Image();
                                        _img[1].src = "img/p2.jpg";
                                        _img[2] = new Image();
                                        _img[2].src = "img/p3.jpg";
                                        function cambiarA(_obj)
                                        {
                                            if (!_obj)
                                                return;
                                            var _index = _obj.selectedIndex;
                                            if (!_index)
                                                return;
                                            var _item = _obj[_index].value;
                                            if (!_item)
                                                return;
                                            if (_item < 0 || _item >= _img.length)
                                                return;
                                            document.images["Imagen"].src = _img[_item].src;
                                        }
                                    </script>
                                    <form method="get">
                                        <select onchange="cambiarA(this)" style="background-color: rgb(77,193,214);color: white">
                                            <option value="0">4IV6</option>
                                            <option value="1">4IV7</option>
                                            <option value="2">4IV8</option>
                                        </select>
                                    </form>
                                </td>
                                <td >
                                    <img src="img/p1.jpg" width="500" height="500" name="Imagen2">
                                    <script>
                                        var _img2 = new Array();
                                        _img2[0] = new Image();
                                        _img2[0].src = "img/p1.jpg";
                                        _img2[1] = new Image();
                                        _img2[1].src = "img/p2.jpg";
                                        _img2[2] = new Image();
                                        _img2[2].src = "img/p3.jpg";
                                        function cambiarB(_obj)
                                        {
                                            if (!_obj)
                                                return;
                                            var _index = _obj.selectedIndex;
                                            if (!_index)
                                                return;
                                            var _item = _obj[_index].value;
                                            if (!_item)
                                                return;
                                            if (_item < 0 || _item >= _img.length)
                                                return;
                                            document.images["Imagen2"].src = _img[_item].src;
                                        }
                                    </script>
                                    <form method="get">
                                        <select onchange="cambiarB(this)" style="background-color: rgb(77,193,214);color: white;">
                                            <option value="0">4IV6</option>
                                            <option value="1">4IV7</option>
                                            <option value="2">4IV8</option>
                                        </select>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td ><h3 ></h3></td>
                                <td ><h3></h3></td>
                            </tr>

                            <tr>
                                <td ></td>
                            </tr>
                            <tr><td ><br><br><br></td></tr>
                        </table>
                        <table align="center">

                        </table>
                        <table align="right">
                            <tr>
                                <td align="left" colspan="2"  class="td3"><br><br><a href="Jefe_Inicio.jsp"><input type="button" name="Regresar" value=Regresar  class="btn1"></a></td>
                            </tr>
                        </table>
                    </div>
                </section>
            </div>

    </body>
</html>
<%}%>
<%}catch(Exception e){%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo2.png">
        <div>
            <nav>

                <table width="90%" align="center">
                    <tr>
                        <td align="left"><h1 class="titulo">Comparacion de grupos</h1></td>
                        <td align="right"><img width="55" src="img/Lista.png" alt=""></td>
                    </tr>
                </table>
            </nav>
            <div>
                <nav id="menu">
                    <ul>
                        <a href="Jefe_Inicio.jsp" class="a1">Inicio</a>
                        <a href="Alumnos_Grupos.jsp" class="a1">Listado Alumnos</a>
                        <a href="Reporte_Grupos.jsp" class="a1">Reporte grupal</a>
                        <a href="Informacion_Grupo.jsp" class="a1">Comparacion de grupos</a>
                        <a href="Editar_Grupos.jsp" class="a1">Editar Grupos</a>
                    </ul>
                </nav>
                <section>
                    <p>Ha ocurrido un error regresa a Inicio Sesion</p>
                    <a href="login.jsp">Inicio Sesion</a>
                </section>
            </div>
        </div>
    </body>
</html>
<%}%>