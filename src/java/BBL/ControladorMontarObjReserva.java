/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.Billete;
import POJO.Cliente;
import POJO.Ocupacion;
import POJO.Reserva;
import POJO.Tarjeta;
import POJO.Viaje;
import POJO.Viajero;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Set;
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
public class ControladorMontarObjReserva extends HttpServlet {

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
                Reserva reserva = new Reserva();

                //aqui monto obj reserva final todo unido
                Billete billete = (Billete) request.getSession().getAttribute("billete");
                Cliente cliente = billete.getCliente();
                Tarjeta tarjeta = billete.getTarjeta();
                Viaje viaje = billete.getViaje();
                
                ArrayList<Viajero> viajero = billete.getViajero();
                //este array quiero montarlo para meterlo en reserva, viene de cada viajero que tiene ocupacion
                ArrayList<Ocupacion> ocupacionParaReserva = new ArrayList();

                reserva.setFechaPago(java.sql.Date.valueOf(LocalDate.now()));
                //generamos localizador en DAO
                reserva.setNumViajeros(billete.getViajero().size());
                reserva.setViaje(billete.getViaje());
                reserva.setTarjeta(billete.getTarjeta());
                reserva.setPrecio(viaje.getHorario().getRuta().getPrecio() * reserva.getNumViajeros());

                //necesito objs ocupacion? están en cada viajero
                for (Viajero item : (ArrayList<Viajero>) billete.getViajero()) {
                    for (Ocupacion item2 : (Set<Ocupacion>) item.getOcupacions()) {
                        Ocupacion ocup=item2;
                        //metemos al nuevo obj ocupacion su viajero y el obj reserva
                        ocup.setViajero(item);
                        ocup.setReserva(reserva);
                        ocup.setImporte(viaje.getHorario().getRuta().getPrecio());
                        reserva.setOcupacion(ocup); 
                        //metemos al array de ocupacion el obj ocupacion
                        ocupacionParaReserva.add(ocup);
                    }
                }
                cliente.setTarjeta(tarjeta);
                reserva.getTarjeta().setCliente(cliente);

                reserva.setViaje(viaje);

                //mandamos al guardado
                new Operaciones().guardado(SessionBuilder, reserva);
                
                //guardamos en sesion obj reserva
                request.getSession().setAttribute("reserva", reserva);
                
                //response.sendRedirect("VISTAS/VistaEmisionBillete.jsp");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaEmisionBillete.jsp");
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
                out.println("<title>Servlet ControladorMontarObjReserva</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet ControladorMontarObjReserva at " + request.getContextPath() + "</h1>");
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
