/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.Billete;
import MODELO.Hash;
import POJO.Administrador;
import POJO.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionBuilder;
import org.hibernate.SessionFactory;

/**
 *
 * @author owa_7
 */
public class ControladorLoginAdministrador extends HttpServlet {
    private SessionFactory SessionBuilder;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void init(){
        SessionBuilder=NewHibernateUtil.getSessionFactory();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try {
//                String nombre=request.getParameter("nombre");
//                String contrasena=Hash.sha1(request.getParameter("contrasena"));
                String nombre="oualid";
                String contrasena=Hash.sha1("oualid");
                Administrador administrador = new Operaciones().loginAdministrador(SessionBuilder, nombre, contrasena);
                //redirigimos a la vista formulario viaje finalizado
//                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaPago.jsp");
//                requestDispatcher.forward(request, response);
                response.sendRedirect("ControladorTraeOrigen?id=2");
            } catch (Exception e) {
                //si excepcion significa no existe cliente (cuando este bn todo codigo)
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaError.jsp");
                request.setAttribute("error", e);
                requestDispatcher.forward(request, response);
            }
            
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorLoginAdministrador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorLoginAdministrador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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