/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Modelo.gestionarUsuarios;
import Modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ServletUsuarios", urlPatterns = {"/ServletUsuarios"})
public class ServletUsuarios extends HttpServlet {

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
            response.sendRedirect("login.jsp");
            return;
        }

        gestionarUsuarios gestorUsuarios = getGestorUsuarios(request);

        switch (accion) {
            case "login":
                autenticar(request, response, gestorUsuarios);
                break;
            case "panelAdmin":
                mostrarPanelAdmin(request, response, gestorUsuarios);
                break;
            case "cargarEditar":
                cargarEditar(request, response, gestorUsuarios);
                break;
            case "registrar":
                registrar(request, response, gestorUsuarios);
                break;
            case "actualizar":
                actualizar(request, response, gestorUsuarios);
                break;
            case "eliminar":
                eliminar(request, response, gestorUsuarios);
                break;
            default:
                response.sendRedirect("login.jsp");
                break;
        }
    }

    private void autenticar(HttpServletRequest request, HttpServletResponse response, gestionarUsuarios gestorUsuarios) throws IOException {
        String correo = request.getParameter("correo");
        String documento = request.getParameter("documento");
        String contraseña = request.getParameter("contraseña");

        Usuario usuario = gestorUsuarios.autenticarUsuario(correo, documento, contraseña);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogueado", usuario);
            
            String rol = usuario.getRol() != null ? usuario.getRol().trim() : "";
            
            if ("Admin".equalsIgnoreCase(rol) || "Administrador".equalsIgnoreCase(rol)) {
                response.sendRedirect("ServletUsuarios?accion=panelAdmin");
            } else if ("Profesor".equalsIgnoreCase(rol) || "Docente".equalsIgnoreCase(rol)) {
                response.sendRedirect("docenteUsuario.jsp");
            } else {
                response.sendRedirect("estudianteUsuario.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=credenciales");
        }
    }

    private void mostrarPanelAdmin(HttpServletRequest request, HttpServletResponse response, gestionarUsuarios gestorUsuarios) throws ServletException, IOException {
        request.setAttribute("listaUsuarios", gestorUsuarios.obtenerTodosLosUsuarios());
        request.getRequestDispatcher("adminUsuario.jsp").forward(request, response);
    }

    private void cargarEditar(HttpServletRequest request, HttpServletResponse response, gestionarUsuarios gestorUsuarios) throws ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("id"));
        Usuario usuario = gestorUsuarios.buscarPorId(idUsuario);
        request.setAttribute("usuarioAEditar", usuario);
        request.getRequestDispatcher("editarUsuario.jsp").forward(request, response);
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response, gestionarUsuarios gestorUsuarios) throws IOException {
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");
        String confirmarContraseña = request.getParameter("confirmarContraseña"); // Capturamos la confirmación
        String documento = request.getParameter("documento");
        String rol = request.getParameter("tipoRol");

        if (contraseña == null || !contraseña.equals(confirmarContraseña)) {
            response.sendRedirect("registroUsuario.jsp?error=passwordsNoCoinciden");
            return;
        }

        if (gestorUsuarios.buscarPorCorreo(correo) != null || gestorUsuarios.buscarPorDocumento(documento) != null) {
            response.sendRedirect("registroUsuario.jsp?error=duplicado");
            return;
        }

        if ("estudiante".equalsIgnoreCase(rol)) {
            gestorUsuarios.crearEstudiante(nombre, correo, contraseña, documento);
        } else if ("profesor".equalsIgnoreCase(rol) || "docente".equalsIgnoreCase(rol)) {
            gestorUsuarios.crearDocente(nombre, correo, contraseña, documento);
        }

        response.sendRedirect("ServletUsuarios?accion=panelAdmin");
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response, gestionarUsuarios gestorUsuarios) throws IOException {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String documento = request.getParameter("documento");
        String contraseña = request.getParameter("contraseña");
        String rol = request.getParameter("rol");

        gestorUsuarios.actualizarUsuario(idUsuario, nombre, correo, documento, contraseña, rol);
        
        response.sendRedirect("ServletUsuarios?accion=panelAdmin");
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response, gestionarUsuarios gestorUsuarios) throws IOException {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        gestorUsuarios.eliminarUsuario(idUsuario);
        
        response.sendRedirect("ServletUsuarios?accion=panelAdmin");
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