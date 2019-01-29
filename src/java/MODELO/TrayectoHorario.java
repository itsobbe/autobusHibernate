/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author owa_7
 */
public class TrayectoHorario {
    private LocalDate fechaSalida; 
    private String origen;
    private String destino;
    private int idOrigen;
    private int idDestino;
    private int numViajeros;
    private int idViajeElegido;
    private ArrayList<Salida> salida=new ArrayList();

    public TrayectoHorario() {
    }

    public TrayectoHorario(LocalDate fechaSalida, String origen, String destino, int idOrigen, int idDestino, int numViajeros, int idViajeElegido) {
        this.fechaSalida = fechaSalida;
        this.origen = origen;
        this.destino = destino;
        this.idOrigen = idOrigen;
        this.idDestino = idDestino;
        this.numViajeros = numViajeros;
        this.idViajeElegido = idViajeElegido;
    }

    public int getIdOrigen() {
        return idOrigen;
    }

    public void setIdOrigen(int idOrigen) {
        this.idOrigen = idOrigen;
    }

    public int getIdDestino() {
        return idDestino;
    }

    public void setIdDestino(int idDestino) {
        this.idDestino = idDestino;
    }



    public LocalDate getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(LocalDate fechaSalida) {
        this.fechaSalida = fechaSalida;
    }



    public int getIdViajeElegido() {
        return idViajeElegido;
    }

    public void setIdViajeElegido(int idViajeElegido) {
        this.idViajeElegido = idViajeElegido;
    }

    public int getNumViajeros() {
        return numViajeros;
    }

    public void setNumViajeros(int numViajeros) {
        this.numViajeros = numViajeros;
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

    public ArrayList<Salida> getSalida() {
        return salida;
    }

    public void setSalidas(ArrayList<Salida> salida) {
        this.salida = salida;
    }
    
    public void setSalida(Salida salida) {
        this.salida.add(salida);
    }
}
