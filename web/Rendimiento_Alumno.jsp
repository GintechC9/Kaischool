<%-- 
    Document   : Rendimiento_Alumno
    Created on : 28/04/2019, 12:19:45 PM
    Author     : Usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Controlador.*"%>
<%
    HttpSession sesion = request.getSession();
    try {

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
        if (clave.equals("")) {%>
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
                        <td align="left"><h1 class="titulo">Rendimiento Alumno</h1></td>
                        <td align="right"><img width="55" src="img/Lapiz.png" alt=""></td>
                    </tr>
                </table>
            </nav>
            <section>
                <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
                <a href="login.jsp">Inicio Sesion</a>
            </section>
        </div>
    </body>
</html>

<%} else {

    int tipo = user.getTipo();

    if (tipo == 2) {
        String cla = user.getClave();
        String boleta = user.getBoleta();
        String Ren;
        List<String> lista = new ArrayList<String>();
        String EP = "B";

        try {
            lista = (List<String>) sesion.getAttribute("PROB");
        } catch (Exception u) {
            EP = "";
        }

        try {
            Ren = sesion.getAttribute("ERRORALU").toString();
            if (Ren == null) {
                Ren = "";
            }
        } catch (Exception e) {
            Ren = "";
        }

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Kaischool Systmes</title>
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
                        <h2 class="blanco-l">Mi Rendimiento</h2>
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
            <table border="0" align="center" width="100%">
                <tr>
                    <%                            if (Ren.equals("")) {
                    %>

                    <td class="blanco-f blanco-l">Presiona el boton de Mostrar rendimiento para visualizarlo</td><td ></td></tr>
                <tr>
                    <td ><h3 ></h3></td><td ></td>
                        <% } else if (Ren.equals("ERRORC")) {
                            Ren = "";%>
                <h4 class="azul-f2">Ha ocurrido un error en el Calculo<br>¡Avisale al jefe de Area!</h4>
                <td ></td><td ></td></tr>
                <tr>
                    <td ><h3 ></h3></td><td ></td>
                        <%} else if (Ren.equals("ERROR")) {
                        %>
                <h4 class="azul-f2 blanco-l">Ha ocurrido un error en el Calculo<br>¡Avisale al jefe de Area!</h4>
                <td ></td><td ></td></tr>
                <tr>
                    <td ><h3 ></h3></td><td ></td>
                        <%
                        } else if (Ren.equals("N")) {
                            String r = "";
                            try {
                                String pfm = lista.get(0);
                                String phu = lista.get(1);
                                String ppr = lista.get(2);
                            } catch (Exception e) {
                                r = "PY";
                            }
                            if (r.equals("PY")) {
                        %>
                <h4 class="azul-f2 blanco-l">Ha ocurrido un error en el Calculo porque:<br>*No estas registrado en el el Documento de Calificaciones
                    <br>*Tu boleta no es correcta<br>¡Avisale al jefe de Area!</h4>
                <td ></td><td ></td></tr>
                <tr>
                    <td ><h3 ></h3></td><td ></td>    
                        <%
                        } else {

                            String pfm = lista.get(0);
                            String phu = lista.get(1);
                            String ppr = lista.get(2);
                        %>
                    <td align="center"><h4 class="blanco-f">Grafica de Seguimiento de Calficaciones de Area Fisico Matematico</h4><br>
                        <img src="Rendimientos/<%=boleta%>FM.png" width="500" height="40%">
                    </td>
                    <td align="center"><h4 class="blanco-f">Grafica de Seguimiento de Calficaciones de Area Humanistica</h4><br>
                        <img src="Rendimientos/<%=boleta%>HU.png" width="500" height="40%">
                    </td>
                </tr>
                <tr>
                <h4>
                    <td ><h4 class="blanco-f azul-f">Recuerda Responder tus test para obtener una probabilidad real:<br><br>->La probabilidad de que pase en el Area de Fisico Matematico: <%=pfm%>%<br><br>
                        ->La probabilidad de que pase en el Area de Humanistica: <%=phu%>%<br><br>
                        ->La probabilidad de que pase en el Area de Profesional: <%=ppr%>%<br><br></h4>
                        <table border="0" align="center" >
                            <tr>
                                <td align="center" class="azul-f blanco-l"><h5>BOLETA</h5></td><td align="center"  class="azul-f blanco-l"><h5>ALUMNO</h5></td><td align="center" class="azul-f blanco-l"><h5>INGRESO QUINCENAL</h5></td><td align="center" class="azul-f blanco-l"><h5>VIVIENDA</h5></td><td align="center" class="azul-f blanco-l"><h5>¿TRABAJA?</h5></td><td align="center" class="azul-f blanco-l">RESULTADO TEST PERSONALIDAD</td>
                            </tr>
                            <%
                                Usuario u = new Usuario();
                                try {
                                    u = (Usuario) sesion.getAttribute("DATPRA");
                                } catch (Exception e) {
                                    u = new Usuario();
                                }
                                //System.out.println("preba");
                                //System.out.println(u.getClave());
                                //System.out.println(u.getBoleta());

                            %>
                            <tr>
                                <td align="center"><h4 class="blanco-f2"><%=u.getBoleta()%></h4></td><td align="center"><h4 class="blanco-f2"><%=u.getClave()%></h4></td>
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
                                        %></h4></td><td align="center"><h4 class="blanco-f"><%if (u.getTrabajo() == 2) {
                                        %>SI<%
                                        } else if (u.getTrabajo() == 6) {
                                        %>NO<%
                                        } else {
                                        %>No ha respondido el Test Economico<%
                                            }
                                        %></h4></td>
                                <td align="center"><h4 class="blanco-f2">
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
                                        6
                                        <%} else if (u.getPersonalidad() >= 9 && u.getPersonalidad() <= 13) {%>
                                        10
                                        <%} else if (u.getPersonalidad() >= 14) {%>
                                        8
                                        <%} else if (u.getPersonalidad() == 0) {%>
                                        No ha respondido el Test de Personalidad
                                        <%}%>
                                    </h4></td>
                            </tr>
                            <%%>
                        </table>

                    </td>
                </h4>
                        <td align="center"><h4 class="blanco-f">Grafica de Seguimiento de Calficaciones de Area Profesional</h4><br>
                    <img src="Rendimientos/<%=boleta%>PR.png" width="500" height="40%"></td>
                </tr>
                <tr>
                    <td align="center"><img src="Rendimientos/<%=boleta%>FMP.png" width="500" height="40%"></td>
                    <td align="center">
                        <img src="Rendimientos/<%=boleta%>HUP.png" width="500" height="40%">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><img src="Rendimientos/<%=boleta%>PRP.png" width="500" height="40%"></td>
                </tr>
                <%}
                    }
                %>
                <tr><td ><form method="post" action="RendimientoA">
                            <td  class="td3"><br><input type="submit"  value="Mostrar Rendimiento"  class="btn1"></td>
                        </form></td></tr>
                <tr>
                    <td colspan="1" ><div class="codPadre"><br><pre class="btn2">Clave del padre:<%=user.getCodigo()%></pre></div></td>
<td colspan="2"  class="td3"><br><br><a href="login.jsp"><input type="button"  value="Cerrar Sesion"  class="btn1"></a></td>
	</tr>
	</table>
</section>
	</div>
	
</body>
</html><%%>
<%} else if (tipo == 3) {

    String Rend;

    try {
        Rend = sesion.getAttribute("ERRORALUJ").toString();
        if (Rend == null) {
            Rend = "";
        }
    } catch (Exception e) {
        Rend = "";
    }
    String boleta;
    List<String> lista = new ArrayList<String>();
    String EP = "B";

    try {
        lista = (List<String>) sesion.getAttribute("PROBT");
    } catch (Exception u) {
        EP = "";
    }

    try {
        Rend = sesion.getAttribute("ERRORALUJ").toString();
        if (Rend == null) {
            Rend = "";
        }
    } catch (Exception e) {
        Rend = "";
    }

    try {
        boleta = sesion.getAttribute("JefeA").toString();
        if (boleta == null) {
            boleta = "";
        }
    } catch (Exception e) {
        boleta = "";
    }

    try {
        lista = (List<String>) sesion.getAttribute("PROBT");
    } catch (Exception u) {
        EP = "";
    }
    try {
        String pfm = lista.get(0);
        String phu = lista.get(1);
        String ppr = lista.get(2);
    } catch (Exception e) {
        Rend = "PY";
    }
    String alumno = sesion.getAttribute("Alumno").toString();
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
            <header class="azul-f espaciado">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <h2 class="blanco-l">Rendimiento de <%=alumno%></h2>
                    </div>            
                    <img width="55" height="55" src="img/Lapiz.png" alt="">
                    <div class="col-md-3">                
                    </div>
                </div>
            </div>
        </header>
            <section>
                <table border="0" align="center" width="100%">
                    <tr>
                        <td ><h3 ></h3></td>
                    </tr>

                    <tr>
                        <td ><h3 ></h3></td><td ></td>
                    </tr>
                    <tr>
                        <%                            if (Rend.equals("")) {
                        %>
                        Presiona el boton de Mostrar rendimiento para visualizarlo
                        <%
                            Rend = "";
                        %>
                        <td ></td><td ></td></tr>
                    <tr>
                        <td ><h3 ></h3></td><td ></td>
                            <% } else if (Rend.equals("ERRORC")) {
                            %>
                        Ha ocurrido un error en el Calculo<br>!Avisale al jefe de Area¡
                        <%
                            Rend = "";
                        %>
                    <td ></td><td ></td></tr>
                    <tr>
                        <td ><h3 ></h3></td><td ></td><%
                        } else if (Rend.equals("N")) {
                            String r = "";
                            try {
                                String pfm = lista.get(0);
                                String phu = lista.get(1);
                                String ppr = lista.get(2);
                            } catch (Exception e) {
                                r = "PY";
                            }
                            if (r.equals("PY")) {
                            %>
                            
                         Ha ocurrido un error en el Calculo porque:<br>*Su hijo registrado en el el Documento de Calificaciones
                    <br>*Su boleta no es correcta<br>!Avisele al jefe de Area¡
                    <td ></td><td ></td></tr>
                    <tr>
                        <td ><h3 ></h3></td><td ></td>
                            <%
                            } else {
                                String pfm = lista.get(0);
                                String phu = lista.get(1);
                                String ppr = lista.get(2);
                            %>
                        <td><h4 class="blanco-f">Grafica de Seguimiento de Calficaciones de Area Fisico Matematico</h4><br>
                            <img src="Rendimientos/<%=boleta%>FM.png" width="500" height="40%">
                        </td>
                        <td ><h4 class="blanco-f">Grafica de Seguimiento de Calficaciones de Area Humanistica</h4><br>
                            <img src="Rendimientos/<%=boleta%>HU.png" width="500" height="40%">
                        </td>
                    </tr>
                    <tr>
                        <h4>
                            <td ><h4 class="blanco-f azul-f">Recuerde que los alumnos debe Responder sus test para obtener una probabilidad real:<br><br>->La probabilidad de que pase en el Area de Fisico Matematico: <%=pfm%>%<br><br>
                            ->La probabilidad de que pase en el Area de Humanistica: <%=phu%>%<br><br>
                            ->La probabilidad de que pase en el Area de Profesional: <%=ppr%>%<br><br></h4>
                            <table border="0" align="center" width="100%">
                                <tr>
                                    <td align="center"  class="azul-f blanco-l"><h5>BOLETA</h5></td><td align="center" class="azul-f blanco-l"><h5>ALUMNO</h5></td><td align="center" class="azul-f blanco-l"><h5>INGRESO QUINCENAL</h5></td><td align="center" class="azul-f blanco-l"><h5>VIVIENDA</h5></td><td align="center" class="azul-f blanco-l"><h5>¿TRABAJA?</h5></td><td align="center" class="azul-f blanco-l"><h5>RESULTADO TEST PERSONALIDAD</h5></td>
                                </tr>
                                <%
                                    Usuario u = new Usuario();
                                    try {
                                        u = (Usuario) sesion.getAttribute("DATPRJ");
                                    } catch (Exception e) {
                                        u = new Usuario();
                                    }
                                    System.out.println("preba");
                                    System.out.println(u.getClave());
                                    System.out.println(u.getBoleta());

                                %>
                                <tr>
                                    <td align="center"><h4 class="blanco-f2"><%=u.getBoleta()%></h4></td><td align="center"><h4 class="blanco-f2"><%=u.getClave()%></h4></td>
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
                                    <td align="center"><h4 class="blanco-f2">
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
                                            6
                                            <%} else if (u.getPersonalidad() >= 9 && u.getPersonalidad() <= 13) {%>
                                            10
                                            <%} else if (u.getPersonalidad() >= 14) {%>
                                            8
                                            <%} else if (u.getPersonalidad() == 0) {%>
                                            No ha respondido el Test de Personalidad
                                            <%}%>
                                        </h4></td>
                                </tr>
                                <%%>
                            </table>
                            
                            
                        </td>
                    </h4>
                        
                            <td ><h4 class="blanco-f">Grafica de Seguimiento de Calficaciones de Area Profesional</h4><br>
                            <img src="Rendimientos/<%=boleta%>PR.png" width="500" height="40%">
                        </td>
                </tr>
                         <tr>
                        <td align="center"><img src="Rendimientos/<%=boleta%>FMP.png" width="500" height="40%"></td>
                        <td align="center">
                            <img src="Rendimientos/<%=boleta%>HUP.png" width="500" height="40%">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><img src="Rendimientos/<%=boleta%>PRP.png" width="500" height="40%"></td>
                    </tr>
                    <%}
                        }%>
                   
                    <tr>
<td colspan="2"  class="td3"><br><br><a href="Alumnos_Grupos.jsp"><input type="button"  value="Regresar"  class="btn1"></a></td>
	</tr>
	</table>
</section>
	</div>
	
</body>
</html>
<%} else if (tipo == 1) {
    String codigo = user.getCodigoalumno();
    String boleta;
    List<String> Ren;
    String Rend;
    List<String> lista = new ArrayList<String>();
    String EP = "B";

    try {
        lista = (List<String>) sesion.getAttribute("PROBT");
    } catch (Exception u) {
        EP = "";
    }

    try {
        Rend = sesion.getAttribute("ERRORALUT").toString();
        if (Rend == null) {
            Rend = "";
        }
    } catch (Exception e) {
        Rend = "";
    }

    try {
        Ren = (List<String>) sesion.getAttribute("TutorA");
        if (Ren == null) {
            Ren = new ArrayList<>();
        }
    } catch (Exception e) {
        Ren = new ArrayList<>();
    }
    try {
        boleta = Ren.get(0);
        if (boleta == null) {
            boleta = "";
        }
    } catch (Exception e) {
        boleta = "";
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
            <header class="azul-f">   
                <br>
                <div class="row">
                    <div class="col-md-9"><h2 class="blanco-l">Rendimiento de su hijo</h2>  </div> 
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
            <section>
                <table border="0" align="center" width="100%">
                    <tr>
                        <td ><h3 ></h3></td>
                    </tr>

                    <tr>
                        <td ><h3 ></h3></td><td ></td>
                    </tr>
                    <tr>
                        <%                            if (Rend.equals("")) {
                                Rend = "";%>
                        Presiona el boton de Mostrar rendimiento para visualizarlo
                        <td ></td><td ></td></tr>
                    <tr>
                        <td ><h3 ></h3></td><td ></td>
                            <% } else if (Rend.equals("ERRORC")) {
                                Rend = "";
                                sesion.setAttribute("ERRORC", "");%>
                        Ha ocurrido un error en el Calculo<br>!Avisale al jefe de Area¡
                    <td ></td><td ></td></tr>
                    <tr>
                        <td ><h3 ></h3></td><td ></td>
                            <%
                            } else if (Rend.equals("N")) {

                                String r = "";
                                try {
                                    String pfm = lista.get(0);
                                    String phu = lista.get(1);
                                    String ppr = lista.get(2);
                                } catch (Exception e) {
                                    r = "PY";
                                }
                                if (r.equals("PY")) {
                            %>
                        Ha ocurrido un error en el Calculo porque:<br>*No estas registrado en el el Documento de Calificaciones
                    <br>*Tu boleta no es correcta<br>!Avisale al jefe de Area¡
                    <td ></td><td ></td></tr>
                    <tr>
                        <td ><h3 ></h3></td><td ></td>    
                            <%
                            } else {

                                String pfm = lista.get(0);
                                String phu = lista.get(1);
                                String ppr = lista.get(2);
                                System.out.println("HOLA");
                            %>
                        <td >Grafica de Seguimiento de Calficaciones de Area Fisico Matematico<br>
                            <img src="Rendimientos/<%=boleta%>FM.png" width="500" height="40%">
                        </td>
                        <td >Grafica de Seguimiento de Calficaciones de Area Humanistica<br>
                            <img src="Rendimientos/<%=boleta%>HU.png" width="500" height="40%">
                        </td>
                    </tr>
                    <tr>
                        <h4>
                            <td ><h4 class="blanco-l azul-f">Recuerde que su hijo debe Responder sus test para obtener una probabilidad real:<br><br>->La probabilidad de que pase en el Area de Fisico Matematico: <%=pfm%>%<br><br>
                            ->La probabilidad de que pase en el Area de Humanistica: <%=phu%>%<br><br>
                            ->La probabilidad de que pase en el Area de Profesional: <%=ppr%>%<br><br></h4>
                            <table border="0" align="center" width="100%">
                                <tr>
                                    <td align="center" class="azul-f blanco-f"><h5>BOLETA</h5></td><td class="azul-f blanco-l" align="center"><h5>ALUMNO</h5></td><td class="azul-f blanco-l"> align="center"><h5>INGRESO QUINCENAL</h5></td><td align="center" class="azul-f blanco-l"><h5>VIVIENDA</h5></td><td align="center" class="azul-f blanco-l"><h5>¿TRABAJA?</h5></td><td align="center" class="azul-f blanco-l"><h5>RESULTADO TEST PERSONALIDAD</h5></td>
                                </tr>
                                <%
                                    Usuario u = new Usuario();
                                    try {
                                        u = (Usuario) sesion.getAttribute("DATPR");
                                    } catch (Exception e) {
                                        u = new Usuario();
                                    }
                                    //System.out.println("preba");
                                    //System.out.println(u.getClave());
                                    //System.out.println(u.getBoleta());

                                %>
                                <tr>
                                    <td align="center"><h4 class="blanco-f2"><%=u.getBoleta()%></h4></td><td align="center"><h4 class="blanco-f2"><%=u.getClave()%></h4></td>
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
                                            %></h4></td><td align="center"><h4><%if (u.getVivienda() == 21) {
                                            %>Propia<%
                                            } else if (u.getVivienda() == 14) {
                                            %>Rentada<%
                                            } else if (u.getVivienda() == 7) {
                                            %>Prestada<%} else {
                                            %>No ha respondido el Test Economico<%
                                                }
                                            %></h4></td><td align="center"><h4><%if (u.getTrabajo() == 2) {
                                            %>SI<%
                                            } else if (u.getTrabajo() == 6) {
                                            %>NO<%
                                            } else {
                                            %>No ha respondido el Test Economico<%
                                                }
                                            %></h4></td>
                                    <td align="center"><h4 class="blanco-f2">
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
                                            6
                                            <%} else if (u.getPersonalidad() >= 9 && u.getPersonalidad() <= 13) {%>
                                            10
                                            <%} else if (u.getPersonalidad() >= 14) {%>
                                            8
                                            <%} else if (u.getPersonalidad() == 0) {%>
                                            No ha respondido el Test de Personalidad
                                            <%}%>
                                        </h4></td>
                                </tr>
                                <%%>
                            </table>
                            
                            
                        </td>
                    </h4>
                        
                            <td ><h4 class="blanco-f">Grafica de Seguimiento de Calficaciones de Area Profesional</h4><br>
                            <img src="Rendimientos/<%=boleta%>PR.png" width="500" height="40%">
                        </td>
                </tr>
                <tr>
                        <td align="center"><img src="Rendimientos/<%=boleta%>FMP.png" width="500" height="40%"></td>
                        <td align="center">
                            <img src="Rendimientos/<%=boleta%>HUP.png" width="500" height="40%">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><img src="Rendimientos/<%=boleta%>PRP.png" width="500" height="40%"></td>
                    </tr>
                    <%}
                    %>
                    <%}%>
                     
                    <tr><td ><form method="post" action="RendimientoA">
                                <td  class="td3"><br><input type="submit"  value="Mostrar Rendimiento"  class="btn1"></td>
                            </form></td></tr>
                    <tr>
<td colspan="2"  class="td3"><br><br><a href="login.jsp"><input type="button"  value="Cerrar Sesion"  class="btn1"></a></td>
	</tr>
	</table>
</section>
	</div>
	
</body>
</html>
<%
        }
    }%>
    
<%} catch (Exception e) {%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body >
        <div class="general">
            <section>
                <p>Ha ocurrido un error regresa a Inicio Sesion</p>
                <a href="login.jsp">Inicio Sesion</a>
            </section>
        </div>
    </body>
</html>

<%System.out.println(e.getMessage());
        e.printStackTrace();
        sesion.setAttribute("ERRORALU", "");
    }%>
