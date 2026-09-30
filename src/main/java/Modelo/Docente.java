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
public class Docente extends Usuario{
    
    int idDocente = 0;

    public static ArrayList<Docente> listaDocentes = crearListaInicial();

    public static int contadorIdDocente = 1;

    public static Docente docenteActual = null;

    private static ArrayList<Docente> crearListaInicial() {
        ArrayList<Docente> lista = new ArrayList<>();
        Docente docentePrueba = new Docente(1, "Docente Prueba", "docente@correo.edu.co", "Profesor", 1);
        docentePrueba.setContraseña("1234");
        docentePrueba.setDocumento("1000");
        lista.add(docentePrueba);
        return lista;
    }

    public Docente() {
        
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
        return "Informacion de Docente: " + this.getNombre()+ "con Identificacion: " + this.getIdDocente();
    }
    
}

