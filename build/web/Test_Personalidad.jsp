<%-- 
    Document   : Test_Personalidad
    Created on : 26/04/2019, 12:17:28 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Controlador.*"%>
<!DOCTYPE html>
<%  try {

        HttpSession sesion = request.getSession();
        Usuario user;
        Usuario nulo = new Usuario();
        String clave;
        String error;

        try {
            user = (Usuario) sesion.getAttribute("seguimiento");
        } catch (Exception e) {
            user = nulo;
        }
        try {
            error = sesion.getAttribute("ErrorTestP").toString();
            if (error == null) {
                error = "";
            }
        } catch (Exception e) {
            error = "";
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
        
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Kaischool Systems</title>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo3.png">
        <header class="azul-f espaciado">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h2 class="blanco-l">Test de Personalidad</h2>
            </div>            
            <img width="55" height="55" src="img/Lapiz.png" alt="">
            <div class="col-md-3">                
            </div>
        </div>
        
    </div>
</header>
        <section align=" center">
                ¡Lo siento!
                <br>
                <p>Necesita iniciar sesion para hacer uso de esta pagina</p>
                <a href="login.jsp">Inicio Sesión</a>
            </section>
    </body>
</html>
<%} else {%>
<html>
      <head>
        
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Kaischool Systems</title>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="CSS/usuario.css">
        <link rel="icon" href="img/logo.ico">
    </head>
    <body background="img/fondo3.png">
        <header class="azul-f espaciado">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h2 class="blanco-l">Test de Personalidad</h2>
            </div>            
            <img width="55" height="55" src="img/Lapiz.png" alt="">
            <div class="col-md-3">                
            </div>
        </div>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
    </div>
</header>
            </div>
            <br>
            <%
                if (error.equals("")) {
            %><h4>No se ha rellenado el Test de Manera Completa</h4><%
                    sesion.setAttribute("ErrorTestP", " ");
                }
            %>
            <form method="post" action="TestPersonalidad">
            <section class="section">
                <table border="0" align="center" width="100%" height="1200px">
                    <tr>
                        <td class="td1">
                            <h5 class="azul-f2 blanco-l"> Resuelve marcando verdadero o falso las siguientes cuestiones.</h5>
                        </td>
                        <td align="center">
                             <h5 class="azul-f2 blanco-l" align="center"> V / F</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="blanco-f">
                            1.Mientras descanso continúo pensando en mis problemas de carácter laboral y personal.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p1">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    <tr><td class="azul-l">    .</td></tr>
                    </tr>
                    <tr>
                        <td class="blanco-f">
                            2. Me desespera el tener que hacer cola en un supermercado o esperar mesa en un restaurante.
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p2">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            3. Constantemente se me agarrota la mandíbula y me rechinan los dientes.
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p3">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            4.No encuentro suficiente tiempo al día para realizar todas las tareas que quiero hacer.
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p4">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            5. Tengo la necesidad de hacer más tareas en menos tiempo sin dejar margen para algún imprevisto.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p5">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            6. Leo documentos o libros interesantes o de alto valor todo lo rápido y acelerado que puedo.
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p6">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            7. No me encuentro cómodo ni satisfecho con mi trabajo.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p7">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            8. Me siento impaciente por el ritmo al que ocurren algunos sucesos.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p8">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            9. Me gusta conversar sobre temas que me interesan, pero cuando no me gusta un tema hago como el que escucha, pero en realidad sigo ocupado en mis propios pensamientos.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p9">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            10. En mi trabajo me someto a varios momentos complicados y difíciles de cumplir.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p10">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            11. Frecuentemente arrastro problemas laborales a mi hogar.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p11">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            12. Me angustio al tener que realizar tareas monótonas que son necesarias pero que me impiden realizar tareas que verdaderamente me interesan.
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p12">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            13. Tengo tendencia a terminar las frases de las personas que me hablan.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p13">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            14. Me esfuerzo por pensar o realizar dos o más cosas a la vez.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p14">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            15. Como con prisa y me muevo y ando con rapidez.
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p15">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            16. En una conversación golpeo la mesa o doy una palmada para darle más intensidad o énfasis a un punto de la conversación.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p16">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            17. Me irrito cuando el coche que va delante rueda demasiado lento.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p17">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            18. Acostumbro a evaluar numéricamente las actividades que realizo y la de los demás.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p18">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            19. Me siento mal cuando descanso demasiado o no hago nada.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p19">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            20. Me altero al observar como otras personas realizan tareas que yo puedo hacer en menos tiempo.	
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p20">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                    <tr>
                        <td class="blanco-f">
                            21. Acentúo exageradamente las palabras que considero más importantes en una conversación.
                        </td>
                        <td class="td2">
                            <select class="ps1" name="p21">
                                <option  value="V">V</option>
                                <option class="op1" value="F">F</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td class="azul-l">    .</td></tr>
                </table>
            </section>
            <br>
            <div align="center">
                <a href="Modificar_Datos.jsp"><input type="submit" value="Finalizar"  class="btn1"></a>	
            </div>
        </div>
    </form>
    <a href="Modificar_Datos.jsp"><input type="submit" value="Regresar" class="btn1"></a>
</body>
</html>
<%}%>
<%} catch (Exception e) {
System.out.println("ERROR");
System.out.println(e.getMessage());
%>
        <section>
            <p>Ha ocurrido un error regresa a Inicio Sesion</p>
            <a href="login.jsp">Inicio Sesion</a>
        </section>
<%}%>