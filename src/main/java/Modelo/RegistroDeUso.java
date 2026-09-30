/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.LocalDate;

/**
 *
 * @author bbsot
 */
public class RegistroDeUso {
    int idRegistro = 0;
    LocalDate fecha;
    String propositoDeUso = "";
    Usuario idUsuario;
    int idHerramienta = 0 ;
    String retroalimentacion = "" ;

    public RegistroDeUso() {
        
    }
    public RegistroDeUso(int idRegistro, LocalDate fecha, String propositoDeUso, int idUsuario, int idHerramienta, String retroalimentacion){
        
        this.idRegistro = idRegistro;
        this.fecha = fecha;
        this.propositoDeUso = propositoDeUso;
        this.idHerramienta = idHerramienta;
        this.retroalimentacion = retroalimentacion;
    }

    public int getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(int idRegistro) {
        this.idRegistro = idRegistro;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public String getPropositoDeUso() {
        return propositoDeUso;
    }

    public void setPropositoDeUso(String propositoDeUso) {
        this.propositoDeUso = propositoDeUso;
    }

    public int getIdHerramienta() {
        return idHerramienta;
    }

    public void setIdHerramienta(int idHerramienta) {
        this.idHerramienta = idHerramienta;
    }

    public String getRetroalimentacion() {
        return retroalimentacion;
    }

    public void setRetroalimentacion(String retroalimentacion) {
        this.retroalimentacion = retroalimentacion;
    }
     
}   