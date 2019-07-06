/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.ViajesRealizadosPasajero;
import POJO.OcupacionBackup;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
public class ControladorBuscarViajesRealizados extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            try {
                // PARA EJERCICIO DE EXÁMEN
                LocalDate origen = LocalDate.parse(request.getParameter("fechaInicio"));
                LocalDate destino = LocalDate.parse(request.getParameter("fechaFinal"));
                String nif = request.getParameter("nif");
                ArrayList<ViajesRealizadosPasajero> viajes = (ArrayList) new Operaciones().devuelveViajesRealizados(SessionBuilder, origen, destino, nif);

                out.println("Pasajero:  " + viajes.get(0).getNombre());
                out.print("<br>");
                out.println("Apellidos:  " + viajes.get(0).getApellidos());
                out.print("<br>");
                out.println("Fecha -------- Hora salida -------- Estacion origen -------- Estacion destino ");
                out.print("<br>");
                for (ViajesRealizadosPasajero item : viajes) {
                    out.println(item.getFecha() + "--------" + item.getHoraSalida() + "--------" + item.getEstacionrigen() + "--------" + item.getEstacionDestino());
                    out.print("<br>");
                }

            } catch (Exception e) {
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
