<%-- 
    Document   : Test_Economico
    Created on : 26/04/2019, 12:14:11 AM
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
        String error;

        try {
            user = (Usuario) sesion.getAttribute("seguimiento");
        } catch (Exception e) {
            user = nulo;
        }

        try {
            error = sesion.getAttribute("ErrorTestE").toString();
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
                <h2 class="blanco-l">Test de Estudio socio-Económico</h2>
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
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
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
                <h2 class="blanco-l">Test de Estudio Socio-Económico</h2>
            </div>            
            <img width="55" height="55" src="img/Lapiz.png" alt="">
            <div class="col-md-3">                
            </div>
        </div>
        
    </div>
</header>
                <br>
                <br>
                    <%
                        if (error.equals("")) {
                    %><h4>No se ha rellenado el Test de Manera Completa</h4><%
                            sesion.setAttribute("ErrorTestE", " ");
                        }
                    %>
                <div class="radio">
                    <table  align="center" width="90%">
                        <tr>
                            <td colspan="4" class="azul-f espaciado blanco-l"><nav>1.- ¿Cuál es tu año de nacimiento?</nav></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" name="pregunta1_ESE" id="2000" ><label for="2000">2000</label>
                            </td >
                            <td >
                                <input type="radio" name="pregunta1_ESE" id="2001" ><label for="2001">2001</label>
                            </td>
                            <td >
                                <input type="radio" name="pregunta1_ESE" id="2002" ><label for="2002">2002</label>
                            </td>
                            <td >
                                <input type="radio" name="pregunta1_ESE" id="2003" ><label for="2003">2003</label>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table  align="center" width="90%">
                        <tr>
                            <td colspan="4" class="azul-f espaciado blanco-l"><nav>2.- ¿Qué persona proveé el ingreso en tu familia?</nav></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" name="pregunta2_ESE" id="Padre"><label for="Padre">Padre</label>
                            </td >
                            <td >
                                <input type="radio" name="pregunta2_ESE" id="Madre" ><label for="Madre">Madre</label>
                            </td>
                            <td >
                                <input type="radio" name="pregunta2_ESE" id="Ambos" ><label for="Ambos">Ambos</label>
                            </td>
                            <td >
                                <input type="radio" name="pregunta2_ESE" id="Otro" ><label for="Otro">Otros</label>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table  align="center" width="90%" height="250px" >
                        <div class="td4">
                            <tr>
                                <td colspan="4" class="azul-f espaciado blanco-l"><nav>3.- Pensando en el jefe o jefa de hogar, ¿cuál fue el último año de estudios que aprobó en la escuela? </nav></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="radio" name="pregunta3_ESE" value="1" id="Sin"><label for="Sin">Sin instruccion</label>
                                </td >
                                <td align="center">
                                    <input type="radio" name="pregunta3_ESE" value="3" id="Preescolar"><label for="Preescolar">Preescolar</label>
                                </td>
                                <td align="center">
                                    <input type="radio" name="pregunta3_ESE" value="5" id="PrimariaI"><label for="PrimariaI">Primaria Incompleta</label>
                                </td>
                                <td align="center">
                                    <input type="radio" name="pregunta3_ESE" value="7" id="PrimariaC"><label for="PrimariaC">Primaria Completa</label>
                                </td>
                            </tr>
                            <tr>
                                <td  align="center"><input type="radio" name="pregunta3_ESE" value="19" id="SecI"><label for="SecI">Secundaria Incompleta</label></td>
                                <td align="center">
                                    <input type="radio" name="pregunta3_ESE" value="11" id="SecundariaC"><label for="SecundariaC">Secundaria Completa</label>
                                </td>
                                <td align="center">
                                    <input type="radio" name="pregunta3_ESE" value="13" id="PrepaI" ><label for="PrepaI">Preparatoria Incompleta</label>
                                </td>
                                <td align="center">
                                    <input type="radio" name="pregunta3_ESE" value="15" id="PrepaC"><label for="PrepaC">Preparatoria Completa</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><input type="radio" name="pregunta3_ESE" value="17" id="LicenciaI" ><label for="LicenciaI">Licenciatura Incompleta</label></td>

                                <td colspan="2" align="center"><input type="radio" name="pregunta3_ESE" value="19" id="LicenciaC"><label for="LicenciaC">Licenciatura Completa</label></td>
                            </tr>

                    </table>
                </div>



                
                    <table align="center" width="90%" height="500px" border="0">
                        <tr><td colspan="4" class="azul-f espaciado blanco-l"><nav>4.-¿Cómo es tu gasto mensual con relación a los siguientes aspectos?</nav></td></tr>
<div class="td4">
                        <tr align="center">
                            <td class="azul-f espaciado blanco-l" ><nav>Tipos de Gastos</nav></td>
                            <td class="azul-f espaciado blanco-l"><nav>Importe</nav></td>
                            <td class="azul-f espaciado blanco-l"><nav>Tipos de Gastos</nav></td>
                            <td class="azul-f espaciado blanco-l"><nav>Importe</nav></td>

                        </tr>
                        <tr>
                            <td><h4 class="blanco-f">Alimentación</h4></td>
                            <td><select name="Alimentacion" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                            <td><h4 class="blanco-f">Transporte</h4></td>
                            <td><select name="Transporte" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td><h4 class="blanco-f">Gasolina</h4></td>
                            <td><select name="Gasolina" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                            <td><h4 class="blanco-f">Educación</h4></td>
                            <td><select name="Educacion" class="PS1">
                                    <option value="19">Más de 3000</option>
                                    <option value="18">Menos de 3000</option>
                                </select></td>
                        </tr>


                        <tr>
                            <td><h4 class="blanco-f">Renta</h4></td>
                            <td><select name="Renta" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                            <td><h4 class="blanco-f">Gastos Médicos</h4></td>
                            <td><select name="GastosM" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td><h4 class="blanco-f">Agua</h4></td>
                            <td><select name="Agua" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                            <td><h4 class="blanco-f">Recreación</h4></td>
                            <td><select name="Recreacion" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td><h4 class="blanco-f">Predial</h4></td>
                            <td><select name="Predial" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                            <td><h4 class="blanco-f">Abonos o créditos</h4></td>
                            <td><select name="Abonos" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td><h4 class="blanco-f">Electricidad</h4></td>
                            <td><select name="Electricidad" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                            <td><h4 class="blanco-f">Ropa o calzado</h4></td>
                            <td><select name="Ropa" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td><h4 class="blanco-f">Teléfono estático</h4></td>
                            <td><select name="Telefono" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                            <td><h4 class="blanco-f">Fondos de ahorro</h4></td>
                            <td><select name="Ahorro" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td><h4 class="blanco-f">Teléfono celular</h4></td>
                            <td><select name="Celular" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                            <td><h4 class="blanco-f">Creditos para vivienda</h4></td>
                            <td><select name="CreditosV" class="PS1">
                                    <option value="18">Más de 3000</option>
                                    <option value="9">Menos de 3000</option>
                                </select></td>
                        </tr>

                    </table >
                    </div>
                    <br>
                    <div class="radio">
                        <table  align="center" width="90%" height="250px" >
                           
                                <tr>
                                    <td colspan="3" class="azul-f espaciado blanco-l">5.- ¿Cómo es tu vivienda? </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="radio" name="pregunta5_ESE" value="21" id="Propia"><label for="Propia">Propia</label>
                                    </td >
                                    <td align="center">
                                        <input type="radio" name="pregunta5_ESE" value="14" id="Rentada"><label for="Rentada">Rentada</label>
                                    </td>
                                    <td align="center">
                                        <input type="radio" name="pregunta5_ESE" value="7" id="Prestada" ><label for="Prestada">Prestada</label>
                                    </td>

                                </tr>


                        </table>
                    </div>
                

                <div class="radio">
                    <table  align="center" width="90%" height="250px" >
                        <div class="td4">
                            <tr>
                                <td colspan="5" class="azul-f espaciado blanco-l"><nav>6.- ¿Qué tipo de vivienda es? </nav></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="radio" name="pregunta6_ESE" value="10" id="Casa"><label for="Casa">Casa Sola</label>
                                </td >
                                <td align="center">
                                    <input type="radio" name="pregunta6_ESE" value="8" id="Departamento" ><label for="Departamento">Departamento</label>
                                </td>
                                <td align="center">
                                    <input type="radio" name="pregunta6_ESE" value="6" id="Vecindad"><label for="Vecindad">Vecindad</label>
                                </td>
                                </td >
                                <td align="center">
                                    <input type="radio" name="pregunta6_ESE" value="4" id="Campamento"><label for="Campamento">Campamento</label>
                                </td>
                                <td align="center">
                                    <input type="radio" name="pregunta6_ESE" value="2" id="Albergue"><label for="Albergue">Albergue</label>
                                </td>

                            </tr>


                    </table>
                </div>



                <div class="radio">
                    <table  align="center" width="90%" height="250px" border="0">
                        <div class="td4">
                            <tr>
                                <td colspan="3" class="azul-f espaciado blanco-l"><nav>7.- ¿Cuántos dormitorios tienes en casa? </nav></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="radio" name="pregunta7_ESE" value="3" id="0-2"><label for="0-2">0-2</label>
                                </td >
                                <td align="center">
                                    <input type="radio" name="pregunta7_ESE" value="5" id="2-4"><label for="2-4">2-4</label>
                                </td>
                                <td align="center">
                                    <input type="radio" name="pregunta7_ESE" value="7" id="4+"><label for="4+">Más de 4</label>
                                </td>


                            </tr>


                    </table>
                </div>
                <table  align="center" width="90%">
                    <tr>
                        <td colspan="4" class="azul-f espaciado blanco-l"><nav>8.- ¿De cuanto es su ingreso familiar quincenal?</nav></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="pregunta8_ESE" value="2" id="0-800 pesos"><label for="0-800 pesos">0-800 pesos</label>
                        </td >
                        <td >
                            <input type="radio" name="pregunta8_ESE" value="4" id="800-3000 pesos"><label for="800-3000 pesos">800-3000 pesos</label>
                        </td>
                        <td >
                            <input type="radio" name="pregunta8_ESE" value="6" id="3000-7000 pesos"><label for="3000-7000 pesos">3000-7000 pesos</label>
                        </td>
                        <td >
                            <input type="radio" name="pregunta8_ESE" value="8" id="7000 o mas"><label for="7000 o mas">7000 o mas</label>
                        </td>
                    </tr>
                </table>
                <table  align="center" width="90%" border="0">
                    <tr>
                        <td colspan="4" class="azul-f espaciado blanco-l"><nav>9.- ¿Trabajas?</nav></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="pregunta9_ESE" value="2" id="Si"><label for="Si">SI</label>
                        </td >
                        <td >
                            <input type="radio" name="pregunta9_ESE" value="6" id="No"><label for="No">NO</label>
                        </td>
                    </tr>
                </table>
            </div>
                        <br>
                        <br>
            <div align="center">
                <input type="submit" value="Finalizar" class="btn1">
            </div>
        </form>
                <a href="Modificar_Datos.jsp"><input type="submit" value="Regresar" class="btn1"></a>
    </body>
</html>
                    <%}%>
                    <%} catch (Exception e) {%>
                    <section>
                        <p>Ha ocurrido un error regresa a Inicio Sesion</p>
                        <a href="login.jsp">Inicio Sesion</a>
                    </section>
                    <%}%>