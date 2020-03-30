<%-- 
    Document   : Reporte_Grupos
    Created on : 28/04/2019, 01:50:29 PM
    Author     : Javier
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="Controlador.*" language="java"%>
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
            if (tipo != 3) {
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
        if (clave.equals("") || tipo == 5) {
%>
<html lang="es">
   <head>
        <meta charset="UTF-8">
        <title>Kaischool Systems</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="">
       <header class="azul-f"> <div class="container">  
 <br>
     <div class="row">

     <div class="col-md-9"><h2 class="blanco-l">Reporte de grupos </h2>  </div> 
     <div class="col-md-3"><img width="55" src="img/Lista.png" alt="">  </div>
      
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
           <li role="presentation"><a href="Informacion_Grupo.jsp" class="a1">Comparacion de grupos</a>    </li> 
            <li role="presentation"> <a href="Editar_Grupos.jsp" class="a1">Editar Grupos</a>   </li>     


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
        </div>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </body>
</html>
<%} else {
    String jef = "";
    try {
        Usuario sesionactiva = (Usuario) sesion.getAttribute("seguimiento");
        jef = sesionactiva.getNumerojefe().toString();
    } catch (Exception e) {
    }
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
    <body background="img/fondo2.png">
        <div>
            <header class="azul-f"> <div class="container">  
                    <br>
                    <div class="row">

                        <div class="col-md-9"><h2 class="blanco-l">Reporte de grupos </h2>  </div> 
                        <div class="col-md-3"><img width="55" src="img/Lista.png" alt="">  </div>

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
                    <h5 class="blanco-f">Para visualizar el Rendimiento de cada Grupo selecciona el grupo.<br>Luego selecciona la seccion deseada y da click e 'Mostrar Rendimiento'.</h5>
                    <table border="0" align="center" width="100%">
                        <tr>
                            <td align="center" colspan="2"><h2 class="blanco-f">Rendimiento del grupos por Area</h2><br></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <%                                            String rg2 = "";

                                    try {
                                        rg2 = sesion.getAttribute("ErrorRG2").toString();
                                        if (rg2 == null) {
                                            rg2 = "";
                                        }
                                    } catch (Exception a) {
                                        rg2 = "";
                                    }

                                    if (rg2.equals("")) {
                                %>
                                <b><h5 class="blanco-f">Presione el Boton de Mostrar Rendimiento para verlo</h5></b>

                                <%} else if (rg2.equals("ERROR")) {%>
                                <b<h5 class="blanco-f">A ocurrido un error vuelva a intentarlo mas tarde</h5></b>

                                <%} else if (rg2.equals("ERRORA")) {
                                %>
                                <b><h5 class="blanco-f">No hay alumnos en este grupo.<br>Por lo que no se puede mostrar el reporte.</h5></b>
                                    <%
                                } else if (rg2.equals("N")) {%>
                                    <%//System.out.println("HOLA");%>
                                    <%

                                        try {
                                            String codigo2 = sesion.getAttribute("GRUPO2").toString();
                                            //System.out.println("HOLA1");
                                            //System.out.println(codigo);
                                        } catch (Exception c) {
                                            //System.out.println("EROR");
                                            String codigo2 = sesion.getAttribute("GRUPO2").toString();
                                        }
                                        String codigo2 = sesion.getAttribute("GRUPO2").toString();
                                        String grupo2 = sesion.getAttribute("nomg2").toString();
                                    %>
                                <br>
                                <h2 class="blanco-f">Grupo:<b> <%=grupo2%></b></h2>
                                <br>
                                <h5 class="blanco-f">Area Fisico Matematico</h5>
                                <br>
                                <img src="Rendimientos/<%=codigo2%>FM.png" width="500" height="40%">
                                <br>
                                <br>
                                <h5 class="blanco-f">Area Humanistica</h5>
                                <br>
                                <img src="Rendimientos/<%=codigo2%>HU.png" width="500" height="40%">
                                <br>
                                <br>
                                <h5 class="blanco-f">Area Profesional</h5>
                                <br>
                                <img src="Rendimientos/<%=codigo2%>PR.png" width="500" height="40%">
                                <br>
                                <%}%>
                            </td>
                            <td align="center">
                                <br>
                                <%                                            String rg = "";

                                    try {
                                        rg = sesion.getAttribute("ErrorRG").toString();
                                        if (rg == null) {
                                            rg = "";
                                        }
                                    } catch (Exception a) {
                                        rg = "";
                                    }

                                    if (rg.equals("")) {
                                %>
                                <b><h5 class="blanco-f">Presione el Boton de Mostrar Rendimiento para verlo</h5></b>

                                <%} else if (rg.equals("ERROR")) {%>
                                <b<h5 class="blanco-f">A ocurrido un error vuelva a intentarlo mas tarde</h5></b>

                                <%} else if (rg.equals("ERRORA")) {
                                %>
                                <b><h5 class="blanco-f">No hay alumnos en este grupo.<br>Por lo que no se puede mostrar el reporte.</h5></b>
                                    <%
                                    } else if (rg.equals("N")) {%>
                                    <%//System.out.println("HOLA");%>
                                    <%

                                        try {
                                            String codigo = sesion.getAttribute("GRUPO").toString();
                                            //System.out.println("HOLA1");
                                            //System.out.println(codigo);
                                        } catch (Exception c) {
                                            //System.out.println("EROR");
                                            String codigo = sesion.getAttribute("GRUPO").toString();
                                        }
                                        String codigo = sesion.getAttribute("GRUPO").toString();
                                        String grupo = sesion.getAttribute("nomg").toString();
                                    %>
                                <br>
                                <h2 class="blanco-f">Grupo: <b><%=grupo%></b></h2>
                                <br>
                                <h5 class="blanco-f">Area Fisico Matematico</h5>
                                <br>
                                <img src="Rendimientos/<%=codigo%>FM.png" width="500" height="40%">
                                <br>
                                <br>
                                <h5 class="blanco-f">Area Humanistica</h5>
                                <br>
                                <img src="Rendimientos/<%=codigo%>HU.png" width="500" height="40%">
                                <br>
                                <br>
                                <h5 class="blanco-f">    Area Profesional</h5>
                                <br>
                                <img src="Rendimientos/<%=codigo%>PR.png" width="500" height="40%">
                                <br>
                                <%}%>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                            </td>
                            <td align="center"></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <form method="post" action="RendimientoG2">
                                    <h4 class="blanco-f">Seleccione un grupo</h4>
                                    <table border="0   " bordercolor="black">
                                        <tr>
                                            <td align="center"> <h5 class="blanco-l azul-f">Nombre Grupo </h5></td>
                                        </tr>
                                        <%                                                    for (Grupo h : list) {
                                                //System.out.println(h.getCodigoGrupo());

                                        %>
                                        <tr>
                                            <td align="center"><input type="checkbox" value="<%=h.getCodigoGrupo()%>" name="grupo"><label><%=h.getNombreGrupo()%></label></td>

                                        </tr>
                                        <%}%>
                                    </table>
                                    <br>
                                    <input type="submit"  value="Mostrar Rendimiento"  class="btn1">
                                </form>



                            </td>
                            <td align="center">
                                <form method="post" action="RendimientoG">
                                    <h4 class="blanco-f">Seleccione un grupo</h4>
                                    <table border="0    " bordercolor="black">
                                        <tr>
                                            <td align="center"><h5 class="blanco-l azul-f"> Nombre Grupo </h5></td>
                                        </tr>
                                        <%                                                    for (Grupo h : list) {
                                                //System.out.println(h.getCodigoGrupo());

                                        %>
                                        <tr>
                                            <td align="center"><input type="checkbox" value="<%=h.getCodigoGrupo()%>" name="grupo"><label><%=h.getNombreGrupo()%></label></td>

                                        </tr>
                                        <%}%>
                                    </table>
                                    <br>
                                    <input type="submit"  value="Mostrar Rendimiento"  class="btn1">
                                </form>
                            </td>
                        </tr>
                    </table>
                    <table align="center">
                        <tr>
                            <td>

                            </td>
                        </tr>
                        <tr>

                        </tr>
                    </table>
                    <table align="right">
                        <tr>
                            <td align="left" colspan="2"  class="td3"><br><br><a href="login.jsp"><input type="button"  value="Cerrar Sesion"  class="btn1"></a></td>
                        </tr>
                    </table>
                </div>
            </section>
        </div>

    </body>
</html>
<%}%>
<%} catch (Exception e) {

    System.out.println(e.getMessage());%>
<section>
    <p>Ha ocurrido un error regresa a Inicio Sesion</p>
    <a href="login.jsp">Inicio Sesion</a>
</section>
<%}%>




