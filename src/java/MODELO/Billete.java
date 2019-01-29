/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

import POJO.Cliente;
import POJO.Tarjeta;
import POJO.Viaje;
import POJO.Viajero;
import java.util.ArrayList;

/**
 *
 * @author owa_7
 */
public class Billete {
    private Viaje viaje;
    private Tarjeta tarjeta;
    private Cliente cliente;
    private ArrayList<Viajero> viajero=new ArrayList();

    public Billete(Viaje viaje, Tarjeta tarjeta, Cliente cliente) {
        this.viaje = viaje;
        this.tarjeta = tarjeta;
        this.cliente = cliente;
    }

    public Viaje getViaje() {
        return viaje;
    }

    public void setViaje(Viaje viaje) {
        this.viaje = viaje;
    }

    public Tarjeta getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(Tarjeta tarjeta) {
        this.tarjeta = tarjeta;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ArrayList<Viajero> getViajero() {
        return viajero;
    }

    public void setViajero(ArrayList<Viajero> viajero) {
        this.viajero = viajero;
    }
    
    
}
