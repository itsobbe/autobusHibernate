/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

/**
 *
 * @author owa_7
 */
public class ViajesRealizadosPasajero {
    private String nombre;
    private String apellidos;
    private String horaSalida;
    private String estacionrigen;
    private String estacionDestino;
    private String fecha;
    public ViajesRealizadosPasajero() {
    }

    public ViajesRealizadosPasajero(String nombre, String apellidos, String horaSalida, String estacionrigen, String estacionDestino,String fecha) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.horaSalida = horaSalida;
        this.estacionrigen = estacionrigen;
        this.estacionDestino = estacionDestino;
        this.fecha=fecha;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public String getEstacionrigen() {
        return estacionrigen;
    }

    public void setEstacionrigen(String estacionrigen) {
        this.estacionrigen = estacionrigen;
    }

    public String getEstacionDestino() {
        return estacionDestino;
    }

    public void setEstacionDestino(String estacionDestino) {
        this.estacionDestino = estacionDestino;
    }
    
    
    
}
