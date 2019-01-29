package POJO;
// Generated 23-ene-2019 16:14:24 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Viajero generated by hbm2java
 */
public class Viajero  implements java.io.Serializable {


     private Integer id;
     private String tipoIdentificador;
     private String identificador;
     private String nombre;
     private String apellidos;
     private Set ocupacions = new HashSet(0);

    public Viajero() {
    }

    public Viajero(String tipoIdentificador, String identificador, String nombre, String apellidos, Set ocupacions) {
       this.tipoIdentificador = tipoIdentificador;
       this.identificador = identificador;
       this.nombre = nombre;
       this.apellidos = apellidos;
       this.ocupacions = ocupacions;
    }
   
    public Viajero(String identificador, String nombre, String apellidos) {
      
       this.identificador = identificador;
       this.nombre = nombre;
       this.apellidos = apellidos;
      
    }
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTipoIdentificador() {
        return this.tipoIdentificador;
    }
    
    public void setTipoIdentificador(String tipoIdentificador) {
        this.tipoIdentificador = tipoIdentificador;
    }
    public String getIdentificador() {
        return this.identificador;
    }
    
    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public Set getOcupacions() {
        return this.ocupacions;
    }
    
    public void setOcupacions(Set ocupacions) {
        this.ocupacions = ocupacions;
    }

    public void setOcupacion(Ocupacion ocupacion) {
        this.ocupacions.add(ocupacion);
    }


}


