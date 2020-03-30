<%-- 
    Document   : Alumnos_Grupos
    Created on : 26/04/2019, 12:34:30 AM
    Author     : Usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Controlador.*"%>
<!DOCTYPE html>
<%
    try {
        HttpSession sesion = request.getSession();
        Usuario user;
        Usuario nulo = new Usuario();
        String clave;
        String error;
        String MostrarR;
        int tipo;

        try {
            MostrarR = sesion.getAttribute("ErrorMostrarRendimiento").toString();
            if (MostrarR == null) {
                MostrarR = "";
            }
        } catch (Exception e) {
            MostrarR = "";
        }

        try {
            error = sesion.getAttribute("ErrorConsultaAlumnos").toString();
            if (error == null) {
                error = "";
            }
        } catch (Exception e) {
            error = "";
        }

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
        <title></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo3.png">
        <div align=" center">
             <header class="azul-f">   
 <br>
     <div class="row">

     <div class="col-md-9"><h2 class="blanco-l">Lista de Alumnos </h2>  </div> 
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
            </nav><br><br>
            <section>
                ¡Lo siento!
                <br>
                <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
                <a href="login.jsp">Inicio Sesión</a>
            </section>
        </div>
    </body>
</html>
<%} else {%>
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

     <div class="col-md-9"><h2 class="blanco-l">Lista de Alumnos </h2>  </div> 
     <div class="col-md-3"><img width="55" src="img/Gráficas.png" alt="">  </div>
      
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
            <%
                Usuario sesionactiva = (Usuario) sesion.getAttribute("seguimiento");
                List<Grupo> list = Datos.ConsultaGrupos(sesionactiva.getNumerojefe());
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
           <section align="center">
                <div align="center">
                    <table border="0" align="center" width="100%">
                        <tr>
                            
                            <td align="center" ><nav><h1 class="blanco-f">LISTA DE GRUPOS  </h1></nav></td><td align="center" ><nav><h1 class="blanco-f">ALUMNOS</h1></nav></tr>
                        <tr>
                            <td align="center">
                                <h4 class="blanco-f">Para Mostrar los Alumnos de los Grupos de seleccione el Grupo que quiere y de click en mostrar.</h4><br>
                                <h2>
                                    <div class="gris-f">
                                    <form method="post" action="ConsultarAlumnos">
                                        
                                        
                                        <table  align="center"  cellspacing="10">
                                            
                                            <tr>
                                                <td align="center"><h4 class="blanco-f"> Nombre Grupo</h4> </td>
                                            </tr>
                                           
                                            <%                                                    for (Grupo h : list) {

                                            %>
                                             <tr>
                                                 <td align="center" class="P_h"><input class="P_h" type="radio"  name="SeleccionGrupo" id="<%=h.getNombreGrupo()%>"  value="<%=h.getNombreGrupo()%>"><label for="<%=h.getNombreGrupo()%>"><h4><%=h.getNombreGrupo()%></h4></label></td>
                                           </tr>
                                            <%}%>
                                          
                                        </table>
                                        <br>
                                        <input type="submit"  class="btn1" value="Mostrar Alumnos">
                                    </form>
                                            </div>
                                </h2>
                            </td>
                            <%
                                List<Usuario> lista;
                                try {
                                    lista = (List<Usuario>) sesion.getAttribute("Alumnos");
                                    if (lista == null) {
                                        lista = new ArrayList<>();
                                    }
                                } catch (Exception e) {
                                    lista = new ArrayList<>();
                                }

                            %>
                           <td align="center">
                                <section  class="boxContenedor">
                                    <h4 class="blanco-f">Para ver el rendimiento por Alumno seleccione al Alumno y de click en el botón de mostrar</h4><br>
                                   
                                        <div class="table-responsive">
                                        <form method="post" action="MostrarRendimiento"> 
                                        <table class="table  table-condensed"border="0" border-color="white" align="center" width="100%">
                                           
                                            <tr>
                                                <td align="center"><h4 class="blanco-l azul-f">BOLETA</h4></td><td align="center"><h4 class="blanco-l azul-f">USUARIO ALUMNO</h4></td><td align="center"><h4 class="blanco-l azul-f">INGRESO QUINCENAL</h4></td><td align="center"><h4 class="blanco-l azul-f">VIVIENDA</h4></td><td align="center"><h4 class="blanco-l azul-f">¿TRABAJA?</h4></td><td align="center"><h4 class="blanco-l azul-f">RESULTADO TEST PERSONALIDAD</h4></td>
                                            </tr>
                                            <%for (Usuario u : lista) {
                                            %>
                                             <tr>
                                                <td align="center"><input type="radio" value="<%=u.getClave()%>" name="SeleccionAlumno"><label for=<%=u.getBoleta()%><h4 class="P_h"><%=u.getBoleta()%></h4></label></td><td align="center"><h4 class="blanco-f2"><%=u.getClave()%></h4></td>
                                                <td align="center"><h4 class="blanco-f2"><%if (u.getIngreso() == 2) {
                                                        %>0-800 pesos<%
                                                        } else if (u.getIngreso() == 4) {
                                                        %>800-3000 pesos<%
                                                        } else if (u.getIngreso() == 6) {
                                                        %>3000-7000 pesos<%
                                                        } else if (u.getIngreso() == 8) {
                                                        %>7000 o mas<%
                                                        } else {
                                                        %>No ha respondido el Test Economico<%
                                                            }
                                                        %></h4></td><td align="center"><h4 class="blanco-f2"><%if (u.getVivienda() == 21) {
                                                        %>Propia<%
                                                        } else if (u.getVivienda() == 14) {
                                                        %>Rentada<%
                                                        } else if (u.getVivienda() == 7) {
                                                        %>Prestada<%} else {
                                                        %>No ha respondido el Test Economico<%
                                                            }
%></h4></td><td align="center"><h4 class="blanco-f2"><%if (u.getTrabajo() == 2) {
                                                        %>SI<%
                                                        } else if (u.getTrabajo() == 6) {
                                                        %>NO<%
                                                        } else {
                                                        %>No ha respondido el Test Economico<%
                                                            }
                                                        %></h4></td>
                                                <td align="center"><b>
                                                        <%
                                                            int p;
                                                            try {
                                                                p = u.getPersonalidad();
                                                                if (p == 0) {

                                                                    p = 0;
                                                                }
                                                            } catch (Exception ut) {
                                                                p = 0;
                                                            }
                                                            System.out.println(u.getPersonalidad());
                                                            if (u.getPersonalidad() <= 8 && u.getPersonalidad() > 0) {
                                                        %>
                                                        <h4 class="blanco-f2">6</h4>
                                                        <%} else if (u.getPersonalidad() >= 9 && u.getPersonalidad() <= 13) {%>
                                                        <h4 class="blanco-f2">10</h4>
                                                        <%} else if (u.getPersonalidad() >= 14) {%>
                                                        <h4 class="blanco-f2">8</h4>
                                                        <%} else if (u.getPersonalidad() == 0) {%>
                                                        <h4 class="blanco-f2">No ha respondido el Test de Personalidad</h4>
                                                        <%}%>
                                                    </b>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </table>
                                        
                                       
                                        <br>
                                        <input type="submit"  class="btn1" value="Mostrar Rendimiento del Alumno ">
                                    </form> </div>
                                    <%
                                        if (MostrarR.equals("")) {
                                    %>
                                    <h4 class=blanco-f>ERROR: No se ha seleccionado ningun Alumno</h4>
                                    <%
                                            sesion.setAttribute("ErrorMostrarRendimiento", " ");
                                        }
                                    %>
                                </section>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="0" align="center">
                                <%
                                    if (error.equals("")) {
                                %>
                                <h5>ERROR: No se ha seleccionado un grupo</h5>

                                <%sesion.setAttribute("ErrorConsultaAlumnos", " ");
                                } else if (lista.size() == 0) {
                                %><h4 class=blanco-f>ERROR: No hay Alumnos seleccionados en este grupo</h4><%
                                    }
                                %>                    
                                </div>
                                </section>
                                <div align="center">
                                     <form method="post" action="Filtrado">
                <table align="center" width="100%" border="0">
                    
	<tr>
		<td align="center"><nav>
                        <br>   
                        <br>
                    <h1 class="blanco-f">Filtrado de Alumnos</h1>
                    </nav>
		</td>
	</tr>
	<tr>
            <td align="center"   > 
			<select class="PS1" name="fil">
				<option>Alumnos que trabajan</option>
				<option>Alumnos que no trabajan</option>
				<option>Alumnos con vivienda propia</option>
				<option>Alumnos con vivienda rentada</option>
				<option>Alumnos con vivienda prestada</option>
				<option>Alumnos con ingreso familiar mensual de 0 a 800 pesos</option>
				<option>Alumnos con ingreso familiar mensual de 800 a  3000 pesos</option>
				<option>Alumnos con ingreso familiar mensual de 3000 a 7000 pesos</option>
				<option>Alumnos con ingreso familiar mensual de mas de 7000 pesos</option>
				<option>Alumnos con un resultado menor a 9 en el Test de personalidad</option>
				<option>Alumnos con un resultado entre 9 y 13 en el Test de personalidad</option>
				<option>Alumnos con un resultado mayor a 13 en el Test de personalidad</option>
                                
			</select>
		</td>
	</tr>
        <tr>
            <td>  

                                            <%
                                                List<Usuario> listaf;
                                                int x = 1;
                                                try {
                                                    listaf = (List<Usuario>) sesion.getAttribute("ListaF");
                                                    for (Usuario u : listaf) {
                                                        u.getBoleta();

                                                    }
                                                } catch (Exception e) {
                                                    listaf = new ArrayList<>();
                                                    x = 0;
                                                }
                                                System.out.println("K");
                                                System.out.println(x);
                                                if (x == 1) {
                                            %>
                                            <tr>
                                                <td align="center">
                                                    <br>    
                                                    <table align="center" border="3">
                                                        <tr><td align="center"><h5 class="blanco-l">ALUMNO</h5></td><td align="center"><h5 class="blanco-l">BOLETA</h5></td></tr>
                                                        <%for (Usuario u : listaf) {%>
                                                        <tr>
                                                            <td><b><%=u.getBoleta()%></b></td>
                                                            <td><b><%=u.getClave()%></b></td>
                                                        </tr>
                                                        <%}%>
                                                    </table>
                                                </td>
                                                <%}%>
                                            </tr>
                                        </table>
                                        <tr>
                                            <td align="center"><input type="submit" class="btn1" value="Filtrar"></td>
                                        </tr>
                                    </form>
                    </table>
                </div>
                <div align="center">
                    <table align="right">
                        <tr>
                            <td align="left" colspan="2"  class="td3"><br><br><a href="login.jsp"><input type="button"  value="Cerrar Sesion"   class="btn1"></a></td>
                        </tr>
                    </table>
                </div>
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