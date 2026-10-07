/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author bbsot
 */
public class HerramientaAI {

    private int idHerramienta = 0;
    private String nombreAI = "";
    private String nombreCompetencia = "";
    private String descripcionNivel = "";

    public HerramientaAI() {
    }

    public HerramientaAI(int idHerramienta, String nombreAI, String nombreCompetencia, String descripcionNivel) {
        this.idHerramienta = idHerramienta;
        this.nombreAI = nombreAI;
        this.nombreCompetencia = nombreCompetencia;
        this.descripcionNivel = descripcionNivel;
    }

    public int getIdHerramienta() {
        return idHerramienta;
    }

    public void setIdHerramienta(int idHerramienta) {
        this.idHerramienta = idHerramienta;
    }

    public String getNombreAI() {
        return nombreAI;
    }

    public void setNombreAI(String nombreAI) {
        this.nombreAI = nombreAI;
    }

    public String getNombreCompetencia() {
        return nombreCompetencia;
    }

    public void setNombreCompetencia(String nombreCompetencia) {
        this.nombreCompetencia = nombreCompetencia;
    }

    public String getDescripcionNivel() {
        return descripcionNivel;
    }

    public void setDescripcionNivel(String descripcionNivel) {
        this.descripcionNivel = descripcionNivel;
    }
}