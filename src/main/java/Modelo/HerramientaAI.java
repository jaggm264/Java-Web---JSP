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
    private String url = "";
    private String imagen = "";
    private int usos = 0;

    public HerramientaAI() {
    }

    public HerramientaAI(int idHerramienta, String nombreAI, String nombreCompetencia, String descripcionNivel, String url, String imagen) {
        this.idHerramienta = idHerramienta;
        this.nombreAI = nombreAI;
        this.nombreCompetencia = nombreCompetencia;
        this.descripcionNivel = descripcionNivel;
        this.url = url;
        this.imagen = imagen;
        this.usos = 0;
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

    public String getUrl() { 
        return url; 
    }
    
    public void setUrl(String url) { 
        this.url = url; 
    }

    public String getImagen() { 
        return imagen; 
    }
    
    public void setImagen(String imagen) { 
        this.imagen = imagen; 
    }

    public int getUsos() { 
        return usos; 
    }
    
    public void setUsos(int usos) { 
        this.usos = usos; 
    }
    
    public void incrementarUsos() { 
        this.usos++; 
    }
}