/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import MODELO.Billete;
import MODELO.TrayectoHorario;
import POJO.Ocupacion;
import POJO.Viajero;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author owa_7
 */
public class ControladorGuardarDatosViajeros extends HttpServlet {

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
            
            
            
            
            try {
                //cogemos de sesion el número de pasajeros
                int numPasajeros=((TrayectoHorario)request.getSession().getAttribute("trayectoHorario")).getNumViajeros();
                
                //Array de viajeros
                ArrayList<Viajero> viajeros=new ArrayList();
                    
                //
                for (int i = 0; i < numPasajeros; i++) {
                    String identificacion=request.getParameter("identificacion"+i);
                    String nombre=request.getParameter("nombre"+i);
                    String apellidos=request.getParameter("apellidos"+i);
                    String tipoIdentificador=request.getParameter("tipo"+i);
                    int asiento=Integer.parseInt(request.getParameter("asiento"+i));
                    Viajero viajero=new Viajero(identificacion,nombre,apellidos);
                    viajero.setTipoIdentificador(tipoIdentificador);
                    viajero.setOcupacion(new Ocupacion(asiento));
                    viajeros.add(viajero);
                }
                int a=1;
                
                //recogemos varibale sesion Billete donde ya guardar datos importante
                Billete billete=(Billete)request.getSession().getAttribute("billete");
                billete.setViajero(viajeros);
                //request.getSession().setAttribute("billete", billete);

                
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaResumenCompra.jsp");
                requestDispatcher.forward(request, response);
//                  response.sendRedirect("VISTAS/VistaResumenCompra.jsp");
                
            } catch (Exception e) {
            }
            
            
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorGuardarDatosViajeros</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorGuardarDatosViajeros at " + request.getContextPath() + "</h1>");
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
