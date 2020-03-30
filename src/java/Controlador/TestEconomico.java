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
public class TestEconomico extends HttpServlet {

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
            int puntuacion = 0;
            int error = 0;

            try {
                error = Integer.parseInt(request.getParameter("pregunta3_ESE"));
                if (error == 0) {
                    error = 0;
                } else {
                    puntuacion = puntuacion + Integer.parseInt(request.getParameter("pregunta3_ESE"));;
                }
            } catch (Exception e) {

            }
            int ingreso1=0;
            try {
                error = Integer.parseInt(request.getParameter("pregunta8_ESE"));
                if (error == 0) {
                    error = 0;
                } else {
                    puntuacion = puntuacion + Integer.parseInt(request.getParameter("pregunta8_ESE"));
                    ingreso1=Integer.parseInt(request.getParameter("pregunta8_ESE"));
                }
            } catch (Exception e) {

            }
            int trabajo1=0;
            try {
                error = Integer.parseInt(request.getParameter("pregunta9_ESE"));
                if (error == 0) {
                    error = 0;
                } else {
                    puntuacion = puntuacion + Integer.parseInt(request.getParameter("pregunta9_ESE"));
                    trabajo1=Integer.parseInt(request.getParameter("pregunta9_ESE"));
                }
            } catch (Exception e) {

            }
            
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Alimentacion"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Transporte"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Gasolina"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Educacion"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Renta"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("GastosM"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Agua"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Recreacion"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Predial"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Abonos"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Electricidad"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Ropa"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Telefono"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Ahorro"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("Celular"));
            puntuacion = puntuacion + Integer.parseInt(request.getParameter("CreditosV"));
            int vivienda1=0;
            try {
                error = Integer.parseInt(request.getParameter("pregunta5_ESE"));
                if (error == 0) {
                    error = 0;
                } else {
                    puntuacion = puntuacion + Integer.parseInt(request.getParameter("pregunta5_ESE"));
                    vivienda1= Integer.parseInt(request.getParameter("pregunta5_ESE"));
                }
            } catch (Exception e) {
                error = 0;
            }

            try {
                error = Integer.parseInt(request.getParameter("pregunta6_ESE"));
                if (error == 0) {
                    error = 0;
                } else {
                    puntuacion = puntuacion + Integer.parseInt(request.getParameter("pregunta6_ESE"));;
                }
            } catch (Exception e) {
                error = 0;
            }

            try {
                error = Integer.parseInt(request.getParameter("pregunta7_ESE"));
                if (error == 0) {
                    error = 0;
                } else {
                    puntuacion = puntuacion + Integer.parseInt(request.getParameter("pregunta7_ESE"));;
                }
            } catch (Exception e) {
                error = 0;
            }

            if (error == 0) {
                sesion.setAttribute("ErrorTestE", "");
                response.sendRedirect("Test_Economico.jsp");
            } else {
                System.out.println(puntuacion);
                if(puntuacion==0){
                puntuacion=1;
                }
                Usuario u = (Usuario) sesion.getAttribute("seguimiento");
                int id = u.getId_ren();
                sesion.setAttribute("ErrorTestE", " ");
                int query = Datos.GuardarResultadoTestE(puntuacion, id);
                int quer=Datos.GuardarPreguntasRE(ingreso1, trabajo1, vivienda1, id);
                response.sendRedirect("Modificar_Datos.jsp");
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
