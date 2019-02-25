/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import DAO.NewHibernateUtil;
import MODELO.Billete;
import POJO.Tarjeta;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
public class ControladorPago extends HttpServlet {

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
                //cliente de sesion meterle tarjeta y a tajeta meterle cliente?
                //creamos obj tarjeta y metemos en billete sesion
                Tarjeta tarjeta = new Tarjeta();
                int cvv = Integer.parseInt(request.getParameter("cvv"));
                //id de la tarjeta vieja pero comprobar si existe en form
                if (request.getParameter("tarjetaVieja") != null && !request.getParameter("tarjetaVieja").equals("")) {
                    int tarjetaNueva = Integer.parseInt(request.getParameter("tarjetaVieja"));
                    tarjeta.setId(tarjetaNueva);

                } else {
                    //recogemos todos los posibles datos del formulario
                    ////puede que unos u otros datos
                    String tipoNuevo = request.getParameter("tarjetaNuevaTipo");
                    String numeroNuevo = request.getParameter("tarjetaNueva");

                    //fecha de mes y año y comprobar que la fecha caducidad es mayor que la fecha actual si no mostrar vista error o devolver a la misma
                    //LocalDate.now().getMonth().toString()
                    LocalDate caducidad = null;
                    String caducidadString = null;
                    if (request.getParameter("caducidad") != null) {
                        caducidadString = request.getParameter("caducidad");
                        caducidadString = caducidadString + "-01";
                        caducidad = LocalDate.parse(caducidadString);
                    }
                    if (LocalDate.now().isAfter(caducidad)) {
                        //si entra aqui significa que hoy es depues de la fecha dada por lo que está caducada
                        //lanzar excepción o cargar la misma página anterior?
                        String aa = "";
                    }
                    //para guardar numero tiene que ser encriptado con aes, pero son byte... cnvertir string en byte
                    //guardar string caducidad con el día o solo mes/año
                    tarjeta.setCaducidad(caducidadString);
                    tarjeta.setNumero(numeroNuevo);
                    tarjeta.setTipo(tipoNuevo);

                }
                //nombre y apellidos están ya en obj cliente pero puede que el titular sea otro del pago, si es nuevo nif y ect que?
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");

                //unimos cliente a tarjeta y viceversa o hacer esto en el contrlador que monta todo esto?
//                tarjeta.setCliente(((Billete) request.getSession().getAttribute("billete")).getCliente());
//                ((Billete) request.getSession().getAttribute("billete")).getCliente().setTarjeta(tarjeta);
                ((Billete) request.getSession().getAttribute("billete")).setTarjeta(tarjeta);
                //redireccion a controladorMontarObj
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ControladorMontarObjReserva");
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
            out.println("<title>Servlet ControladorPago</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPago at " + request.getContextPath() + "</h1>");
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
