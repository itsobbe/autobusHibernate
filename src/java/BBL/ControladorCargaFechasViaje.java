/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.ApplicationException;
import POJO.Viaje;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;

/**
 *
 * @author owa_7
 */
public class ControladorCargaFechasViaje extends HttpServlet {

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
            //PARA EJERCICIO EXÁMEN
            try {
                int origen = 0;
                int destino = 0;
                int id = Integer.parseInt(request.getParameter("idAjax"));
                if (request.getParameter("origen") != "") {
                    origen = Integer.parseInt(request.getParameter("origen"));
                }
                if (request.getParameter("destino") != "") {
                    destino = Integer.parseInt(request.getParameter("destino"));
                }
                List<Viaje> viajes = new Operaciones().devuelveFechasRuta(SessionBuilder, origen, destino);

                if (id == 1) {
                    LocalDate anterior = null;
                    out.print("<option value='Elige' selected disabled>Elige</option >");
                    for (Viaje item : viajes) {
                        LocalDate actual = LocalDate.parse(item.getFechaViaje().toString());
                        if (anterior == null) {
                            out.print("<option value='" + item.getFechaViaje() + "'>" + item.getFechaViaje() + " </option >");

                        } else {
                            if (actual.isEqual(anterior) == false) {
                                out.print("<option value='" + item.getFechaViaje() + "'>" + item.getFechaViaje() + " </option >");
                            }
                        }
                        anterior = LocalDate.parse(item.getFechaViaje().toString());
                    }
                } else {
                    LocalDate elegida = LocalDate.parse(request.getParameter("fecha"));
                    out.print("<option value='Elige' selected disabled>Elige</option >");
                    for (Viaje item : viajes) {
                        LocalDate a = LocalDate.parse(item.getFechaViaje().toString());
                        if (a.equals(elegida)) {
                            out.print("<option value='" + item.getId() + "'>" + new SimpleDateFormat("HH:mm").format(item.getHorario().getHoraSalida()) + " </option >");
                        }
                    }
                }

            } catch (ApplicationException e) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaError.jsp");
                request.setAttribute("error", e);
                requestDispatcher.forward(request, response);
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
