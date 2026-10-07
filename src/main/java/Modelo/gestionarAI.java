/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author bbsot
 */
import java.util.ArrayList;

public class gestionarAI {

    private ArrayList<HerramientaAI> listaHerramientas;
    private int contadorIdHerramienta;

    public gestionarAI() {
        this.listaHerramientas = new ArrayList<>();
        this.contadorIdHerramienta = 0;
        
        cargarHerramientasPorDefecto();
    }

    private void cargarHerramientasPorDefecto() {
        crearHerramienta("ChatGPT", "Generación de texto y Asistencia general", "Básico / Intermedio");
        crearHerramienta("DeepSeek", "Razonamiento lógico y Programación", "Avanzado");
        crearHerramienta("Gemini", "Análisis multimodal e Integración", "Avanzado");
        crearHerramienta("Notebook", "Síntesis de fuentes y Documentación", "Intermedio");
    }

    public void crearHerramienta(String nombreAI, String nombreCompetencia, String descripcionNivel) {
        contadorIdHerramienta++;
        HerramientaAI nuevaHerramienta = new HerramientaAI(contadorIdHerramienta, nombreAI, nombreCompetencia, descripcionNivel);
        listaHerramientas.add(nuevaHerramienta);
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

    public HerramientaAI buscarHerramientaPorNombre(String nombreAI) {
        for (HerramientaAI herramienta : listaHerramientas) {
            if (herramienta.getNombreAI().equalsIgnoreCase(nombreAI)) {
                return herramienta;
            }
        }
        return null;
    }

    public boolean actualizarHerramienta(int id, String nuevoNombreAI, String nuevaCompetencia, String nuevaDescripcion) {
        HerramientaAI herramienta = buscarHerramientaPorId(id);
        if (herramienta != null) {
            herramienta.setNombreAI(nuevoNombreAI);
            herramienta.setNombreCompetencia(nuevaCompetencia);
            herramienta.setDescripcionNivel(nuevaDescripcion);
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
}