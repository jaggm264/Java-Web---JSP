/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Modelo.gestionarReporte;
import Modelo.Reporte;
import java.io.IOException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletReportes", urlPatterns = {"/ServletReportes"})
public class ServletReportes extends HttpServlet {

    private gestionarReporte getGestorReporte(HttpServletRequest request) {
        ServletContext context = request.getServletContext();
        gestionarReporte gestor = (gestionarReporte) context.getAttribute("gestorReporteInstance");
        if (gestor == null) {
            gestor = new gestionarReporte();
            // Reporte por defecto para pruebas iniciales
            gestor.crearReporte("Reporte - Equipo 1", "Detalles iniciales del reporte del equipo 1...");
            context.setAttribute("gestorReporteInstance", gestor);
        }
        return gestor;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        if (accion == null) {
            response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=reportes");
            return;
        }

        gestionarReporte gestorReporte = getGestorReporte(request);

        switch (accion) {
            case "crear":
                registrarReporte(request, response, gestorReporte);
                break;
            case "cargarEditar":
                cargarEditar(request, response, gestorReporte);
                break;
            case "actualizar":
                actualizarReporte(request, response, gestorReporte);
                break;
            case "eliminar":
                eliminarReporte(request, response, gestorReporte);
                break;
            default:
                response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=reportes");
                break;
        }
    }

    private void registrarReporte(HttpServletRequest request, HttpServletResponse response, gestionarReporte gestorReporte) throws IOException {
        String nombreReporte = request.getParameter("nombreReporte");
        String contenido = request.getParameter("contenido");

        gestorReporte.crearReporte(nombreReporte, contenido);
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=reportes");
    }

    private void cargarEditar(HttpServletRequest request, HttpServletResponse response, gestionarReporte gestorReporte) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Reporte reporte = gestorReporte.buscarReportePorId(id);
                request.setAttribute("reporteAEditar", reporte);
                request.getRequestDispatcher("editarReporte.jsp").forward(request, response);
                return;
            } catch (NumberFormatException e) {
                // Error de formato
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=reportes");
    }

    private void actualizarReporte(HttpServletRequest request, HttpServletResponse response, gestionarReporte gestorReporte) throws IOException {
        String idStr = request.getParameter("idReporte");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                String nombreReporte = request.getParameter("nombreReporte");
                String contenido = request.getParameter("contenido");

                gestorReporte.actualizarReporte(id, nombreReporte, contenido);
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=reportes");
    }

    private void eliminarReporte(HttpServletRequest request, HttpServletResponse response, gestionarReporte gestorReporte) throws IOException {
        String idStr = request.getParameter("idReporte");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                gestorReporte.eliminarReporte(id);
            } catch (NumberFormatException e) {
                // Error
            }
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=reportes");
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
