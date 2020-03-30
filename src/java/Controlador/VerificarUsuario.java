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
public class VerificarUsuario extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

            String Clave = request.getParameter("clave");
            String Contraseña = request.getParameter("password");

            Usuario datos_usu = Datos.VerificarUsuario(Clave, Contraseña);
            HttpSession sesion = request.getSession();
            String clavex;

            int estado = datos_usu.getEstado();
            try{
            boolean string=Datos.ValidarS(Clave);
            System.out.println("HOLA54");
            System.out.println(string);
            }catch(Exception f){
                System.out.println("OLA55");
                System.out.println(f.getMessage());
            }
            try {
                clavex = datos_usu.getClave();
                if (clavex == null) {
                    clavex = "";
                }
            } catch (Exception e) {
                clavex = "";
            }

            if (clavex.equals("")) {
                sesion.setAttribute("login", "ERROR:Usuario o Password Incorrectos");
                response.sendRedirect("login.jsp");
            } else {
                sesion.setAttribute("seguimiento", datos_usu);
                if (estado == 1) {
                    sesion.setAttribute("login", "");
                    sesion.setAttribute("estado", "1");
                    if (datos_usu.getTipo() == 1) {
                        response.sendRedirect("Tutor_inicio.jsp");
                    } else if (datos_usu.getTipo() == 2) {
                        response.sendRedirect("Alumno_Inicio.jsp");
                    } else if (datos_usu.getTipo() == 3) {
                        response.sendRedirect("Jefe_Inicio.jsp");
                    } else if (datos_usu.getTipo() == 0) {
                        response.sendRedirect("Admin.jsp");
                    }
                } else if (estado == 0) {
                    sesion.setAttribute("estado", "0");
                    sesion.setAttribute("login1", "ERROR: Su cuenta esta Suspendida hable con el administrados para mas detalle");
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("Admin.jsp");

                }
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
