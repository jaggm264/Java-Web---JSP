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

public class gestionarAI {

    private ArrayList<HerramientaAI> listaHerramientas;
    private int contadorIdHerramienta;
    private ArrayList<String[]> historialUsos = new ArrayList<>();

    public gestionarAI() {
        this.listaHerramientas = new ArrayList<>();
        this.contadorIdHerramienta = 0;
        cargarHerramientasPorDefecto();
    }

    private void cargarHerramientasPorDefecto() {
        crearHerramienta("ChatGPT", "Generación de texto y Asistencia general", "Básico / Intermedio", "https://chatgpt.com", "ChatGPT-Logo.svg.png");
        crearHerramienta("DeepSeek", "Razonamiento lógico y Programación", "Avanzado", "https://chat.deepseek.com", "free-deepseek-icon-svg-download-png-.png");
        crearHerramienta("Gemini", "Análisis multimodal e Integración", "Avanzado", "https://gemini.google.com", "gemini-icon.png");
        crearHerramienta("NotebookLM", "Síntesis de fuentes y Documentación", "Intermedio", "https://notebooklm.google.com", "notebooklm-icon.png");
    }

    public boolean existeNombreAI(String nombreAI) {
        if (nombreAI == null) return false;
        for (HerramientaAI h : listaHerramientas) {
            if (h.getNombreAI().equalsIgnoreCase(nombreAI.trim())) {
                return true;
            }
        }
        return false;
    }

    public boolean existeUrlAI(String url) {
        if (url == null) return false;
        for (HerramientaAI h : listaHerramientas) {
            if (h.getUrl() != null && h.getUrl().equalsIgnoreCase(url.trim())) {
                return true;
            }
        }
        return false;
    }

    public boolean existeNombreAIExcluding(String nombreAI, int idExcluir) {
        if (nombreAI == null) return false;
        for (HerramientaAI h : listaHerramientas) {
            if (h.getIdHerramienta() != idExcluir && h.getNombreAI().equalsIgnoreCase(nombreAI.trim())) {
                return true;
            }
        }
        return false;
    }

    public boolean existeUrlAIExcluding(String url, int idExcluir) {
        if (url == null) return false;
        for (HerramientaAI h : listaHerramientas) {
            if (h.getIdHerramienta() != idExcluir && h.getUrl() != null && h.getUrl().equalsIgnoreCase(url.trim())) {
                return true;
            }
        }
        return false;
    }

    public boolean crearHerramienta(String nombreAI, String nombreCompetencia, String descripcionNivel, String url, String imagen) {
        if (existeNombreAI(nombreAI) || existeUrlAI(url)) {
            return false;
        }
        contadorIdHerramienta++;
        HerramientaAI nuevaHerramienta = new HerramientaAI(contadorIdHerramienta, nombreAI, nombreCompetencia, descripcionNivel, url, imagen);
        listaHerramientas.add(nuevaHerramienta);
        return true;
    }

    public ArrayList<HerramientaAI> obtenerTodasLasHerramientas() {
        return listaHerramientas;
    }

    public HerramientaAI buscarHerramientaPorId(int id) {
        for (HerramientaAI herramienta : listaHerramientas) {
            if (herramienta.getIdHerramienta() == id) {
                return herramienta;
            }
        }
        return null;
    }

    public ArrayList<HerramientaAI> buscarHerramientas(String filtro) {
        ArrayList<HerramientaAI> resultados = new ArrayList<>();
        if (filtro == null || filtro.trim().isEmpty()) {
            return obtenerTodasLasHerramientas();
        }
        String filtroLower = filtro.toLowerCase().trim();
        for (HerramientaAI h : listaHerramientas) {
            if (h.getNombreAI().toLowerCase().contains(filtroLower) ||
                h.getDescripcionNivel().toLowerCase().contains(filtroLower) ||
                h.getNombreCompetencia().toLowerCase().contains(filtroLower)) {
                resultados.add(h);
            }
        }
        return resultados;
    }

    public boolean actualizarHerramienta(int idHerramienta, String nuevoNombreAI, String nuevaCompetencia, String nuevaDescripcion, String nuevaUrl, String nuevaImagen) {
        if (existeNombreAIExcluding(nuevoNombreAI, idHerramienta) || existeUrlAIExcluding(nuevaUrl, idHerramienta)) {
            return false;
        }
        HerramientaAI herramienta = buscarHerramientaPorId(idHerramienta);
        if (herramienta != null) {
            herramienta.setNombreAI(nuevoNombreAI);
            herramienta.setNombreCompetencia(nuevaCompetencia);
            herramienta.setDescripcionNivel(nuevaDescripcion);
            herramienta.setUrl(nuevaUrl);
            if (nuevaImagen != null && !nuevaImagen.isEmpty()) {
                herramienta.setImagen(nuevaImagen);
            }
            return true;
        }
        return false;
    }

    public boolean eliminarHerramienta(int id) {
        HerramientaAI herramienta = buscarHerramientaPorId(id);
        if (herramienta != null) {
            listaHerramientas.remove(herramienta);
            return true;
        }
        return false;
    }

    public void incrementarUso(int id) {
        HerramientaAI herramienta = buscarHerramientaPorId(id);
        if (herramienta != null) {
            herramienta.incrementarUsos();
        }
    }

    public void registrarUsoIndividual(int idHerramienta, String nombreEstudiante) {
        if (nombreEstudiante != null && !nombreEstudiante.isEmpty() && !nombreEstudiante.equalsIgnoreCase("Anónimo")) {
            historialUsos.add(new String[]{nombreEstudiante.trim(), String.valueOf(idHerramienta)});
            incrementarUso(idHerramienta); // Incrementa el global de la herramienta
        }
    }

    public int obtenerUsosPorEstudianteYHerramienta(String nombreEstudiante, int idHerramienta) {
        int count = 0;
        for (String[] uso : historialUsos) {
            if (uso[0].equalsIgnoreCase(nombreEstudiante.trim()) && uso[1].equals(String.valueOf(idHerramienta))) {
                count++;
            }
        }
        return count;
    }

    public int obtenerUsosTotalesPorEstudiante(String nombreEstudiante) {
        int count = 0;
        for (String[] uso : historialUsos) {
            if (uso[0].equalsIgnoreCase(nombreEstudiante.trim())) {
                count++;
            }
        }
        return count;
    }

    public String obtenerHerramientaFavoritaPorEstudiante(String nombreEstudiante, ArrayList<HerramientaAI> listaIAs) {
        String favorita = "Ninguna";
        int maxUsos = -1;
        for (HerramientaAI ia : listaIAs) {
            int usosEst = obtenerUsosPorEstudianteYHerramienta(nombreEstudiante, ia.getIdHerramienta());
            if (usosEst > maxUsos) {
                maxUsos = usosEst;
                favorita = ia.getNombreAI();
            }
        }
        return maxUsos > 0 ? favorita : "Ninguna";
    }
}