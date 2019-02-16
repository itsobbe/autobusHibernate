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
import POJO.Cliente;
import POJO.Ocupacion;
import POJO.OcupacionBackup;
import POJO.Parametros;
import POJO.Reserva;
import POJO.ReservaBackup;
import POJO.Tarjeta;
import POJO.ViajeBackup;
import POJO.Viajero;
import POJO.ViajeroBackup;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

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

    public List devuelveDatosBusquedaViajeV2(SessionFactory SessionBuilder, TrayectoHorario trayectoHorario) {
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
            String orden = "select o.asiento from Ocupacion o where o.reserva IN (select r from Reserva r where r.viaje.id=:vid)";
//            String orden="SELECT r, v from Ruta r,Viaje v,Horario h where r.estacionByEstacionOrigen='"+origen+"' AND r.estacionByEstacionDestino='"+destino+"' AND v.fechaViaje='"+fecha+"' AND h = v.horario AND h.ruta=r AND v.plazasLibres >='"+totalPasaejeros+"'";
            Query rs = sesion.createQuery(orden);
            rs.setParameter("vid", idViaje);
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

    public Cliente login(SessionFactory SessionBuilder, String email, String contrasena) throws ApplicationException {
        Session sesion = SessionBuilder.openSession();
        Transaction tx = null;
        Cliente cliente = null;
        try {
            tx = sesion.beginTransaction();

            String orden = "from Cliente where email=:vemail AND contrasena=:vcontrasena";
            Query q = sesion.createQuery(orden);
            q.setParameter("vemail", email);
            q.setParameter("vcontrasena", contrasena);
            cliente = (Cliente) q.uniqueResult();
            Hibernate.initialize(cliente.getTarjetas());
            tx.commit();
            if (cliente != null) {
                return cliente;
            } else {
                throw new ApplicationException("Error", 2, "No se ha encontrado cliente");
            }
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

    public void guardado(SessionFactory SessionBuilder, Reserva reserva) throws ApplicationException {
        Session sesion = SessionBuilder.openSession();
        Transaction tx = null;
        //vienen viajeros que puede que esten o no en bd
        //viene tarjeta que puede que este o no en bd

        try {
            tx = sesion.beginTransaction();
            
            //select de viajeros y cogemos su id 
            for (Ocupacion item : (Set<Ocupacion>) reserva.getOcupacions()) {
                Query orden = sesion.createQuery("from Viajero where identificador=:vnumero");
                orden.setParameter("vnumero", item.getViajero().getIdentificador());
                if (orden.uniqueResult() != null) {
//                        reserva.setTarjeta((Tarjeta) orden.uniqueResult());
                    Viajero viajeroPersistent = (Viajero) orden.uniqueResult();
//                    if (sesion.contains(viajeroPersistent)) {
//                        sesion.evict(viajeroPersistent);
//                    }
//                    item.getViajero().setId(viajeroPersistent.getId());
                    viajeroPersistent.setApellidos(item.getViajero().getApellidos());
                    viajeroPersistent.setIdentificador(item.getViajero().getIdentificador());
                    viajeroPersistent.setNombre(item.getViajero().getNombre());
                    viajeroPersistent.setOcupacions(item.getViajero().getOcupacions());
                    viajeroPersistent.setTipoIdentificador(item.getViajero().getTipoIdentificador());
                    item.setViajero(viajeroPersistent);
                }
            }
            //cargamos tarjeta si procede
            if (reserva.getTarjeta().getId() != null) {
                reserva.setTarjeta((Tarjeta) sesion.get(Tarjeta.class, reserva.getTarjeta().getId()));
            }
            //por cada viajero revisamos si está, true: cargamos el obj persistent false:es nuevo no hay problema
            for (Ocupacion item : (Set<Ocupacion>) reserva.getOcupacions()) {
                Query q = sesion.createQuery("from Viajero where identificador=:videntificador");
                q.setParameter("videntificador", item.getViajero().getIdentificador());
                Viajero viajaeropers = (Viajero) q.uniqueResult();
                if (viajaeropers != null) {
                    //si no null es que ya existe en bd por lo que lo tenemos con todo y aplicamos set para si procede actualizar sus datos
                }
            }

            //generamos localizador
            reserva.setLocalizador(generarLocalizador());

            sesion.saveOrUpdate(reserva);

            tx.commit();

        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw new ApplicationException(HE.getLocalizedMessage(), 0, HE.getMessage());
        } finally {
            sesion.close();
        }
    }

    public void viajeRealizado(SessionFactory SessionBuilder, int idViaje) throws ApplicationException {
        Session sesion = SessionBuilder.openSession();
        Transaction tx = null;
        try {
            tx = sesion.beginTransaction();
            //buscamos el viaje por id
            Viaje viaje = (Viaje) sesion.get(Viaje.class, idViaje);
            
            //creamos obj back up 
            ArrayList<ReservaBackup> reservaBackup = new ArrayList();
            ArrayList<ViajeroBackup> viajeroBackup = new ArrayList();
            ArrayList<OcupacionBackup> ocupacionBackup = new ArrayList();
            ViajeBackup viajeBackup = new ViajeBackup();
            ViajeroBackup viajeroup = new ViajeroBackup();
            
            viajeBackup=new ViajeBackup(viaje.getHorario(), viaje.getFechaViaje(), viaje.getPlazasLibres(), new HashSet(reservaBackup));
            
            //metemos los datos en obj backup
            for (Reserva item : (Set<Reserva>) viaje.getReservas()) {
                //creo que no necesario !!!******** en todo caso lo tendria que hacer antes
                //Hibernate.initialize(item);
                
                ReservaBackup reservaobj=new ReservaBackup(item.getTarjeta(), viajeBackup, item.getLocalizador(), item.getPrecio(), item.getFechaPago(), item.getNumViajeros());
                
                
                //aqui podria poner save de reserva
                
                for (Ocupacion itemOcupacion : (Set<Ocupacion>) item.getOcupacions()) {
                   // Hibernate.initialize(itemOcupacion);
                    viajeroup=new ViajeroBackup(itemOcupacion.getViajero().getTipoIdentificador(), itemOcupacion.getViajero().getIdentificador(), itemOcupacion.getViajero().getNombre(), itemOcupacion.getViajero().getApellidos());
                    Query q = sesion.createQuery("from ViajeroBackup where identificador = :viden");
                    q.setParameter("viden", viajeroup.getIdentificador());
                    ViajeroBackup viajeroBackupPersistent = (ViajeroBackup)q.uniqueResult();
                    if(viajeroBackupPersistent != null){
                        viajeroBackupPersistent.setApellidos(viajeroup.getApellidos());
                        viajeroBackupPersistent.setNombre(viajeroup.getNombre());
                        viajeroBackupPersistent.setIdentificador(viajeroup.getIdentificador());
                        viajeroBackupPersistent.setTipoIdentificador(viajeroup.getTipoIdentificador());
                        viajeroBackupPersistent.setOcupacionBackups(viajeroup.getOcupacionBackups());
                        
                        viajeroBackup.add(viajeroBackupPersistent);
                    
                        ocupacionBackup.add(new OcupacionBackup(reservaobj, viajeroBackupPersistent, itemOcupacion.getAsiento(), itemOcupacion.getImporte()));
                    }else{
                        viajeroBackup.add(viajeroup);
                    
                        ocupacionBackup.add(new OcupacionBackup(reservaobj, viajeroup, itemOcupacion.getAsiento(), itemOcupacion.getImporte()));
                    }
                    
                    //aqui haria set a vijaero back up con obj ocupacion y a vaijero bckup igual con set ocup
                    
                    //borro del obj viaje los viajeros que tienen mas de una ocupacion
                    
                    //queria borrar los vijaeros dle obj viaje pero debido a hacer en la transaccion 
                    //pongo en ocup en viajero cascade todo menos delete y asi los viajeros los borro a mano aqui
                    if(itemOcupacion.getViajero().getOcupacions().size() == 1){
                        sesion.delete(itemOcupacion.getViajero());
//                        reserva.getOcupacions().remove(tx)
                    }
                    
                    //aqui podria save ocupacion y save viajero si toca o save or update
                }
                //meto al obj reserva backup la ocupa backup para unirlos
                reservaobj.setOcupacionBackups(new HashSet(ocupacionBackup));
                //meto en array de reservas
                reservaBackup.add(reservaobj);
                
            }
            
            viajeBackup.setReservaBackups(new HashSet(reservaBackup));
            
            
            //guardado de viaje back up con todo dentro
            sesion.saveOrUpdate(viajeBackup);
            
            //borrado de viaje 
            //necesito ver si el viajero tiene pendientes mas viajes y si true no borrar
            sesion.delete(viaje);

            tx.commit();
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw new ApplicationException(HE.getLocalizedMessage(), 0, HE.getMessage());
        } finally {
            sesion.close();
        }
    }

    //!---- metodo para crear localizador para reserva  ---- !
    protected String generarLocalizador() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }

//final clase operaciones
}
