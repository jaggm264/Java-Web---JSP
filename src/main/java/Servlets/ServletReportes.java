/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Modelo.gestionarReporte;
import Modelo.Reporte;
import Modelo.gestionarAI;
import Modelo.gestionarGrupo;
import java.io.IOException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet(name = "ServletReportes", urlPatterns = {"/ServletReportes"})
public class ServletReportes extends HttpServlet {

    private gestionarReporte getGestorReporte(HttpServletRequest request) {
        ServletContext context = request.getServletContext();
        gestionarReporte gestor = (gestionarReporte) context.getAttribute("gestorReporteInstance");
        if (gestor == null) {
            gestor = new gestionarReporte();
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

        ServletContext context = request.getServletContext();
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
            case "generarAutomaticos":
                generarReportesAutomaticos(request, response, context, gestorReporte);
                break;
            case "verInformeDocente":
                verInformeDocente(request, response, context, gestorReporte);
                break;
            case "exportarCSV":
                exportarCSV(request, response, gestorReporte);
                break;
            default:
                response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=reportes");
                break;
        }
    }
    
    private void exportarCSV(HttpServletRequest request, HttpServletResponse response, gestionarReporte gestorReporte) throws IOException {
        String grupoParam = request.getParameter("grupo");
        
        response.setContentType("text/csv;charset=UTF-8");
        String nombreArchivo = (grupoParam != null && !grupoParam.isEmpty()) ? 
                               "reporte_" + grupoParam.replaceAll("\\s+", "_") + ".csv" : 
                               "reportes_trackeredu.csv";
                               
        response.setHeader("Content-Disposition", "attachment; filename=\"" + nombreArchivo + "\"");

        try (PrintWriter out = response.getWriter()) {
            out.write('\uFEFF');

            out.println("ID;Nombre del Reporte;Docente Encargado;Integrantes;Uso Global IA;Promedio Usos;IA Mas Usada;IA Menos Usada;Ranking de Participacion;Aporte Individual;Herramienta Favorita");

            java.util.ArrayList<Reporte> lista = gestorReporte.obtenerTodosLosReportes();
            for (Reporte r : lista) {
                if (grupoParam == null || grupoParam.trim().isEmpty() || r.getNombreReporte().toLowerCase().contains(grupoParam.toLowerCase())) {
                    
                    String doc = "N/A", integ = "N/A", usoG = "0", prom = "0", iaMas = "N/A", iaMen = "N/A", rank = "N/A", aporte = "N/A", fav = "N/A";
                    
                    String[] lineas = r.getContenido().split("\n");
                    for (String l : lineas) {
                        if (l.startsWith("Docente Encargado:")) doc = l.replace("Docente Encargado:", "").trim();
                        else if (l.startsWith("Integrantes:")) integ = l.replace("Integrantes:", "").trim();
                        else if (l.startsWith("Uso Global de IA:")) usoG = l.replace("Uso Global de IA:", "").trim();
                        else if (l.startsWith("Promedio de Usos:")) prom = l.replace("Promedio de Usos:", "").trim();
                        else if (l.startsWith("IA Mas Usada:")) iaMas = l.replace("IA Mas Usada:", "").trim();
                        else if (l.startsWith("IA Menos Usada:")) iaMen = l.replace("IA Menos Usada:", "").trim();
                        else if (l.startsWith("Ranking Participacion:")) rank = l.replace("Ranking Participacion:", "").trim();
                        else if (l.startsWith("Aporte Individual:")) aporte = l.replace("Aporte Individual:", "").trim();
                        else if (l.startsWith("Herramienta Favorita:")) fav = l.replace("Herramienta Favorita:", "").trim();
                    }
                    
                    out.println(r.getIdReporte() + ";" + 
                                "\"" + r.getNombreReporte().replace("\"", "\"\"") + "\";" + 
                                "\"" + doc.replace("\"", "\"\"") + "\";" + 
                                "\"" + integ.replace("\"", "\"\"") + "\";" + 
                                usoG + ";" + 
                                prom.replace(".", ",") + ";" + 
                                "\"" + iaMas.replace("\"", "\"\"") + "\";" + 
                                "\"" + iaMen.replace("\"", "\"\"") + "\";" + 
                                "\"" + rank.replace("\"", "\"\"") + "\";" + 
                                "\"" + aporte.replace("\"", "\"\"") + "\";" + 
                                "\"" + fav.replace("\"", "\"\"") + "\"");
                }
            }
        }
    }
    
    private void generarReportesAutomaticos(HttpServletRequest request, HttpServletResponse response, ServletContext context, gestionarReporte gestorReporte) throws IOException {
        gestionarGrupo gestorGrupo = (gestionarGrupo) context.getAttribute("gestorGrupoInstance");
        gestionarAI gestorAI = (gestionarAI) context.getAttribute("gestorAIInstance");
        
        if (gestorGrupo != null) {
            gestorReporte.generarReportesAutomaticos(gestorGrupo, gestorAI);
        }
        response.sendRedirect("ServletUsuarios?accion=panelAdmin&tab=reportes");
    }

    private void verInformeDocente(HttpServletRequest request, HttpServletResponse response, ServletContext context, gestionarReporte gestorReporte) throws ServletException, IOException {
        String nombreGrupo = request.getParameter("grupo");
        Reporte reporteEncontrado = null;
        
        if (nombreGrupo != null) {
            for (Reporte r : gestorReporte.obtenerTodosLosReportes()) {
                if (r.getNombreReporte().toLowerCase().contains(nombreGrupo.toLowerCase())) {
                    reporteEncontrado = r;
                    break;
                }
            }
        }
        
        request.setAttribute("reporteDocente", reporteEncontrado);
        request.getRequestDispatcher("verInformeDocente.jsp").forward(request, response);
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
                // Error
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