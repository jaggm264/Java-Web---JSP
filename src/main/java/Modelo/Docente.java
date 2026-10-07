/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author bbsot
 */
public class Docente extends Usuario {

    private int idDocente = 0;

    public Docente() {
        super();
    }

    public Docente(int idUsuario, String nombre, String correo, String rol, int idDocente) {
        super(idUsuario, nombre, correo, rol);
        this.idDocente = idDocente;
    }

    public int getIdDocente() {
        return idDocente;
    }

    public void setIdDocente(int idDocente) {
        this.idDocente = idDocente;
    }

    @Override
    public String MostrarInformacion() {
        return "Información de Docente: " + this.getNombre() + " | ID Docente: " + this.getIdDocente();
    }
}