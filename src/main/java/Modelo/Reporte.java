/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;

/**
 *
 * @author bbsot
 */
public class Reporte {
    int idReporte = 0;
    int numeroDeReportes = 0;
    String contenido = "";
    String nombreReporte = "";

    public static Reporte ultimoReporte = null;
    public static int totalReportesGenerados = 0;

    public static ArrayList<Reporte> listaReportes = new ArrayList<>();

    public Reporte() {
    }
    
    public Reporte (int idReporte, int numeroDeReportes){
        this.idReporte = idReporte;
        this.numeroDeReportes = numeroDeReportes;
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

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getNombreReporte() {
        return nombreReporte;
    }

    public void setNombreReporte(String nombreReporte) {
        this.nombreReporte = nombreReporte;
    }
    
}