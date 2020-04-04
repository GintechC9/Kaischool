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
public class TestPersonalidad extends HttpServlet {

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
            try{

            int ResultadoP = 0;
            int RF = 0;
            
            String p1 = request.getParameter("p1");
            if (p1.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p1.equals("F")) {
                RF = RF + 1;
            }
            String p2 = request.getParameter("p2");
            if (p2.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p2.equals("F")) {
                RF = RF + 1;
            }
            String p3 = request.getParameter("p3");
            if (p3.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p3.equals("F")) {
                RF = RF + 1;
            }
            String p4 = request.getParameter("p4");
            if (p4.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p4.equals("F")) {
                RF = RF + 1;
            }
            String p5 = request.getParameter("p5");
            if (p5.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p5.equals("F")) {
                RF = RF + 1;
            }
            String p6 = request.getParameter("p6");
            if (p6.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p6.equals("F")) {
                RF = RF + 1;
            }
            String p7 = request.getParameter("p7");
            if (p7.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p7.equals("F")) {
                RF = RF + 1;
            }
            String p8 = request.getParameter("p8");
            if (p8.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p8.equals("F")) {
                RF = RF + 1;
            }
            String p9 = request.getParameter("p9");
            if (p9.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p9.equals("F")) {
                RF = RF + 1;
            }
            String p10 = request.getParameter("p10");
            if (p10.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p10.equals("F")) {
                RF = RF + 1;
            }
            String p11 = request.getParameter("p11");
            if (p11.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p11.equals("F")) {
                RF = RF + 1;
            }
            String p12 = request.getParameter("p12");
            if (p12.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p12.equals("F")) {
                RF = RF + 1;
            }
            String p13 = request.getParameter("p13");
            if (p13.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p3.equals("F")) {
                RF = RF + 1;
            }
            String p14 = request.getParameter("p14");
            if (p14.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p14.equals("F")) {
                RF = RF + 1;
            }
            String p15 = request.getParameter("p15");
            if (p15.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p15.equals("F")) {
                RF = RF + 1;
            }
            String p16 = request.getParameter("p16");
            if (p16.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p16.equals("F")) {
                RF = RF + 1;
            }
            String p17 = request.getParameter("p17");
            if (p17.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p17.equals("F")) {
                RF = RF + 1;
            }
            String p18 = request.getParameter("p18");
            if (p18.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p18.equals("F")) {
                RF = RF + 1;
            }
            String p19 = request.getParameter("p19");
            if (p19.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p19.equals("F")) {
                RF = RF + 1;
            }
            String p20 = request.getParameter("p20");
            if (p20.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p20.equals("F")) {
                RF = RF + 1;
            }
            String p21 = request.getParameter("p21");
            if (p21.equals("V")) {
                ResultadoP = ResultadoP + 1;
            } else if (p21.equals("F")) {
                RF = RF + 1;
            }
            int RR = RF + ResultadoP;
            if (RR == 21) {
                System.out.println(RF);
                System.out.println(ResultadoP);
                if(ResultadoP==0){
                ResultadoP=1;
                }
                System.out.println(RR);
                Usuario u= (Usuario)sesion.getAttribute("seguimiento");
                int id=u.getId_ren();
                int query= Datos.GuardarResultadoTestP(ResultadoP, id);
                int quer=Datos.GuardarPreguntasRP(id, ResultadoP);  
                sesion.setAttribute("ErrorTestP", " ");
                response.sendRedirect("Modificar_Datos.jsp");
            } else {
                sesion.setAttribute("ErrorTestP", "");
                response.sendRedirect("Test_Personalidad.jsp");
            }
            }catch(Exception d){
                sesion.setAttribute("ErrorTestP", "");
                response.sendRedirect("Test_Personalidad.jsp");
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
