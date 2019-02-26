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
public class Trayecto {
    private String fechaSalida; 
    private String origen;
    private String destino;
    private int plazasDisponibles;
    private String horaSalida;

    public Trayecto(String fechaSalida, String origen, String destino, int plazasDisponibles, String horaSalida) {
        this.fechaSalida = fechaSalida;
        this.origen = origen;
        this.destino = destino;
        this.plazasDisponibles = plazasDisponibles;
        this.horaSalida = horaSalida;
    }

    public Trayecto() {
    }

    public String getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(String fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public int getPlazasDisponibles() {
        return plazasDisponibles;
    }

    public void setPlazasDisponibles(int plazasDisponibles) {
        this.plazasDisponibles = plazasDisponibles;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }
    
    
    
    
}
