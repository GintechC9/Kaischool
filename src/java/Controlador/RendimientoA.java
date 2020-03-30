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
public class RendimientoA extends HttpServlet {

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
            HttpSession sesion = request.getSession();
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

            int ren = 0;
            List<String> lista = new ArrayList<String>();
            if (clave.equals("")) {
                sesion.setAttribute("ERRORALU", "ERROR");
                response.sendRedirect("Rendimiento_Alumno.jsp");
            } else {
                if (user.getTipo() == 2) {
                    System.out.println("OAL1");
//                    try {
//                        ren = Py.RendimientoA(clave, user.getBoleta());
//                    } catch (Exception d) {
//                        System.out.println("TRUENA");
//                    }
                    try {
                        //System.out.println("HOLA7");
                        lista = (List<String>) Py.RenA(clave, user.getBoleta());
                        //System.out.println("HOLA8");
                    } catch (Exception e) {
                        //System.out.println("TRUENA");
                    }
                    //System.out.println("HOLA6");
                    //System.out.println(ren);
                    String boleta;
                    try {
                        boleta = user.getBoleta();
                    } catch (Exception e) {
                        boleta = "";
                    }
                    if (boleta.equals("")) {
                        sesion.setAttribute("ERRORALU", "ERRORC");
                        response.sendRedirect("Rendimiento_Alumno.jsp");
                    } else {
                        Usuario u= Datos.ConsultaAlumno(boleta);
                        sesion.setAttribute("DATPRA", u);
                        sesion.setAttribute("ERRORALU", "N");
                        sesion.setAttribute("PROB", lista);
                        response.sendRedirect("Rendimiento_Alumno.jsp");
                    }
                } else if (user.getTipo() == 1) {

                    String codigo = user.getCodigo();
                    List<String> list = Datos.ConsultaAlu(codigo);
                    //sesion.setAttribute("TutorA", list);
                    // ren = Py.RendimientoA(list.get(0), list.get(1));
                    System.out.println(list);
                    lista = (List<String>) Py.RenA(list.get(1),list.get(0));
//                    if (ren < 0) {
//                        sesion.setAttribute("TutorA", "ERROR");
//                        sesion.setAttribute("ERRORALU", "ERRORC");
//                        response.sendRedirect("Rendimiento_Alumno.jsp");
//                    } else {
//                        sesion.setAttribute("TutorA", list);
//                        sesion.setAttribute("ERRORALU", "N");
//                        sesion.setAttribute("PROB", lista);
//                        response.sendRedirect("Rendimiento_Alumno.jsp");
//                    }
                    String boleta;
                    //System.out.println(lista);
                    try {
                        boleta = list.get(0);
                    } catch (Exception e) {
                        boleta = "";
                    }
                    
                    if (boleta.equals("")) {
                        sesion.setAttribute("TutorA", "ERROR");
                        sesion.setAttribute("ERRORALUT", "ERRORC");
                        response.sendRedirect("Rendimiento_Alumno.jsp");
                    } else {
                        //System.out.println(boleta);
                        Usuario u= Datos.ConsultaAlumno(boleta);
                        //System.out.println(u.getClave());
                        sesion.setAttribute("DATPR", u);
                        sesion.setAttribute("TutorA", list);
                        sesion.setAttribute("ERRORALUT", "N");
                        sesion.setAttribute("PROBT", lista);
                        response.sendRedirect("Rendimiento_Alumno.jsp");
                    }

                } else if (user.getTipo() == 3) {
                    sesion.setAttribute("ERRORALU", "ERROR");
                    response.sendRedirect("Alumnos_Grupos.jsp");
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
