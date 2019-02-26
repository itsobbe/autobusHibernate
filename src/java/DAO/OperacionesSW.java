/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DAO.NewHibernateUtil;
import MODELO.ApplicationException;
import POJO.Viaje;
import MODELO.Trayecto;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author owa_7
 */
public class OperacionesSW {

    private SessionFactory SessionBuilder;

    public OperacionesSW() {
        SessionBuilder = NewHibernateUtil.getSessionFactory();
    }

    public List devuelveViajes() {
        Transaction tx = null;
        Session sesion = SessionBuilder.openSession();
        List<Viaje> todo = null;
        ArrayList<Trayecto> trayectos = new ArrayList();
        try {
            tx = sesion.beginTransaction();
            String orden = "SELECT v from Ruta r,Viaje v,Horario h where h = v.horario AND h.ruta=r AND v.plazasLibres >= 1";

            Query rs = sesion.createQuery(orden);
            todo = rs.list();
//            if(todo.size() < 1){
//                throw new ApplicationException("Error buscando viajes", 0, "Viajes no encontrados");
//            }
            for (Viaje item : todo) {
                Hibernate.initialize(item.getHorario());
                Hibernate.initialize(item.getHorario().getRuta());
                Hibernate.initialize(item.getHorario().getRuta().getEstacionByEstacionDestino());
                Hibernate.initialize(item.getHorario().getRuta().getEstacionByEstacionOrigen());

            }

            for (Viaje item : (List<Viaje>) todo) {
                Trayecto trayecto = new Trayecto();
                trayecto.setDestino(item.getHorario().getRuta().getEstacionByEstacionDestino().getNombre());
                trayecto.setOrigen(item.getHorario().getRuta().getEstacionByEstacionOrigen().getNombre());
                trayecto.setFechaSalida(item.getFechaViaje().toString());
                trayecto.setPlazasDisponibles(item.getPlazasLibres());
                trayecto.setHoraSalida(item.getHorario().getHoraSalida().toString());
                trayectos.add(trayecto);
            }

            tx.commit();

            return trayectos;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw HE;
            //new ApplicationException("Error buscando viajes", 0, HE.getLocalizedMessage());
        } catch (Exception e) {
            throw e;
        } finally {
            sesion.close();
        }
    }

}
