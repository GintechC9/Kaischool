/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class MostrarRendimiento extends HttpServlet {

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
            HttpSession sesion = request.getSession();
            sesion.setAttribute("ErrorMostrarRendimiento", " ");
            /* TODO output your page here. You may use following sample code. */
            String clave = "";
            try {
                clave = request.getParameter("SeleccionAlumno");
                if (clave == null) {
                    clave = "";
                }
            } catch (Exception e) {
                clave = "";
            }

            System.out.println(clave);

            if (clave.equals("")) {
                sesion.setAttribute("ErrorMostrarRendimiento", "");
                response.sendRedirect("Alumnos_Grupos.jsp");
            } else {
                sesion.setAttribute("Alumno", clave);
                String boleta = Datos.ConsulAlu(clave);

                if (boleta.equals("")) {
                    sesion.setAttribute("ErrorMostrarRendimiento", "");
                    response.sendRedirect("Alumnos_Grupos.jsp");
                    sesion.setAttribute("ERRORALUJ", "ERROR");
                } else {
                    System.out.println("HOLAMECAR");
                    List<String> lista = new ArrayList<String>();
                    lista = (List<String>) Py.RenA(clave, boleta);
                    //System.out.println("HOAL#s");
                    //System.out.println(boleta);
                    Usuario u = Datos.ConsultaAlumno(boleta);
                    sesion.setAttribute("DATPRJ", u);
                    sesion.setAttribute("JefeA", boleta);
                    sesion.setAttribute("ERRORALUJ", "N");
                    sesion.setAttribute("PROBT", lista);
                    //System.out.println(lista);
                    //System.out.println(u.getClave()+"AD");
                    //System.out.println(u.getTrabajo());
                    System.out.println("HOLA2121");
                    response.sendRedirect("Rendimiento_Alumno.jsp");
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
     *
     * @Override protected void doGet(HttpServletRequest request,
     * HttpServletResponse response) throws ServletException, IOException {
     * processRequest(request, response); }
     *
     * /**
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
