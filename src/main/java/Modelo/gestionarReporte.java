/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Modelo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author bbsot
 */

public class gestionarReporte {

    private String rutaArchivo = "reportes.txt";
    private String rutaCSV = "reportes_exportados.csv";

    public gestionarReporte() {
        verificarYCrearArchivo();
    }

    private void verificarYCrearArchivo() {
        try {
            File archivo = new File(rutaArchivo);
            if (!archivo.exists()) {
                archivo.createNewFile();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private int obtenerSiguienteId() {
        int maxId = 0;
        ArrayList<Reporte> reportes = obtenerTodosLosReportes();
        for (Reporte r : reportes) {
            if (r.getIdReporte() > maxId) {
                maxId = r.getIdReporte();
            }
        }
        return maxId + 1;
    }

    public Reporte crearReporte(String nombreReporte, String contenido) {
        int nuevoId = obtenerSiguienteId();
        Reporte nuevoReporte = new Reporte(nuevoId, nombreReporte, contenido);
        
        try (PrintWriter pw = new PrintWriter(new FileWriter(rutaArchivo, true))) {
            pw.println(nuevoId + ";" + nombreReporte + ";" + contenido.replace("\n", " | "));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nuevoReporte;
    }

    // Generación automática calculando métricas estrictamente independientes por grupo
    public void generarReportesAutomaticos(gestionarGrupo gestorGrupo, gestionarAI gestorAI) {
        if (gestorGrupo == null) return;
        
        ArrayList<Grupo> grupos = gestorGrupo.obtenerTodosLosGrupos();
        ArrayList<HerramientaAI> ias = (gestorAI != null) ? gestorAI.obtenerTodasLasHerramientas() : new ArrayList<>();

        for (Grupo g : grupos) {
            String nombreGrupo = g.getNombreGrupo();
            String docente = g.getNombreDocente() != null && !g.getNombreDocente().isEmpty() ? g.getNombreDocente() : "Sin asignar";
            
            // Integrantes válidos de este grupo en específico
            ArrayList<String> integrantesValidos = new ArrayList<>();
            String[] posiblesIntegrantes = {g.getIntegrante1(), g.getIntegrante2(), g.getIntegrante3(), g.getIntegrante4()};
            
            for (String integrante : posiblesIntegrantes) {
                if (integrante != null && !integrante.trim().isEmpty() && 
                    !integrante.equalsIgnoreCase("Por definir") && 
                    !integrante.equalsIgnoreCase("Ninguno")) {
                    integrantesValidos.add(integrante.trim());
                }
            }

            String integrantesStr = integrantesValidos.isEmpty() ? "Ninguno" : String.join(", ", integrantesValidos);

            // Calcular usos globales y herramientas más/menos usadas EXCLUSIVAMENTE para este grupo
            int totalUsosGrupo = 0;
            HerramientaAI masUsada = null;
            HerramientaAI menosUsada = null;
            int maxUsosIA = -1;
            int minUsosIA = Integer.MAX_VALUE;

            if (!ias.isEmpty()) {
                masUsada = ias.get(0);
                menosUsada = ias.get(0);
                for (HerramientaAI ia : ias) {
                    int usosDeIAPorGrupo = 0;
                    for (String integ : integrantesValidos) {
                        usosDeIAPorGrupo += (gestorAI != null) ? gestorAI.obtenerUsosPorEstudianteYHerramienta(integ, ia.getIdHerramienta()) : 0;
                    }
                    totalUsosGrupo += usosDeIAPorGrupo;

                    if (usosDeIAPorGrupo > maxUsosIA) {
                        maxUsosIA = usosDeIAPorGrupo;
                        masUsada = ia;
                    }
                    if (usosDeIAPorGrupo < minUsosIA) {
                        minUsosIA = usosDeIAPorGrupo;
                        menosUsada = ia;
                    }
                }
            }

            double promedioUsos = (!ias.isEmpty()) ? (double) totalUsosGrupo / ias.size() : 0.0;

            // Calcular usos individuales por cada integrante de este grupo
            class EstudianteMetrica {
                String nombre;
                int usosTotales;
                String herramientaFavorita;
                EstudianteMetrica(String n, int u, String h) {
                    this.nombre = n; this.usosTotales = u; this.herramientaFavorita = h;
                }
            }

            ArrayList<EstudianteMetrica> metricasIntegrantes = new ArrayList<>();
            for (String integ : integrantesValidos) {
                int usosInd = (gestorAI != null) ? gestorAI.obtenerUsosTotalesPorEstudiante(integ) : 0;
                String favInd = (gestorAI != null) ? gestorAI.obtenerHerramientaFavoritaPorEstudiante(integ, ias) : "Ninguna";
                metricasIntegrantes.add(new EstudianteMetrica(integ, usosInd, favInd));
            }

            // Ordenar por mayor número de usos de forma descendente
            metricasIntegrantes.sort((a, b) -> Integer.compare(b.usosTotales, a.usosTotales));

            StringBuilder rankingSb = new StringBuilder();
            StringBuilder aporteSb = new StringBuilder();
            StringBuilder favSb = new StringBuilder();

            int rank = 1;
            for (EstudianteMetrica m : metricasIntegrantes) {
                double pct = (totalUsosGrupo > 0) ? (m.usosTotales * 100.0) / totalUsosGrupo : 0.0;
                
                if (rank > 1) {
                    rankingSb.append(", ");
                    aporteSb.append(", ");
                    favSb.append(" | ");
                }
                rankingSb.append(rank).append(". ").append(m.nombre).append(" (").append(m.usosTotales).append(" usos)");
                aporteSb.append(m.nombre).append(": ").append(String.format("%.1f", pct)).append("%");
                favSb.append(m.nombre).append(" -> ").append(m.herramientaFavorita);
                rank++;
            }

            if (integrantesValidos.isEmpty()) {
                rankingSb.append("Sin integrantes registrados");
                aporteSb.append("Sin datos");
                favSb.append("Sin datos");
            }

            // Calcular los usos específicos de las herramientas más y menos usadas dentro del grupo
            int usosMasUsadaEnGrupo = 0;
            int usosMenosUsadaEnGrupo = 0;
            if (masUsada != null && gestorAI != null) {
                for (String integ : integrantesValidos) {
                    usosMasUsadaEnGrupo += gestorAI.obtenerUsosPorEstudianteYHerramienta(integ, masUsada.getIdHerramienta());
                }
            }
            if (menosUsada != null && gestorAI != null) {
                for (String integ : integrantesValidos) {
                    usosMenosUsadaEnGrupo += gestorAI.obtenerUsosPorEstudianteYHerramienta(integ, menosUsada.getIdHerramienta());
                }
            }

            // Construcción del contenido estructurado del reporte del grupo
            StringBuilder sb = new StringBuilder();
            sb.append("Docente Encargado: ").append(docente).append("\n");
            sb.append("Integrantes: ").append(integrantesStr).append("\n");
            sb.append("Uso Global de IA: ").append(totalUsosGrupo).append("\n");
            sb.append("Promedio de Usos: ").append(String.format("%.2f", promedioUsos)).append("\n");
            sb.append("IA Mas Usada: ").append(masUsada != null ? masUsada.getNombreAI() + " (" + usosMasUsadaEnGrupo + " usos)" : "N/A").append("\n");
            sb.append("IA Menos Usada: ").append(menosUsada != null ? menosUsada.getNombreAI() + " (" + usosMenosUsadaEnGrupo + " usos)" : "N/A").append("\n");
            sb.append("Ranking Participacion: ").append(rankingSb.toString()).append("\n");
            sb.append("Aporte Individual: ").append(aporteSb.toString()).append("\n");
            sb.append("Herramienta Favorita: ").append(favSb.toString());

            String nombreReporte = "Informe General - " + nombreGrupo;
            String contenidoReporte = sb.toString();

            boolean encontrado = false;
            ArrayList<Reporte> reportesActuales = obtenerTodosLosReportes();
            for (Reporte r : reportesActuales) {
                if (r.getNombreReporte().equalsIgnoreCase(nombreReporte)) {
                    actualizarReporte(r.getIdReporte(), nombreReporte, contenidoReporte);
                    encontrado = true;
                    break;
                }
            }
            if (!encontrado) {
                crearReporte(nombreReporte, contenidoReporte);
            }
        }
    }

    public String exportarACSV() {
        ArrayList<Reporte> reportes = obtenerTodosLosReportes();
        File archivoCSV = new File(rutaCSV);
        try (PrintWriter pw = new PrintWriter(new FileWriter(archivoCSV, false))) {
            pw.println("ID;Nombre Reporte;Detalles");
            for (Reporte r : reportes) {
                pw.println(r.getIdReporte() + ";" + r.getNombreReporte() + ";" + r.getContenido().replace("\n", " - "));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return archivoCSV.getAbsolutePath();
    }

    public ArrayList<Reporte> obtenerTodosLosReportes() {
        ArrayList<Reporte> listaReportes = new ArrayList<>();
        File archivo = new File(rutaArchivo);
        if (!archivo.exists()) {
            return listaReportes;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] partes = linea.split(";", 3);
                if (partes.length >= 3) {
                    try {
                        int id = Integer.parseInt(partes[0].trim());
                        String nombre = partes[1].trim();
                        String contenido = partes[2].trim().replace(" | ", "\n");
                        Reporte reporte = new Reporte(id, nombre, contenido);
                        listaReportes.add(reporte);
                    } catch (NumberFormatException e) {
                        // Ignorar
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaReportes;
    }

    public Reporte buscarReportePorId(int idReporte) {
        for (Reporte reporte : obtenerTodosLosReportes()) {
            if (reporte.getIdReporte() == idReporte) {
                return reporte;
            }
        }
        return null;
    }

    public ArrayList<Reporte> buscarReportes(String filtro) {
        ArrayList<Reporte> resultados = new ArrayList<>();
        if (filtro == null || filtro.trim().isEmpty()) {
            return obtenerTodosLosReportes();
        }
        String filtroLower = filtro.toLowerCase().trim();
        for (Reporte r : obtenerTodosLosReportes()) {
            if (String.valueOf(r.getIdReporte()).equals(filtroLower) ||
                r.getNombreReporte().toLowerCase().contains(filtroLower)) {
                resultados.add(r);
            }
        }
        return resultados;
    }

    public boolean actualizarReporte(int idReporte, String nuevoNombre, String nuevoContenido) {
        ArrayList<Reporte> reportes = obtenerTodosLosReportes();
        boolean encontrado = false;

        for (Reporte r : reportes) {
            if (r.getIdReporte() == idReporte) {
                r.setNombreReporte(nuevoNombre);
                r.setContenido(nuevoContenido);
                encontrado = true;
                break;
            }
        }

        if (encontrado) {
            reescribirArchivo(reportes);
            return true;
        }
        return false;
    }

    public boolean eliminarReporte(int idReporte) {
        ArrayList<Reporte> reportes = obtenerTodosLosReportes();
        boolean eliminado = reportes.removeIf(r -> r.getIdReporte() == idReporte);

        if (eliminado) {
            reescribirArchivo(reportes);
            return true;
        }
        return false;
    }

    private void reescribirArchivo(ArrayList<Reporte> reportes) {
        try (PrintWriter pw = new PrintWriter(new FileWriter(rutaArchivo, false))) {
            for (Reporte r : reportes) {
                pw.println(r.getIdReporte() + ";" + r.getNombreReporte() + ";" + r.getContenido().replace("\n", " | "));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}