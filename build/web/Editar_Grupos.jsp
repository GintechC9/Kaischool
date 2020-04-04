<%-- 
    Document   : Editar_Grupos
    Created on : 23/04/2019, 10:09:30 PM
    Author     : Usuario
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Controlador.*"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="icon" href="img/logo.ico">
        <script type="text/javascript" src="JS/validar.js"></script>
    </head>
    <%
        try {

            HttpSession sesion = request.getSession();
            String s = "h";
            String jef = "";
            try {
                Usuario sesionactiva = (Usuario) sesion.getAttribute("seguimiento");
                jef = sesionactiva.getNumerojefe().toString();
            } catch (Exception e) {
                s = "";
            }

            if (s.equals("h")) {
                List<Grupo> list = Datos.ConsultaGrupos(jef);
                String mensaje;
                try {
                    mensaje = sesion.getAttribute("ErrorCambiarGrupo").toString();
                    if (mensaje == null) {
                        mensaje = "";
                    }
                } catch (Exception e) {
                    mensaje = "";
                }
    %>
    <body background="img/fondo2.png">
        <div>
            <header class="azul-f"> <div class="container">  
                    <br>
                    <div class="row">
                        <div class="col-md-9"><h2 class="blanco-l">Editar Grupos </h2>  </div> 
                        <div class="col-md-3"><img width="55" src="img/Lapiz.png" alt="">  </div>
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
            <section >
                <div align="center">
                    <h5 class="blanco-f">Recuerde que para que sus alumnos puedan hacer uso del Sistema tendra que proporcionarles el codigo del grupo.</h5>
                    <br>
                    <form method="post" action="NombreGrupo">
                        <table border="0" align="center" width="100%">
                            <tr>
                                <td align="center"><h4 class="blanco-f">LISTA DE GRUPOS  </h4></td><td align="center"><h4 class="blanco-f">NOMBRE</h4></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <div class="boxContenedor">
                                        <br>
                                        <table border="0" bordercolor="black">
                                            <tr>
                                                <td align="center"> <h4 class="blanco-l azul-f ">Nombre Grupo</h4> </td><td class="azul-l">  .</td><td align="center"> <h4 class="blanco-l azul-f">Codigo Grupo</h4> </td>
                                            </tr>
                                            <%                                                    for (Grupo h : list) {

                                            %>
                                            <tr>
                                                <td align="center"><input type="radio" name="SeleccionGrupo" id="<%=h.getNombreGrupo()%>" value="<%=h.getNombreGrupo()%>"><label for="<%=h.getNombreGrupo()%>"><h5><%=h.getNombreGrupo()%></h5></label></td>
                                                <td class="azul-l">  .</td>
                                                <%if (h.getCodigoGrupo().equals("")) {%><td align="center">No hay codigo de Grupo</td><%} else {%><td align="center"><h5 class="blanco-l azul-f"><b><%=h.getCodigoGrupo()%></b></h5></td><%}%>
                                            </tr>
                                            <%}%>
                                        </table>
                                    </div>
                                </td>
                                <td>
                                    <div class="boxContenedor">
                                        <table align="center">
                                            <tr>
                                                <td align="center"><br><h4 class="blanco-f ">Nuevo Nombre:</h4><input type="text" name="NombreGrupo" pattern=".{4,5}"  required title="El nombre debe de ser entre 4 y 5 caracteres" onkeypress="return validarG(event)" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false"></td>
                                            </tr>
                                            <tr>
                                                <td align="left" colspan="2"  class="td3"><br><input type="submit" value="Cambiar Nombre" class="btn1"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center" class="blanco-l azul-f"><b>No se aceptan los siguientes caracteres: ' " = ? ¿ ¡ ! ( ) ; $ %  * - + ; : {} [] < > | ¬ °</b> <br></td>
                                            </tr>
                                             <tr>
                                                <td align="center"><h5 class="blanco-f">Para cambiar el nombre del grupo seleccione el grupo a cambiar, ingrese el nuevo nombre en el campo de texto y haga click en el boton de "Cambiar Nombre"</h5></td>
                                            </tr>
                                            <%
                                                if (mensaje.equals("")) {
                                                } else {
                                            %>
                                            <tr>
                                                <td align="center"><br><h5><%=mensaje%></h5></td>
                                            </tr>
                                            <%
                                                    sesion.setAttribute("ErrorCambiarGrupo", "");
                                                }
                                            %>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <br>      
                    <br>
                    <br>
                                        <br>
                    <br>
                    <h3 aling="center" class="blanco-f">Subir calificaciones todos sus Alumnos</h3>
                    <form action = "SubirArchivo" method = "post" enctype = "multipart/form-data">
                        <input type = "file" name = "file" size = "50" />
                        <input type = "submit" value = "Subir Archivo de Calificaciones" />
                    </form>
                    <%   String error1;
                        String error2;

                        try {
                            error1 = sesion.getAttribute("ErrorCarga").toString();
                            if (error1 == null) {
                                error1 = "";
                            }
                        } catch (Exception e) {
                            error1 = "";
                        }

                        try {
                            error2 = sesion.getAttribute("ErrorLectura").toString();
                            if (error1 == null) {
                                error2 = "";
                            }
                        } catch (Exception e) {
                            error2 = "";
                        }

                        if (error1.equals("")) {
        sesion.setAttribute("ErrorCarga", "");   %><h5 class="azul-f2 blanco-l">Ha ocurrido un error en la carga revisa el tipo de archivo cargado</h5> <%
                            } else if (error2.equals("ERROR")) {
                    %>
                    <h5 class="azul-f2 blanco-l">Se encontro un error de Lectura llevisa si el archivo cumple con las condiciones necesarias</h5>
                    

                    <%
                    } else {
                    %>
                    <h5 class="azul-f2 blanco-l">Se a cargado el archivo de manera correcta</h5>

                    <%
                            sesion.setAttribute("ErrorCarga", "");
                            sesion.setAttribute("ErrorLectura", "");
                        }%>
                    <div align="center" width="50%">
                        <br>
                        <h5 class="blanco-f">Formato de su Archivo de Calificaciones</h5>

                        <h4 class="blanco-f">Requerimientos:</h4>

                        <p>
                            -Su archivo debera tener la extension xlsx
                            <br>
                            -Se recomienda que el nombre del archivo sea el numero de empleado para evitar errores.

                            <br>Ejemplo:<br>

                            <b>018554.xlsx</b>
                        <br><h4>Tendra que tener la siguiente forma:</h4>
                        </p>
                        <img src="img/Tut.png" width="90%">
                        <p align="center" class="azul-f2 blanco-l">
                            <br>
                            <b>INTRUCCIONES:</b><br>-No se debe equivocar en la escritura de las boletas. Si algo es erroneo no se podra visualizar  el Rendimiento del Alumno.                                
                            <br>
                            Las Calificaciones deben estar sin decimales.
                            <br>
                            El nombre de la hoja se debe llamar '<b>calificaciones</b>'
                            como muestra en la imagen.
                            <br>
                            Los campos de la Hoja deben estar escritos tal cual.
                            <br>
                            <b>Las Calificaciones debe estar en un rango de 0 a 10 y redondeadas.
                                <br>
                            Los campos deben estar en el orden mostrado.
                            </b>
                            <br>
                            Los campos son:
                        </p>
                        <div class="azul-f2 blanco-l">
                        <ul style="disc">
                            <li type="disc">boleta </li>
                            <li>P1_AFM1</li>
                            <li>P2_AFM1</li>
                            <li>P3_AFM1</li>
                            <li>P1_AHU1</li>
                            <li>P2_AHU1</li>
                            <li>P3_AHU1</li>
                            <li>P1_AFM2</li>
                            <li>P2_AFM2</li>
                            <li>P3_AFM2</li>
                            <li>P1_AHU2</li>
                            <li>P2_AHU2</li>
                            <li>P3_AHU2</li>
                            <li>P1_AFM3</li>
                            <li>P2_AFM3</li>
                            <li>P3_AFM3</li>
                            <li>P1_AHU3</li>
                            <li>P2_AHU3</li>
                            <li>P3_AHU3</li>
                            <li>P1_APR3</li>
                            <li>P2_APR3</li>
                            <li>P3_APR3</li>
                            <li>P1_AFM4</li>
                            <li>P1_AHU4</li>
                            <li>P1_APR4</li>
                        </ul>
                    </div>
                        <br>
                        <p class="azul-f2 blanco-l" blanco-l>
                            Donde P1, P2, P3 se refieren al parcial
                            <br> AFM - Área Físico Matemáticas
                            <br> AHU - Área de Humanísticas
                            <br> APR- Área Profesional
                            <br> y el último número se refiere al semestre
                        </p>
                    <table align="right">
                        <tr>
                            <td align="left" colspan="2"  class="td3"><br><br><a href="login.jsp"><input type="button" value="Cerrar Sesion"   class="btn1"></a></td>
                        </tr>
                    </table>
            </section>
        </div>

    </body>
    <%} else {%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Kaischool Systems</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <header class="azul-f"> <div class="container">  
            <br>
            <div class="row">
                <div class="col-md-9"><h2 class="blanco-l">Editar Grupos </h2>  </div> 
                <div class="col-md-3"><img width="55" src="img/Lapiz.png" alt="">  </div>
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
    </nav><br><br>
    <div align="center">
        <section >
            ¡Oops!
            <br>
            <p>Ha ocurrido un error regresa al Inicio Sesion</p>
            <a href="login.jsp" >Inicio Sesion</a>
        </section>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
<%}%>
<%} catch (Exception e) {%>
<section>
    <p>Ha ocurrido un error regresa a Inicio Sesion</p>
    <a href="login.jsp">Inicio Sesion</a>
</section>
s<%}%>