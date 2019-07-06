/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.ApplicationException;
import MODELO.Salida;
import MODELO.TrayectoHorario;
import POJO.Viaje;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
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
public class ControladorBuscarViaje extends HttpServlet {

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

                //recogemos datos del formulario
                int origen = Integer.parseInt(request.getParameter("origen"));
                int destino = Integer.parseInt(request.getParameter("destino"));
                LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
                int totalPasajeros = Integer.parseInt(request.getParameter("totalPasajero"));
                //
                TrayectoHorario trayecto = (TrayectoHorario) request.getSession().getAttribute("trayectoHorario");
                trayecto.setIdDestino(destino);
                trayecto.setFechaSalida(fecha);
                trayecto.setIdOrigen(origen);
                trayecto.setNumViajeros(totalPasajeros);
                //metodo dao que devuelve viaje con los datos
                List<Viaje> datosViaje = new Operaciones().devuelveDatosBusquedaViaje(SessionBuilder,origen, destino, fecha, totalPasajeros);

                for (Viaje item : datosViaje) {
                    trayecto.setOrigen(item.getHorario().getRuta().getEstacionByEstacionOrigen().getNombre());
                    trayecto.setDestino(item.getHorario().getRuta().getEstacionByEstacionDestino().getNombre());
                    LocalDate fechaFinal=new java.sql.Date(item.getFechaViaje().getTime()).toLocalDate();
                    trayecto.setFechaSalida(fechaFinal);
                    trayecto.setSalida(new Salida(item.getHorario().getHoraSalida().toString(), item.getHorario().getRuta().getDuracion().toString(), item.getHorario().getRuta().getKilometros().toString(), item.getHorario().getRuta().getPrecio(), item.getPlazasLibres()));
                }
                //guardamos en sesion los viajes
                request.getSession().setAttribute("datosViaje", datosViaje);
                request.getSession().setAttribute("numPasajeros", totalPasajeros);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaMuestraDatosViaje.jsp");
                request.setAttribute("datosViaje", datosViaje);
                requestDispatcher.forward(request, response);
            } catch (ApplicationException e) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaError.jsp");
                request.setAttribute("error", e);
                requestDispatcher.forward(request, response);
            }

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorBuscarViaje</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorBuscarViaje at " + request.getContextPath() + "</h1>");

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
