/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author bbsot
 */
public class Estudiante extends Usuario {

    private int idEstudiante = 0;

    public Estudiante() {
        super();
    }

    public Estudiante(int idUsuario, String nombre, String correo, String rol, int idEstudiante) {
        super(idUsuario, nombre, correo, rol);
        this.idEstudiante = idEstudiante;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    @Override
    public String MostrarInformacion() {
        return "Información de Estudiante: " + this.getNombre() + " | ID Estudiante: " + this.getIdEstudiante();
    }
}