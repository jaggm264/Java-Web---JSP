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
public class Estudiante extends Usuario{
    int idEstudiante = 0;

    public static ArrayList<Estudiante> listaEstudiantes = crearListaInicial();

    public static int contadorIdEstudiante = 1;

    public static Estudiante estudianteActual = null;

    public static String[] nombresIA = {"Gemini", "ChatGPT", "Claude", "Deepseek"};

    public static int[] usosIA = new int[4];

    private static ArrayList<Estudiante> crearListaInicial() {
        ArrayList<Estudiante> lista = new ArrayList<>();
        Estudiante estudiantePrueba = new Estudiante(1, "Estudiante Prueba", "estudiante@correo.edu.co", "Estudiante", 1);
        estudiantePrueba.setContraseña("1234");
        estudiantePrueba.setDocumento("2000");
        lista.add(estudiantePrueba);
        return lista;
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
        return "Informacion de Estudiante: " + this.getNombre()+ "con Identificacion: " + this.getIdEstudiante();
    }
    
}
