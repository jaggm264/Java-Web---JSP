/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;

public class gestionarUsuarios {

    private ArrayList<Usuario> listaUsuarios;
    private int contadorIdUsuario;
    private int contadorIdEstudiante;
    private int contadorIdDocente;

    private gestionarGrupo gestorGrupos;
    private gestionarAI gestorAIs;
    private gestionarReporte gestorReportes;

    public gestionarUsuarios() {
        this.listaUsuarios = new ArrayList<>();
        this.contadorIdUsuario = 0;
        this.contadorIdEstudiante = 0;
        this.contadorIdDocente = 0;
        
        this.gestorGrupos = new gestionarGrupo();
        this.gestorAIs = new gestionarAI();
        this.gestorReportes = new gestionarReporte();

        cargarUsuariosPorDefecto();
    }

    private void cargarUsuariosPorDefecto() {
        crearAdmin("Andrés Ruiz", "andres@correo.com", "1234", "123456789");
        crearEstudiante("Estudiante Prueba", "estudiante@correo.edu.co", "1234", "2000");
        crearDocente("Docente Prueba", "docente@correo.edu.co", "1234", "1000");
    }

    public Admin crearAdmin(String nombre, String correo, String contraseña, String documento) {
        contadorIdUsuario++;
        Admin admin = new Admin(contadorIdUsuario, nombre, correo, contraseña, 
                                gestorGrupos, gestorAIs, this, gestorReportes);
        admin.setDocumento(documento);
        listaUsuarios.add(admin);
        return admin;
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
    
    public ArrayList<Usuario> buscarUsuarios(String filtro) {
        if (filtro == null || filtro.trim().isEmpty()) {
            return listaUsuarios;
        }
        ArrayList<Usuario> filtrados = new ArrayList<>();
        String busqueda = filtro.trim().toLowerCase();
        for (Usuario u : listaUsuarios) {
            String correo = u.getCorreo() != null ? u.getCorreo().toLowerCase() : "";
            String documento = u.getDocumento() != null ? u.getDocumento().toLowerCase() : "";
            String nombre = u.getNombre() != null ? u.getNombre().toLowerCase() : "";
            String rol = u.getRol() != null ? u.getRol().toLowerCase() : "";
            
            if (correo.contains(busqueda) || documento.contains(busqueda) || nombre.contains(busqueda) || rol.contains(busqueda)) {
                filtrados.add(u);
            }
        }
        return filtrados;
    }
    
    public Usuario buscarPorId(int idUsuario) {
        for (Usuario u : listaUsuarios) {
            if (u.getidUsuario() == idUsuario) {
                return u;
            }
        }
        return null;
    }

    public Usuario buscarPorCorreo(String correo) {
        for (Usuario u : listaUsuarios) {
            if (u.getCorreo().equalsIgnoreCase(correo)) {
                return u;
            }
        }
        return null;
    }

    public Usuario buscarPorDocumento(String documento) {
        for (Usuario u : listaUsuarios) {
            if (u.getDocumento() != null && u.getDocumento().equals(documento)) {
                return u;
            }
        }
        return null;
    }

    public boolean existeCorreoExcluding(String correo, int idExcluir) {
        if (correo == null) return false;
        for (Usuario u : listaUsuarios) {
            if (u.getidUsuario() != idExcluir && u.getCorreo().equalsIgnoreCase(correo.trim())) {
                return true;
            }
        }
        return false;
    }

    public boolean existeDocumentoExcluding(String documento, int idExcluir) {
        if (documento == null) return false;
        for (Usuario u : listaUsuarios) {
            if (u.getidUsuario() != idExcluir && documento.equals(u.getDocumento())) {
                return true;
            }
        }
        return false;
    }

    public Usuario autenticarUsuario(String correo, String documento, String contraseña) {
        for (Usuario u : listaUsuarios) {
            if (u.getCorreo().equalsIgnoreCase(correo) 
                && u.getDocumento().equals(documento) 
                && u.getContraseña().equals(contraseña)) {
                return u; 
            }
        }
        return null; 
    }

    public boolean actualizarUsuario(int idUsuario, String nombre, String correo, String documento, String contraseña, String rol) {
        Usuario usuarioActual = buscarPorId(idUsuario);
        if (usuarioActual == null) {
            return false;
        }

        if (existeCorreoExcluding(correo, idUsuario) || existeDocumentoExcluding(documento, idUsuario)) {
            return false;
        }

        String rolNormalizado = rol != null ? rol.trim() : "";
        String rolActual = usuarioActual.getRol() != null ? usuarioActual.getRol().trim() : "";
        boolean esAdminOriginal = "Admin".equalsIgnoreCase(rolActual) || "Administrador".equalsIgnoreCase(rolActual);
        if (!esAdminOriginal && ("Admin".equalsIgnoreCase(rolNormalizado) || "Administrador".equalsIgnoreCase(rolNormalizado))) {
            rolNormalizado = rolActual;
        }

        listaUsuarios.remove(usuarioActual);

        if (rolNormalizado.equalsIgnoreCase("Profesor") || rolNormalizado.equalsIgnoreCase("Docente")) {
            contadorIdDocente++;
            Docente d = new Docente(idUsuario, nombre, correo, "Profesor", contadorIdDocente);
            d.setContraseña(contraseña);
            d.setDocumento(documento);
            listaUsuarios.add(d);
        } else if (rolNormalizado.equalsIgnoreCase("Estudiante")) {
            contadorIdEstudiante++;
            Estudiante e = new Estudiante(idUsuario, nombre, correo, "Estudiante", contadorIdEstudiante);
            e.setContraseña(contraseña);
            e.setDocumento(documento);
            listaUsuarios.add(e);
        } else {
            Admin a = new Admin(idUsuario, nombre, correo, contraseña, gestorGrupos, gestorAIs, this, gestorReportes);
            a.setDocumento(documento);
            a.setRol(rolNormalizado);
            listaUsuarios.add(a);
        }
        
        return true;
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