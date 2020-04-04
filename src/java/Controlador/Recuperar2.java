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
public class Recuperar2 extends HttpServlet {

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
        HttpSession sesion = request.getSession();
        
        //sesion.setAttribute("menerror", "ERROR: La contraseña ingresada es incorrecta");

        String respuesta;
        try {
            respuesta = request.getParameter("respuesta");
            if (respuesta == null) {
                respuesta = "";
            }
        } catch (Exception e) {
            respuesta = "";
        }
        if (respuesta.equals("")) {
            response.sendRedirect("Recuperar_Password.jsp");
            sesion.setAttribute("respuesta", "");
        } else {
            sesion.setAttribute("respuesta", respuesta);
            Usuario c = (Usuario) sesion.getAttribute("USER");
            String user2;
            try {
                user2 = c.getClave();
                if (user2 == null) {
                    user2 = "";
                }
            } catch (Exception e) {
                user2 = "";
            }
            if (user2.equals("")) {
                response.sendRedirect("Recuperar_Password.jsp");
            } else {
                Usuario x = Datos.RecuperarContrasena(user2);

                String res = x.getRespuesta();
                
                if (res.equals(respuesta)) {
                    sesion.setAttribute("contrasena", x.getPassword());
                    sesion.setAttribute("menerror","A");
                    response.sendRedirect("Recuperar_Password.jsp");
                    
                } else {
                    sesion.setAttribute("menerror", "ERROR");
                    response.sendRedirect("Recuperar_Password.jsp");
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
