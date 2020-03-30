package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author morsa
 */
public class Filtrado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
     * //
     * <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
     * /**
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String Opcion = request.getParameter("fil");
            System.out.println(Opcion);
            HttpSession sesion = request.getSession();
            sesion.setAttribute("ErrorConsultaAlumnos", "");
            int fil2 = 0;
            if (Opcion.equals("Alumnos que trabajan")) {
                fil2 = 1;

            }
            if (Opcion.equals("Alumnos que no trabajan")) {
                fil2 = 2;

            }
            if (Opcion.equals("Alumnos con vivienda propia")) {
                fil2 = 3;

            }
            if (Opcion.equals("Alumnos con vivienda rentada")) {
                fil2 = 4;

            }
            if (Opcion.equals("Alumnos con vivienda prestada")) {
                fil2 = 5;

            }
            if (Opcion.equals("Alumnos con ingreso familiar mensual de 0 a 800 pesos")) {
                fil2 = 6;

            }
            if (Opcion.equals("Alumnos con ingreso familiar mensual de 800 a  3000 pesos")) {
                fil2 = 7;

            }
            if (Opcion.equals("Alumnos con ingreso familiar mensual de 3000 a 7000 pesos")) {
                fil2 = 8;

            }
            if (Opcion.equals("Alumnos con ingreso familiar mensual de mas de 7000 pesos")) {
                fil2 = 9;

            }
            if (Opcion.equals("Alumnos con un resultado menor a 9 en el Test de personalidad")) {
                fil2 = 10;

            }
            if (Opcion.equals("Alumnos con un resultado entre 9 y 13 en el Test de personalidad")) {
                fil2 = 11;

            }
            if (Opcion.equals("Alumnos con un resultado mayor a 13 en el Test de personalidad")) {
                fil2 = 12;

            }
            System.out.println(fil2);
            List<Usuario> lista = Datos.ConsultaAlumnosP(fil2);
            /*
            out.println("<!DOCTYPE html>");
            out.println("<html>"
                    + "<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/master.css\">"
                    + "<script type=\"text/javascript\" src=\"JS/proceso.js\"></script>");
            out.println("<head>");
            out.println("<title></title>");            
            out.println("</head>");
            out.println("<body> <table><tr><td>Alumno</td></tr>");
            for(Usuario u: lista){
            out.println("<tr><td>");
            out.println(u.getClave());
            out.println("</td></tr>");
            
            }*/
 /*
           out.println("</body>");
            out.println("</html>");
             */
            System.out.println("HOLA)=");
            System.out.println(lista);
            sesion.setAttribute("ListaF", lista);
            response.sendRedirect("Alumnos_Grupos.jsp");

        } catch (Exception e) {
            System.out.println(e.getMessage());

            e.printStackTrace();
        }
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
