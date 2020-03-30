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
public class RendimientoG extends HttpServlet {

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
            System.out.println("ENTRA%&&");
            /* TODO output your page here. You may use following sample code. */
            //System.out.println(request.getParameter("grupo"));
            HttpSession sesion = request.getSession();
            String codigo = request.getParameter("grupo");
            System.out.println(codigo);
            int proceso = Py.RendimientoG(codigo);
            System.out.println("HOJJ");
            if (proceso < 0 && proceso >= -3) {
                System.out.println("HOLA$%&");
                sesion.setAttribute("ErrorRG", "ERROR");
                response.sendRedirect("Reporte_Grupos.jsp");
            } else if (proceso == -4) {
                System.out.println("HOAL /()");
                sesion.setAttribute("ErrorRG", "ERRORA");
                response.sendRedirect("Reporte_Grupos.jsp");
            } else {

                String grupo=Datos.ConsulG(codigo);
                System.out.println("10000");
                sesion.setAttribute("nomg",grupo);
                sesion.setAttribute("GRUPO", codigo);
                sesion.setAttribute("ErrorRG", "N");
                response.sendRedirect("Reporte_Grupos.jsp");
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
