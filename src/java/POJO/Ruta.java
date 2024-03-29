package POJO;
// Generated 23-ene-2019 16:14:24 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Ruta generated by hbm2java
 */
public class Ruta  implements java.io.Serializable {


     private Integer id;
     private Estacion estacionByEstacionOrigen;
     private Estacion estacionByEstacionDestino;
     private Double kilometros;
     private Double duracion;
     private Double precio;
     private Set horarios = new HashSet(0);

    public Ruta() {
    }

    public Ruta(Estacion estacionByEstacionOrigen, Estacion estacionByEstacionDestino, Double kilometros, Double duracion, Double precio, Set horarios) {
       this.estacionByEstacionOrigen = estacionByEstacionOrigen;
       this.estacionByEstacionDestino = estacionByEstacionDestino;
       this.kilometros = kilometros;
       this.duracion = duracion;
       this.precio = precio;
       this.horarios = horarios;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Estacion getEstacionByEstacionOrigen() {
        return this.estacionByEstacionOrigen;
    }
    
    public void setEstacionByEstacionOrigen(Estacion estacionByEstacionOrigen) {
        this.estacionByEstacionOrigen = estacionByEstacionOrigen;
    }
    public Estacion getEstacionByEstacionDestino() {
        return this.estacionByEstacionDestino;
    }
    
    public void setEstacionByEstacionDestino(Estacion estacionByEstacionDestino) {
        this.estacionByEstacionDestino = estacionByEstacionDestino;
    }
    public Double getKilometros() {
        return this.kilometros;
    }
    
    public void setKilometros(Double kilometros) {
        this.kilometros = kilometros;
    }
    public Double getDuracion() {
        return this.duracion;
    }
    
    public void setDuracion(Double duracion) {
        this.duracion = duracion;
    }
    public Double getPrecio() {
        return this.precio;
    }
    
    public void setPrecio(Double precio) {
        this.precio = precio;
    }
    public Set getHorarios() {
        return this.horarios;
    }
    
    public void setHorarios(Set horarios) {
        this.horarios = horarios;
    }




}


