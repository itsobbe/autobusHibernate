/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVICIO;

import DAO.Operaciones;
import MODELO.Trayecto;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import DAO.OperacionesSW;

/**
 *
 * @author owa_7
 */
@WebService(serviceName = "servicio")
public class servicio {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    
    @WebMethod(operationName = "devuelveViajes")
    public List<Trayecto> devuelveViajes() {
        List<Trayecto> trayectos=new OperacionesSW().devuelveViajes();
        return trayectos;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "devuelveViajesSegunPrecio")
    public List<Trayecto> devuelveViajesSegunPrecio(@WebParam(name = "precio") Double precio) {
        List<Trayecto> trayectos=new OperacionesSW().devuelveViajesSegunPrecio(precio);
        
        return trayectos;
    }
    
}
