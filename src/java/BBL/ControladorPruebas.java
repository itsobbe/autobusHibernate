/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.Billete;
import POJO.Ocupacion;
import POJO.Viaje;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;

/**
 *
 * @author owa_7
 */
public class ControladorPruebas extends HttpServlet {

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
    public void init() {
        SessionBuilder = NewHibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {

                int id = Integer.parseInt(request.getParameter("id"));
                //new Operaciones().pruebas(SessionBuilder);
                List<Ocupacion> asiento = new Operaciones().devuelveOcupacion(SessionBuilder, id);

                request.getSession().setAttribute("arrayAsiento", asiento);

                //guardamos el viaje elegido que nos vieje por método get desde botón reservar
                int idViaje = Integer.parseInt(request.getParameter("id"));

                //aqui deberia llamar a datosViaje donde estan los viajes y buscar el que coincida con id y guardarlo en obj billete
                Billete billete = (Billete) request.getSession().getAttribute("billete");
                ArrayList<Viaje> viajes = (ArrayList<Viaje>) request.getSession().getAttribute("datosViaje");

                for (Viaje item : viajes) {
                    if (item.getId().equals(idViaje)) {
                        billete.setViaje(item);
                    }
                }

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaRellenarDatosPersonales.jsp");
                request.setAttribute("arrayAsiento", asiento);
                requestDispatcher.forward(request, response);
            } catch (Exception e) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaError.jsp");
                request.setAttribute("error", e);
                requestDispatcher.forward(request, response);
            }

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorPruebas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPruebas at " + request.getContextPath() + "</h1>");
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
