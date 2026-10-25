/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Modelo.gestionarGrupo;
import Modelo.Grupo;
import Modelo.gestionarUsuarios;
import Modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@WebServlet(name = "ServletGrupos", urlPatterns = {"/ServletGrupos"})
public class ServletGrupos extends HttpServlet {

    private gestionarGrupo getGestorGrupo(HttpServletRequest request) {
        ServletContext context = request.getServletContext();
        gestionarGrupo gestor = (gestionarGrupo) context.getAttribute("gestorGrupoInstance");
        if (gestor == null) {
            gestor = new gestionarGrupo();
            context.setAttribute("gestorGrupoInstance", gestor);
        }
        return gestor;
    }

    private gestionarUsuarios getGestorUsuarios(HttpServletRequest request) {
        ServletContext context = request.getServletContext();
        gestionarUsuarios gestor = (gestionarUsuarios) context.getAttribute("gestorUsuariosInstance");
        if (gestor == null) {
            gestor = new gestionarUsuarios();
            context.setAttribute("gestorUsuariosInstance", gestor);
        }
        return gestor;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        if (accion == null) {
            response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=grupos");
            return;
        }

        gestionarGrupo gestorGrupo = getGestorGrupo(request);
        gestionarUsuarios gestorUsuarios = getGestorUsuarios(request);

        switch (accion) {
            case "cargarRegistro":
                cargarRegistro(request, response, gestorGrupo, gestorUsuarios);
                break;
            case "crear":
                registrarGrupo(request, response, gestorGrupo, gestorUsuarios);
                break;
            case "cargarEditar":
                cargarEditar(request, response, gestorGrupo, gestorUsuarios);
                break;
            case "actualizar":
                actualizarGrupo(request, response, gestorGrupo, gestorUsuarios);
                break;
            case "eliminar":
                eliminarGrupo(request, response, gestorGrupo);
                break;
            default:
                response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=grupos");
                break;
        }
    }

    private ArrayList<String> obtenerDocentesDisponibles(gestionarUsuarios gestorUsuarios, gestionarGrupo gestorGrupo, int idGrupoExcluir) {
        ArrayList<String> disponibles = new ArrayList<>();
        if (gestorUsuarios == null) return disponibles;
        
        ArrayList<String> docentesOcupados = new ArrayList<>();
        if (gestorGrupo != null) {
            for (Grupo g : gestorGrupo.obtenerTodosLosGrupos()) {
                if (g.getIdGrupo() != idGrupoExcluir && g.getNombreDocente() != null && !g.getNombreDocente().isEmpty()) {
                    docentesOcupados.add(g.getNombreDocente().trim().toLowerCase());
                }
            }
        }
        
        for (Usuario u : gestorUsuarios.obtenerTodosLosUsuarios()) {
            String rol = u.getRol() != null ? u.getRol().trim() : "";
            if (rol.equalsIgnoreCase("Profesor") || rol.equalsIgnoreCase("Docente")) {
                String nombre = u.getNombre();
                if (!docentesOcupados.contains(nombre.toLowerCase())) {
                    disponibles.add(nombre);
                }
            }
        }
        return disponibles;
    }

    private ArrayList<String> obtenerEstudiantesDisponibles(gestionarUsuarios gestorUsuarios, gestionarGrupo gestorGrupo, int idGrupoExcluir) {
        ArrayList<String> disponibles = new ArrayList<>();
        if (gestorUsuarios == null) return disponibles;
        
        ArrayList<String> estudiantesOcupados = new ArrayList<>();
        if (gestorGrupo != null) {
            for (Grupo g : gestorGrupo.obtenerTodosLosGrupos()) {
                if (g.getIdGrupo() != idGrupoExcluir) {
                    if (g.getIntegrante1() != null && !g.getIntegrante1().isEmpty()) estudiantesOcupados.add(g.getIntegrante1().trim().toLowerCase());
                    if (g.getIntegrante2() != null && !g.getIntegrante2().isEmpty()) estudiantesOcupados.add(g.getIntegrante2().trim().toLowerCase());
                    if (g.getIntegrante3() != null && !g.getIntegrante3().isEmpty()) estudiantesOcupados.add(g.getIntegrante3().trim().toLowerCase());
                    if (g.getIntegrante4() != null && !g.getIntegrante4().isEmpty()) estudiantesOcupados.add(g.getIntegrante4().trim().toLowerCase());
                }
            }
        }
        
        for (Usuario u : gestorUsuarios.obtenerTodosLosUsuarios()) {
            String rol = u.getRol() != null ? u.getRol().trim() : "";
            if (rol.equalsIgnoreCase("Estudiante")) {
                String nombre = u.getNombre();
                if (!estudiantesOcupados.contains(nombre.toLowerCase())) {
                    disponibles.add(nombre);
                }
            }
        }
        return disponibles;
    }

