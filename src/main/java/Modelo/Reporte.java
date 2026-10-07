/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Modelo;

/**
 *
 * @author bbsot
 */
public class Reporte {

    private int idReporte = 0;
    private int numeroDeReportes = 0;
    private String nombreReporte = "";
    private String contenido = "";

    public Reporte() {
    }

    public Reporte(int idReporte, String nombreReporte, String contenido) {
        this.idReporte = idReporte;
        this.nombreReporte = nombreReporte;
        this.contenido = contenido;
        this.numeroDeReportes = idReporte;
    }

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public int getNumeroDeReportes() {
        return numeroDeReportes;
    }

    public void setNumeroDeReportes(int numeroDeReportes) {
        this.numeroDeReportes = numeroDeReportes;
    }

    public String getNombreReporte() {
        return nombreReporte;
    }

    public void setNombreReporte(String nombreReporte) {
        this.nombreReporte = nombreReporte;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
}