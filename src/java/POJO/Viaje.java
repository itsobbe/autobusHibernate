package POJO;
// Generated 23-ene-2019 16:14:24 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Viaje generated by hbm2java
 */
public class Viaje  implements java.io.Serializable {


     private Integer id;
     private Horario horario;
     private Date fechaViaje;
     private Integer plazasLibres;
     private Set reservas = new HashSet(0);
     //private Set reservaBackups = new HashSet(0);

    public Viaje() {
    }

    public Viaje(Horario horario, Date fechaViaje, Integer plazasLibres, Set reservas) {
       this.horario = horario;
       this.fechaViaje = fechaViaje;
       this.plazasLibres = plazasLibres;
       this.reservas = reservas;
       //this.reservaBackups = reservaBackups;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Horario getHorario() {
        return this.horario;
    }
    
    public void setHorario(Horario horario) {
        this.horario = horario;
    }
    public Date getFechaViaje() {
        return this.fechaViaje;
    }
    
    public void setFechaViaje(Date fechaViaje) {
        this.fechaViaje = fechaViaje;
    }
    public Integer getPlazasLibres() {
        return this.plazasLibres;
    }
    
    public void setPlazasLibres(Integer plazasLibres) {
        this.plazasLibres = plazasLibres;
    }
    public Set getReservas() {
        return this.reservas;
    }
    
    public void setReservas(Set reservas) {
        this.reservas = reservas;
    }
//    public Set getReservaBackups() {
//        return this.reservaBackups;
//    }
//    
//    public void setReservaBackups(Set reservaBackups) {
//        this.reservaBackups = reservaBackups;
//    }




}


