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
public class Salida {
    private String horaSalida;
    private String duracion;
    private String km;
    private double precio;
    private int plazasLibres;

    public Salida(String horaSalida, String duracion, String km, double precio, int plazasLibres) {
        this.horaSalida = horaSalida;
        this.duracion = duracion;
        this.km = km;
        this.precio = precio;
        this.plazasLibres = plazasLibres;
    }

    public Salida() {
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public String getKm() {
        return km;
    }

    public void setKm(String km) {
        this.km = km;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getPlazasLibres() {
        return plazasLibres;
    }

    public void setPlazasLibres(int plazasLibres) {
        this.plazasLibres = plazasLibres;
    }
    
}
