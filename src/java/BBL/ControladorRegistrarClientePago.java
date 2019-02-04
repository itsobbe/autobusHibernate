/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import MODELO.Billete;
import MODELO.Hash;
import POJO.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author owa_7
 */
public class ControladorRegistrarClientePago extends HttpServlet {

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
            
            //no lo vamos a registrar hasta que no se detallen todos los datos 
            //hacemos un obj cliente y lo metemos en billete sesion
            try {
                
                String tipoIdentificador=request.getParameter("tipoIdentificador");
                String identificacor=request.getParameter("identificador");
                String nombre=request.getParameter("nombre");     
                String apellidos=request.getParameter("apellidos");
                String email=request.getParameter("email");
                int telefono=Integer.parseInt(request.getParameter("telefono"));
                String contrasena=Hash.sha1(request.getParameter("contrasena"));

                //cambiar en bd a varchar
                Cliente cliente=new Cliente(tipoIdentificador, identificacor, nombre, apellidos, email, telefono,contrasena);
                //guardamos en billete sesion obj cliente
                Billete billete=(Billete)request.getSession().getAttribute("billete");
                billete.setCliente(cliente);
                
                response.sendRedirect("VISTAS/VistaPago.jsp");
                //redirigimos a la vista formulario pago
//                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaPago.jsp");
//                requestDispatcher.forward(request, response);
                
            } catch (Exception e) {
            }
            
            
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorRegistrarClientePago</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorRegistrarClientePago at " + request.getContextPath() + "</h1>");
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
