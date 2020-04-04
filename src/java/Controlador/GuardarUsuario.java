/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class GuardarUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String Clave = request.getParameter("clave");
            String Contraseña = request.getParameter("password");
            int Pregunta = Integer.parseInt(request.getParameter("pregunta"));
            String Respuesta = request.getParameter("respuesta");
            String CodigoAlumno = request.getParameter("codigoalu");
            String Boleta = request.getParameter("boleta");
            String CodigoGrupo = request.getParameter("codigogrupo");
            String NumeroJefe = request.getParameter("numerojefe");

            Usuario u = new Usuario();

            u.setClave(Clave);
            u.setPassword(Contraseña);
            if (Pregunta == 1) {
                u.setPregunta(1);
            } else if (Pregunta == 2) {
                u.setPregunta(2);
            } else if (Pregunta == 3) {
                u.setPregunta(3);
            }
            u.setRespuesta(Respuesta);
            u.setEstado(1);
            if (NumeroJefe != null) {
                u.setNumerojefe(NumeroJefe);
                u.setTipo(3);

            } else if (Boleta != null) {
                CodigoAlumno = Datos.CodigoG(5);
                u.setBoleta(Boleta);
                u.setCodigogrupo(CodigoGrupo);
                u.setCodigo(CodigoAlumno);
                u.setTipo(2);
            } else {
                u.setCodigo(CodigoAlumno);
                u.setTipo(1);
            }

            int query = Datos.guardar(u);

            HttpSession sesion = request.getSession();

            if (query > 0) {
                sesion.setAttribute("Anterior", u);
                sesion.setAttribute("mensaje", "");
                response.sendRedirect("login.jsp");
            } else {
                if (NumeroJefe != null) {
                    u.setTipo(3);
                    sesion.setAttribute("usuario", u.getTipo());
                } else if (Boleta != null) {
                    u.setTipo(2);
                    sesion.setAttribute("usuario", u.getTipo());
                } else {
                    u.setTipo(1);
                    sesion.setAttribute("usuario", u.getTipo());
                }
                if (query == 0) {

                    System.out.println(query + "ad");
                    sesion.setAttribute("mensaje", "ERROR: La clave de usuario ya existe");

                } else if (query == -2) {
                    sesion.setAttribute("mensaje", "ERROR: La numero de empleado ya existe");

                } else if (query == -3) {
                    sesion.setAttribute("mensaje", "ERROR: La boleta ya existe");

                } else if (query == -4) {
                    sesion.setAttribute("mensaje", "ERROR: El codigo es Incorrecto");
                } else if (query == -5) {
                    sesion.setAttribute("mensaje", "ERROR: El codigo de alumno es Incorrecto");
                } else if (query == -15) {
                    sesion.setAttribute("mensaje", "ERROR: El grupo a alcanzado el limite de Alumnos hbla con tu jefe de Area para solicitar Ayuda");
                }

                response.sendRedirect("Registrar.jsp");

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
