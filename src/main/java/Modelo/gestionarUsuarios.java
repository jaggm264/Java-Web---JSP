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
public class gestionarUsuarios {

    private ArrayList<Usuario> listaUsuarios;
    private int contadorIdUsuario;
    private int contadorIdEstudiante;
    private int contadorIdDocente;

    public gestionarUsuarios() {
        this.listaUsuarios = new ArrayList<>();
        this.contadorIdUsuario = 0;
        this.contadorIdEstudiante = 0;
        this.contadorIdDocente = 0;

        cargarUsuariosPorDefecto();
    }

    private void cargarUsuariosPorDefecto() {
        crearEstudiante("Estudiante Prueba", "estudiante@correo.edu.co", "1234", "2000");
        crearDocente("Docente Prueba", "docente@correo.edu.co", "1234", "1000");
    }

    public Estudiante crearEstudiante(String nombre, String correo, String contraseña, String documento) {
        contadorIdUsuario++;
        contadorIdEstudiante++;
        
        Estudiante estudiante = new Estudiante(contadorIdUsuario, nombre, correo, "Estudiante", contadorIdEstudiante);
        estudiante.setContraseña(contraseña);
        estudiante.setDocumento(documento);
        
        listaUsuarios.add(estudiante);
        return estudiante;
    }

    public Docente crearDocente(String nombre, String correo, String contraseña, String documento) {
        contadorIdUsuario++;
        contadorIdDocente++;
        
        Docente docente = new Docente(contadorIdUsuario, nombre, correo, "Profesor", contadorIdDocente);
        docente.setContraseña(contraseña);
        docente.setDocumento(documento);
        
        listaUsuarios.add(docente);
        return docente;
    }


    public ArrayList<Usuario> obtenerTodosLosUsuarios() {
        return listaUsuarios;
    }

    public ArrayList<Estudiante> obtenerSoloEstudiantes() {
        ArrayList<Estudiante> estudiantes = new ArrayList<>();
        for (Usuario user : listaUsuarios) {
            if (user instanceof Estudiante) {
                estudiantes.add((Estudiante) user);
            }
        }
        return estudiantes;
    }

    public ArrayList<Docente> obtenerSoloDocentes() {
        ArrayList<Docente> docentes = new ArrayList<>();
        for (Usuario user : listaUsuarios) {
            if (user instanceof Docente) {
                docentes.add((Docente) user);
            }
        }
        return docentes;
    }

    public Usuario buscarPorId(int idUsuario) {
        for (Usuario u : listaUsuarios) {
            if (u.getidUsuario() == idUsuario) {
                return u;
            }
        }
        return null;
    }

    public Usuario buscarPorDocumento(String documento) {
        for (Usuario u : listaUsuarios) {
            if (u.getDocumento().equals(documento)) {
                return u;
            }
        }
        return null;
    }

    public Usuario autenticarUsuario(String correo, String contraseña) {
        for (Usuario u : listaUsuarios) {
            if (u.getCorreo().equalsIgnoreCase(correo) && u.getContraseña().equals(contraseña)) {
                return u; 
            }
        }
        return null; 
    }

    public boolean actualizarUsuario(int idUsuario, String nuevoNombre, String nuevoCorreo, String nuevoDocumento) {
        Usuario usuario = buscarPorId(idUsuario);
        if (usuario != null) {
            usuario.setNombre(nuevoNombre);
            usuario.setCorreo(nuevoCorreo);
            usuario.setDocumento(nuevoDocumento);
            return true;
        }
        return false;
    }

    public boolean cambiarContraseña(int idUsuario, String nuevaContraseña) {
        Usuario usuario = buscarPorId(idUsuario);
        if (usuario != null) {
            usuario.setContraseña(nuevaContraseña);
            return true;
        }
        return false;
    }

    public boolean eliminarUsuario(int idUsuario) {
        Usuario usuario = buscarPorId(idUsuario);
        if (usuario != null) {
            listaUsuarios.remove(usuario);
            return true;
        }
        return false;
    }
}