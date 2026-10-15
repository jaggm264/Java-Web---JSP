/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Modelo.HerramientaAI;
import Modelo.gestionarAI;
import java.io.IOException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author bbsot
 */
@WebServlet(name = "ServletHerramientaIA", urlPatterns = {"/ServletHerramientaIA"})
public class ServletHerramientaIA extends HttpServlet {

    private gestionarAI getGestorAI(HttpServletRequest request) {
        ServletContext context = request.getServletContext();
        gestionarAI gestor = (gestionarAI) context.getAttribute("gestorAIInstance");
        if (gestor == null) {
            gestor = new gestionarAI();
            context.setAttribute("gestorAIInstance", gestor);
        }
        return gestor;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        if (accion == null) {
            response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=ias");
            return;
        }

        gestionarAI gestorAI = getGestorAI(request);

        switch (accion) {
            case "crear":
                registrarHerramienta(request, response, gestorAI);
                break;
            case "cargarEditar":
                cargarEditar(request, response, gestorAI);
                break;
            case "actualizar":
                actualizarHerramienta(request, response, gestorAI);
                break;
            case "eliminar":
                eliminarHerramienta(request, response, gestorAI);
                break;
            case "usar":
                usarHerramienta(request, response, gestorAI);
                break;
            default:
                response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=ias");
                break;
        }
    }

    private void registrarHerramienta(HttpServletRequest request, HttpServletResponse response, gestionarAI gestorAI) throws IOException {
        String nombreAI = request.getParameter("nombreAI");
        String nombreCompetencia = request.getParameter("nombreCompetencia");
        String descripcionNivel = request.getParameter("descripcionNivel");
        String url = request.getParameter("url");
        String imagen = request.getParameter("imagen");

        if (imagen == null || imagen.isEmpty()) {
            imagen = "icon-ai.png";
        }

        boolean creado = gestorAI.crearHerramienta(nombreAI, nombreCompetencia, descripcionNivel, url, imagen);
        if (!creado) {
            response.sendRedirect("registroIA.jsp?error=duplicado");
            return;
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=ias");
    }

    private void cargarEditar(HttpServletRequest request, HttpServletResponse response, gestionarAI gestorAI) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                HerramientaAI ai = gestorAI.buscarHerramientaPorId(id);
                request.setAttribute("aiAEditar", ai);
                request.getRequestDispatcher("editarIA.jsp").forward(request, response);
                return;
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=ias");
    }

    private void actualizarHerramienta(HttpServletRequest request, HttpServletResponse response, gestionarAI gestorAI) throws IOException {
        String idStr = request.getParameter("idHerramienta");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                String nombreAI = request.getParameter("nombreAI");
                String nombreCompetencia = request.getParameter("nombreCompetencia");
                String descripcionNivel = request.getParameter("descripcionNivel");
                String url = request.getParameter("url");
                String imagen = request.getParameter("imagen");

                if (imagen == null || imagen.isEmpty()) {
                    imagen = "icon-ai.png";
                }

                boolean actualizado = gestorAI.actualizarHerramienta(id, nombreAI, nombreCompetencia, descripcionNivel, url, imagen);
                if (!actualizado) {
                    response.sendRedirect("ServletHerramientaIA?accion=cargarEditar&id=" + id + "&error=duplicado");
                    return;
                }
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=ias");
    }

    private void eliminarHerramienta(HttpServletRequest request, HttpServletResponse response, gestionarAI gestorAI) throws IOException {
        String idStr = request.getParameter("idHerramienta");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                gestorAI.eliminarHerramienta(id);
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=ias");
    }

    private void usarHerramienta(HttpServletRequest request, HttpServletResponse response, gestionarAI gestorAI) throws IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                gestorAI.incrementarUso(id);
                HerramientaAI ai = gestorAI.buscarHerramientaPorId(id);
                if (ai != null && ai.getUrl() != null && !ai.getUrl().isEmpty()) {
                    response.sendRedirect(ai.getUrl());
                    return;
                }
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("estudianteUsuario.jsp");
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