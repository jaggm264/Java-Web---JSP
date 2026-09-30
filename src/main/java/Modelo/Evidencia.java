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
public class Evidencia {
    int idEvidencia = 0;
    String  urlArchivo = "";
    LocalDate fechaSubida;
    String tipoArchivo = "";

    public Evidencia() {
        
    }

    public Evidencia(int idEvidencia, String urlArchivo,LocalDate fechaSubida, String tipoArchivo) {
        this.idEvidencia = idEvidencia;
        this.urlArchivo = urlArchivo;
        this.fechaSubida = fechaSubida;
        this.tipoArchivo = tipoArchivo;
        
    }

    public int getIdEvidencia() {
        return idEvidencia;
    }

    public void setIdEvidencia(int idEvidencia) {
        this.idEvidencia = idEvidencia;
    }

    public String getUrlArchivo() {
        return urlArchivo;
    }

    public void setUrlArchivo(String urlArchivo) {
        this.urlArchivo = urlArchivo;
    }

    public LocalDate getFechaSubida() {
        return fechaSubida;
    }

    public void setFechaSubida(LocalDate fechaSubida) {
        this.fechaSubida = fechaSubida;
    }

    public String getTipoArchivo() {
        return tipoArchivo;
    }

    public void setTipoArchivo(String tipoArchivo) {
        this.tipoArchivo = tipoArchivo;
    }
    
}