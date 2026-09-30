/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author bbsot
 */
public class NivelDeCompetenciaSugerencia {
    int idCompetencia = 0; 
    String nombreCompetencia = "";
    String descripcionNivel = "";

    public NivelDeCompetenciaSugerencia() {
    }
    
    public NivelDeCompetenciaSugerencia(int idCompetencia, String nombreCompetencia, String descripcionNivel){
        this.idCompetencia = idCompetencia;
        this.nombreCompetencia = nombreCompetencia;
        this.descripcionNivel = descripcionNivel;
        
    }

    public int getIdCompetencia() {
        return idCompetencia;
    }

    public void setIdCompetencia(int idCompetencia) {
        this.idCompetencia = idCompetencia;
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