    private void cargarRegistro(HttpServletRequest request, HttpServletResponse response, gestionarGrupo gestorGrupo, gestionarUsuarios gestorUsuarios) throws ServletException, IOException {
        // Obtenemos la instancia correcta del gestor de usuarios
        gestionarUsuarios gestorUsr = getGestorUsuarios(request);
        
        request.setAttribute("listaDocentesDisponibles", obtenerDocentesDisponibles(gestorUsr, gestorGrupo, -1));
        request.setAttribute("listaEstudiantesDisponibles", obtenerEstudiantesDisponibles(gestorUsr, gestorGrupo, -1));
        request.getRequestDispatcher("registroGrupo.jsp").forward(request, response);
    }

    private void registrarGrupo(HttpServletRequest request, HttpServletResponse response, gestionarGrupo gestorGrupo, gestionarUsuarios gestorUsuarios) throws IOException, ServletException {
        String nombreGrupo = request.getParameter("nombreGrupo");
        String nombreDocente = request.getParameter("nombreDocente");
        String integrante1 = request.getParameter("integrante1");
        String integrante2 = request.getParameter("integrante2");
        String integrante3 = request.getParameter("integrante3");
        String integrante4 = request.getParameter("integrante4");

        if (gestorGrupo.existeNombreGrupo(nombreGrupo)) {
            response.sendRedirect("ServletGrupos?accion=cargarRegistro&error=duplicado");
            return;
        }

        gestorGrupo.crearGrupo(nombreGrupo);
        ArrayList<Grupo> lista = gestorGrupo.obtenerTodosLosGrupos();
        if (!lista.isEmpty()) {
            Grupo nuevoGrupo = lista.get(lista.size() - 1);
            gestorGrupo.asignarIntegrantes(nuevoGrupo.getIdGrupo(), integrante1, integrante2, integrante3, integrante4, nombreDocente);
        }
        
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=grupos");
    }

    private void cargarEditar(HttpServletRequest request, HttpServletResponse response, gestionarGrupo gestorGrupo, gestionarUsuarios gestorUsuarios) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Grupo grupo = gestorGrupo.buscarGrupoPorId(id);
                request.setAttribute("grupoAEditar", grupo);
                
                // Obtenemos la instancia correcta del gestor de usuarios
                gestionarUsuarios gestorUsr = getGestorUsuarios(request);
                
                ArrayList<String> docentesDisp = obtenerDocentesDisponibles(gestorUsr, gestorGrupo, id);
                if (grupo.getNombreDocente() != null && !grupo.getNombreDocente().isEmpty() && !docentesDisp.contains(grupo.getNombreDocente())) {
                    docentesDisp.add(grupo.getNombreDocente());
                }
                request.setAttribute("listaDocentesDisponibles", docentesDisp);
                
                ArrayList<String> estudiantesDisp = obtenerEstudiantesDisponibles(gestorUsr, gestorGrupo, id);
                if (grupo.getIntegrante1() != null && !grupo.getIntegrante1().isEmpty() && !estudiantesDisp.contains(grupo.getIntegrante1())) estudiantesDisp.add(grupo.getIntegrante1());
                if (grupo.getIntegrante2() != null && !grupo.getIntegrante2().isEmpty() && !estudiantesDisp.contains(grupo.getIntegrante2())) estudiantesDisp.add(grupo.getIntegrante2());
                if (grupo.getIntegrante3() != null && !grupo.getIntegrante3().isEmpty() && !estudiantesDisp.contains(grupo.getIntegrante3())) estudiantesDisp.add(grupo.getIntegrante3());
                if (grupo.getIntegrante4() != null && !grupo.getIntegrante4().isEmpty() && !estudiantesDisp.contains(grupo.getIntegrante4())) estudiantesDisp.add(grupo.getIntegrante4());
                
                request.setAttribute("listaEstudiantesDisponibles", estudiantesDisp);
                
                request.getRequestDispatcher("editarGrupo.jsp").forward(request, response);
                return;
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=grupos");
    }

    private void actualizarGrupo(HttpServletRequest request, HttpServletResponse response, gestionarGrupo gestorGrupo, gestionarUsuarios gestorUsuarios) throws IOException {
        String idStr = request.getParameter("idGrupo");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                String nombreGrupo = request.getParameter("nombreGrupo");
                String nombreDocente = request.getParameter("nombreDocente");
                String integrante1 = request.getParameter("integrante1");
                String integrante2 = request.getParameter("integrante2");
                String integrante3 = request.getParameter("integrante3");
                String integrante4 = request.getParameter("integrante4");

                if (gestorGrupo.existeNombreGrupoExcluding(nombreGrupo, id)) {
                    response.sendRedirect("ServletGrupos?accion=cargarEditar&id=" + id + "&error=duplicado");
                    return;
                }

                gestorGrupo.actualizarNombreGrupo(id, nombreGrupo);
                gestorGrupo.asignarIntegrantes(id, integrante1, integrante2, integrante3, integrante4, nombreDocente);
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=grupos");
    }

    private void eliminarGrupo(HttpServletRequest request, HttpServletResponse response, gestionarGrupo gestorGrupo) throws IOException {
        String idStr = request.getParameter("idGrupo");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                gestorGrupo.eliminarGrupo(id);
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=grupos");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}