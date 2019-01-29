/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELO.ApplicationException;
import POJO.Estacion;
import POJO.Ruta;
import POJO.Viaje;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import MODELO.Salida;
import MODELO.TrayectoHorario;
import POJO.Parametros;

/**
 *
 * @author owa_7
 */
public class Operaciones {

    public List devuelveEstacionesOrgin(SessionFactory SessionBuilder) {
        Transaction tx = null;
        Session sesion = SessionBuilder.openSession();
        List todo = null;

        try {
            tx = sesion.beginTransaction();
            //Orden que trae estaciones como origen no repetidas en ruta
            //select distinct r.estacionByEstacionOrigen from Ruta r
            String orden = "From Estacion";
//            String orden="from Ruta r where r.estacionByEstacionOrigen=1 AND r.estacionByEstacionDestino=2";
//            String orden="from Ruta r,Viaje v where r.estacionByEstacionOrigen=1 AND r.estacionByEstacionDestino=2 AND v.fechaViaje='2019-01-17'";
            Query rs = sesion.createQuery(orden);

            todo = rs.list();

            for (int i = 0; i < todo.size(); i++) {
                if ((((Estacion) todo.get(i))).getRutasForEstacionOrigen().isEmpty()) {
                    todo.remove(todo.get(i));
                }
            }
            tx.commit();

            return todo;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public List<Estacion> devuelveDestinos(SessionFactory SessionBuilder, int id) {
        //metodo que segun id devuelve el destino de esa ruta
        Transaction tx = null;
        Session sesion = SessionBuilder.openSession();
        ArrayList<Estacion> array = new ArrayList();
        //Estacion estacion=null;
        try {
            tx = sesion.beginTransaction();
            //orden para devolver objeto estacion destino segun estacion origen
            String orden = "select DISTINCT r.estacionByEstacionDestino from Ruta r where r.estacionByEstacionOrigen.id=:vid";
//            String orden = "from Estacion where id=:vid";
            Query rs = sesion.createQuery(orden);
            rs.setParameter("vid", id);
            List<Estacion> estacion = rs.list();

//            Iterator it = estacion.getRutasForEstacionOrigen().iterator();
//            while (it.hasNext()) {
//                array.add(((Ruta)it.next()).getEstacionByEstacionDestino());
//            }
            tx.commit();

            return estacion;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public List devuelveDatosBusquedaViaje(SessionFactory SessionBuilder, int origen, int destino, LocalDate fecha, int totalPasaejeros) {
        Transaction tx = null;
        Session sesion = SessionBuilder.openSession();
        List<Viaje> todo = null;

        try {
            tx = sesion.beginTransaction();
            //Orden que trae estaciones como origen no repetidas en ruta
            //select distinct r.estacionByEstacionOrigen from Ruta r
//            String orden = "From Estacion";
//            String orden="from Ruta r where r.estacionByEstacionOrigen=1 AND r.estacionByEstacionDestino=2";
//            String orden="SELECT r, v from Ruta r,Viaje v,Horario h where r.estacionByEstacionOrigen=1 AND r.estacionByEstacionDestino=3 AND v.fechaViaje='2019-01-17' AND h = v.horario AND h.ruta=r";
//            String orden="from Ruta r,Viaje v where r.estacionByEstacionOrigen='"+origen+"' AND r.estacionByEstacionDestino='"+destino+"' AND v.fechaViaje='"+fecha+"' AND h = v.horario AND h.ruta=r";
            //String orden = "SELECT v from Ruta r,Viaje v,Horario h where r.estacionByEstacionOrigen='" + origen + "' AND r.estacionByEstacionDestino='" + destino + "' AND v.fechaViaje='" + fecha + "' AND h = v.horario AND h.ruta=r AND v.plazasLibres >='" + totalPasaejeros + "'";
            //quitado ,r
            String orden = "SELECT v from Ruta r,Viaje v,Horario h where r.estacionByEstacionOrigen=:vorigen AND r.estacionByEstacionDestino=:vdestino AND v.fechaViaje=:vfecha AND h = v.horario AND h.ruta=r AND v.plazasLibres >= :vtotal";

            Query rs = sesion.createQuery(orden);
            rs.setParameter("vorigen", origen);
            rs.setParameter("vdestino", destino);
            rs.setDate("vfecha", java.sql.Date.valueOf(fecha));
            rs.setParameter("vtotal", totalPasaejeros);
            todo = rs.list();

            for (Viaje item : todo) {
                Hibernate.initialize(item.getHorario());
                Hibernate.initialize(item.getHorario().getRuta());
                Hibernate.initialize(item.getHorario().getRuta().getEstacionByEstacionDestino());
                Hibernate.initialize(item.getHorario().getRuta().getEstacionByEstacionOrigen());

            }

            tx.commit();

            return todo;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public List devuelveDatosBusquedaViajeV2(SessionFactory SessionBuilder,TrayectoHorario trayectoHorario) {
        Transaction tx = null;
        Session sesion = SessionBuilder.openSession();
        List<Viaje> todo = null;

        try {
            tx = sesion.beginTransaction();
            String orden = "SELECT v from Ruta r,Viaje v,Horario h where r.estacionByEstacionOrigen=:vorigen AND r.estacionByEstacionDestino=:vdestino AND v.fechaViaje=:vfecha AND h = v.horario AND h.ruta=r AND v.plazasLibres >= :vtotal";

            Query rs = sesion.createQuery(orden);
            rs.setParameter("vorigen", trayectoHorario.getIdOrigen());
            rs.setParameter("vdestino", trayectoHorario.getIdDestino());
            rs.setDate("vfecha", java.sql.Date.valueOf(trayectoHorario.getFechaSalida()));
            rs.setParameter("vtotal", trayectoHorario.getNumViajeros());
            todo = rs.list();

            for (Viaje item : todo) {
                Hibernate.initialize(item.getHorario());
                Hibernate.initialize(item.getHorario().getRuta());
                Hibernate.initialize(item.getHorario().getRuta().getEstacionByEstacionDestino());
                Hibernate.initialize(item.getHorario().getRuta().getEstacionByEstacionOrigen());

            }

            tx.commit();

            return todo;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public List devuelveOcupacion(SessionFactory SessionBuilder, int idViaje) {
        Transaction tx = null;
        Session sesion = SessionBuilder.openSession();
        List todo = null;
        ArrayList a = new ArrayList();
        try {
            tx = sesion.beginTransaction();
            String orden = "select o.asiento from Ocupacion o where o.reserva=(select r from Reserva r where r.viaje.id=1)";
//            String orden="SELECT r, v from Ruta r,Viaje v,Horario h where r.estacionByEstacionOrigen='"+origen+"' AND r.estacionByEstacionDestino='"+destino+"' AND v.fechaViaje='"+fecha+"' AND h = v.horario AND h.ruta=r AND v.plazasLibres >='"+totalPasaejeros+"'";
            Query rs = sesion.createQuery(orden);

            todo = rs.list();

            //este arraylist me devuelve los asientos libres 
            for (int i = 1; i < 9; i++) {
                if (!todo.contains(i)) {
                    a.add(i);
                }
            }

            tx.commit();

            return todo;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public List pruebas(SessionFactory SessionBuilder) {
        Transaction tx = null;
        Session sesion = SessionBuilder.openSession();
//        List<Ruta> todo = null;

        try {
            tx = sesion.beginTransaction();
            String orden = "from Ruta r where r.estacionByEstacionOrigen = 1";
//            String orden="SELECT r, v from Ruta r,Viaje v,Horario h where r.estacionByEstacionOrigen='"+origen+"' AND r.estacionByEstacionDestino='"+destino+"' AND v.fechaViaje='"+fecha+"' AND h = v.horario AND h.ruta=r AND v.plazasLibres >='"+totalPasaejeros+"'";
            Query rs = sesion.createQuery(orden);

            List<Ruta> todo = rs.list();
//            Iterator it = todo.iterator();
//            //Ruta ruta=new Ruta();
//            while (it.hasNext()) {
//                Ruta ruta=(Ruta)it.next();
//                Estacion estacion=(Estacion)sesion.get(Estacion.class, ruta.getEstacionByEstacionDestino().getId());
//                ruta.setEstacionByEstacionDestino(estacion);
//            }
//            Estacion a=(Estacion)sesion.load(Estacion.class, todo.get(0).getEstacionByEstacionDestino());
            for (Ruta item : todo) {
                Estacion estacion = (Estacion) sesion.load(Estacion.class, item.getEstacionByEstacionDestino().getId());
                item.setEstacionByEstacionDestino(estacion);
            }
            tx.commit();

            return todo;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw HE;
        } finally {
            sesion.close();
        }
    }

    public Parametros devuelveParametros(SessionFactory SessionBuilder) throws ApplicationException {
        Session sesion = SessionBuilder.openSession();
        Transaction tx = null;
        Parametros parametro = null;
        try {
            tx = sesion.beginTransaction();
            String orden = "from Parametros";
            Query query = sesion.createQuery(orden);
            parametro = (Parametros) query.uniqueResult();

            tx.commit();
            return parametro;

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw new ApplicationException("Error", 0, HE.getMessage());
        } finally {
            sesion.close();
        }
    }

//final clase operaciones
}
