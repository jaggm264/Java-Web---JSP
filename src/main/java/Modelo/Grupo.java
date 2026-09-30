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
public class Grupo {
    
    int idGrupo = 0;
    String nombreGrupo = "";
    String integrante1 = "";
    String integrante2 = "";
    String integrante3 = "";
    String integrante4 = "";
    String nombreDocente = "";

    public static ArrayList<Grupo> listaGrupos = new ArrayList<>();

    public static int contadorIdGrupo = 0;

    public Grupo() {
    }
    public Grupo(int idGrupo, String nombreGrupo){
        this.idGrupo = idGrupo;
        this.nombreGrupo = nombreGrupo;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public String getNombreGrupo() {
        return nombreGrupo;
    }

    public void setNombreGrupo(String nombreGrupo) {
        this.nombreGrupo = nombreGrupo;
    }

    public String getIntegrante1() {
        return integrante1;
    }

    public void setIntegrante1(String integrante1) {
        this.integrante1 = integrante1;
    }

    public String getIntegrante2() {
        return integrante2;
    }

    public void setIntegrante2(String integrante2) {
        this.integrante2 = integrante2;
    }

    public String getIntegrante3() {
        return integrante3;
    }

    public void setIntegrante3(String integrante3) {
        this.integrante3 = integrante3;
    }

    public String getIntegrante4() {
        return integrante4;
    }

    public void setIntegrante4(String integrante4) {
        this.integrante4 = integrante4;
    }

    public String getNombreDocente() {
        return nombreDocente;
    }

    public void setNombreDocente(String nombreDocente) {
        this.nombreDocente = nombreDocente;
    }

    public boolean tieneIntegrante(String nombreEstudiante) {
        return integrante1.equalsIgnoreCase(nombreEstudiante)
                || integrante2.equalsIgnoreCase(nombreEstudiante)
                || integrante3.equalsIgnoreCase(nombreEstudiante)
                || integrante4.equalsIgnoreCase(nombreEstudiante);
    }
    
}