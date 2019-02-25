/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.Billete;
import MODELO.TrayectoHorario;
import POJO.Estacion;
import POJO.Parametros;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;

/**
 *
 * @author owa_7
 */
public class ControladorTraeOrigen extends HttpServlet {
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
                int id=0;
                if(request.getParameter("id") != null){
                   id =Integer.parseInt(request.getParameter("id"));
                }
                
                
                //llamamos al metodo que nos trae las estaciones de origen disponibles
                List arrayOrigen=new Operaciones().devuelveEstacionesOrgin(SessionBuilder);
                //guardamos el array de estaciones en sesion
                HttpSession session=request.getSession(true);
                session.setAttribute("arrayOrigen", arrayOrigen);
                
                //llamamos y guardamos en sesion a metodo que devuelve el obj parametros 
                Parametros parametro=new Operaciones().devuelveParametros(SessionBuilder);
                session.setAttribute("parametros", parametro);
                
                //creamos obj trayectoHorario y guardamos en sesion y metermos ahí los datos temporales que nos interesen
                TrayectoHorario trayectoHorario=new TrayectoHorario();
                session.setAttribute("trayectoHorario", trayectoHorario);
                
                //creamos obj billete
                Billete billete=new Billete();
                request.getSession().setAttribute("billete", billete);
                
                
                if(id == 2){
                    response.sendRedirect("VISTAS/VistaBuscarViajeRealizado.jsp");
                }else{
                    //redirigimos
                response.sendRedirect("VISTAS/inicio.jsp");
                }
                
                
//                Iterator it = todo.iterator();
//                while (it.hasNext()) {
//                    out.println(it.next().toString() + "<br>");
//                }
                
            } catch (Exception e) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VISTAS/VistaError.jsp");
                request.setAttribute("error", e);
                requestDispatcher.forward(request, response);
            }
            
            
            
            
            
            
            
            
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorTraeOrigen</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorTraeOrigen at " + request.getContextPath() + "</h1>");
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
