package POJO;
// Generated 23-ene-2019 16:14:24 by Hibernate Tools 4.3.1



/**
 * Administrador generated by hbm2java
 */
public class Administrador  implements java.io.Serializable {


     private int id;
     private String nombre;
     private String contrasena;

    public Administrador() {
    }
    
    public Administrador(int id, String nombre, String contrasena) {
       this.id = id;
       this.nombre = nombre;
       this.contrasena = contrasena;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getContrasena() {
        return this.contrasena;
    }
    
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }




}


