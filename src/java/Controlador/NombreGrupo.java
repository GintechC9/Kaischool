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
public class NombreGrupo extends HttpServlet {

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
        sesion.setAttribute("ErrorCambiarGrupo", "");
        String Grupo;

        String Nombre = request.getParameter("NombreGrupo");
        try {
            Grupo = request.getParameter("SeleccionGrupo");
            if (Grupo == null) {
                Grupo = "";
            }
        } catch (Exception e) {
            Grupo = "";
        }

        if (Grupo.equals("")) {
            response.sendRedirect("Editar_Grupos.jsp");
            sesion.setAttribute("ErrorCambiarGrupo", "ERROR: No se ha seleccionado un Grupo.");
        } else {

            int query = Datos.CambiarNombreGrupo(Grupo, Nombre);

            if (query > 0) {
                response.sendRedirect("Editar_Grupos.jsp");
            } else if (query == -5) {
                response.sendRedirect("Editar_Grupos.jsp");
                sesion.setAttribute("ErrorCambiarGrupo", "ERROR: El nombre elegido ya esta registrado. Eliga otro.");
            } else {
                response.sendRedirect("Editar_Grupos.jsp");
                sesion.setAttribute("ErrorCambiarGrupo", "ERROR: Se produjo un error en la operacion hable con el Administrador");
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
