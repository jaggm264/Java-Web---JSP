/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author bbsot
 */
public abstract class Usuario {
    
    private int idUsuario = 0;
    private String nombre = "";
    private String correo = "";
    private String rol = "";
    private String contraseña = "";
    private String documento = "";
    
    public Usuario(){
          
    }
    
    public Usuario(int idUsuario, String nombre, String correo, String rol){
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.correo = correo;
        this.rol = rol;
    }
    public void setIdUsuario(int idUsuario){
        this.idUsuario = idUsuario;
    }
    public int getidUsuario(){
        return this.idUsuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getNombre() {
        return nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public String getRol() {
        return rol;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }
    
  public abstract String MostrarInformacion(); 
    
}