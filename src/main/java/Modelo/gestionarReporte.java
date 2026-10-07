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

public class gestionarReporte {

    private ArrayList<Reporte> listaReportes;
    private int contadorIdReporte;

    public gestionarReporte() {
        this.listaReportes = new ArrayList<>();
        this.contadorIdReporte = 0;
    }

    public Reporte crearReporte(String nombreReporte, String contenido) {
        contadorIdReporte++;
        Reporte nuevoReporte = new Reporte(contadorIdReporte, nombreReporte, contenido);
        listaReportes.add(nuevoReporte);
        return nuevoReporte;
    }

    public Reporte generarReporteUsoIA(String nombreGrupo, String nombreIA, String detallesUso) {
        contadorIdReporte++;
        String nombre = "Reporte Uso IA - Grupo: " + nombreGrupo + " (" + nombreIA + ")";
        String contenido = "Detalles del uso de la IA [" + nombreIA + "] por el grupo [" + nombreGrupo + "]:\n" + detallesUso;

        Reporte reporte = new Reporte(contadorIdReporte, nombre, contenido);
        listaReportes.add(reporte);
        return reporte;
    }

    public ArrayList<Reporte> obtenerTodosLosReportes() {
        return listaReportes;
    }

    public Reporte buscarReportePorId(int idReporte) {
        for (Reporte reporte : listaReportes) {
            if (reporte.getIdReporte() == idReporte) {
                return reporte;
            }
        }
        return null;
    }

    public Reporte obtenerUltimoReporte() {
        if (listaReportes.isEmpty()) {
            return null;
        }
        return listaReportes.get(listaReportes.size() - 1);
    }

    // Reemplaza la variable estática 'totalReportesGenerados'
    public int getTotalReportesGenerados() {
        return listaReportes.size();
    }

    public boolean actualizarReporte(int idReporte, String nuevoNombre, String nuevoContenido) {
        Reporte reporte = buscarReportePorId(idReporte);
        if (reporte != null) {
            reporte.setNombreReporte(nuevoNombre);
            reporte.setContenido(nuevoContenido);
            return true;
        }
        return false;
    }

    public boolean eliminarReporte(int idReporte) {
        Reporte reporte = buscarReportePorId(idReporte);
        if (reporte != null) {
            listaReportes.remove(reporte);
            return true;
        }
        return false;
    }
}
