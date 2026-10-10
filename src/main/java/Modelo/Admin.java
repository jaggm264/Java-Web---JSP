/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author bbsot
 */
public class Admin extends Usuario {

    private gestionarGrupo gestorGrupos;
    private gestionarAI gestorAIs;
    private gestionarUsuarios gestorUsuarios;
    private gestionarReporte gestorReportes;

    public Admin(int idUsuario, String nombre, String correo, String contraseña,
                 gestionarGrupo gestorGrupos, gestionarAI gestorAIs, 
                 gestionarUsuarios gestorUsuarios, gestionarReporte gestorReportes) {
        
        super(idUsuario, nombre, correo, "Admin");
        this.setContraseña(contraseña);
        
        this.gestorGrupos = gestorGrupos;
        this.gestorAIs = gestorAIs;
        this.gestorUsuarios = gestorUsuarios;
        this.gestorReportes = gestorReportes;
    }

    @Override
    public String MostrarInformacion() {
        return "Administrador: " + this.getNombre() + " | Correo: " + this.getCorreo();
    }

    public void crearGrupo(String nombreGrupo) {
        gestorGrupos.crearGrupo(nombreGrupo);
    }

    public void agregarIA(String nombreAI, String competencia, String nivel) {
        gestorAIs.crearHerramienta(nombreAI, competencia, nivel);
    }

    public Estudiante crearEstudiante(String nombre, String correo, String clave, String doc) {
        return gestorUsuarios.crearEstudiante(nombre, correo, clave, doc);
    }

    public Docente crearDocente(String nombre, String correo, String clave, String doc) {
        return gestorUsuarios.crearDocente(nombre, correo, clave, doc);
    }

    public Reporte generarReporteUsoIA(int idGrupo, int idIA, String detalles) {
        Grupo g = gestorGrupos.buscarGrupoPorId(idGrupo);
        HerramientaAI ai = gestorAIs.buscarHerramientaPorId(idIA);
        
        if (g != null && ai != null) {
            return gestorReportes.generarReporteUsoIA(g.getNombreGrupo(), ai.getNombreAI(), detalles);
        }
        return null;
    }
}