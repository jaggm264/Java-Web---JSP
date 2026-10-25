<%@include file="lib/header.jsp" %>
<%@page import="Modelo.Grupo" %>
<%@page import="java.util.ArrayList" %>

<%
    Grupo grupo = (Grupo) request.getAttribute("grupoAEditar");
    if (grupo == null) {
        grupo = new Grupo();
    }
    String error = request.getParameter("error");
    ArrayList<String> docentes = (ArrayList<String>) request.getAttribute("listaDocentesDisponibles");
    ArrayList<String> estudiantes = (ArrayList<String>) request.getAttribute("listaEstudiantesDisponibles");
%>

<div class="container-fluid py-4 pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-success text-white py-3 rounded-top-4 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-pencil-square me-2"></i>Editar / Eliminar Grupo</h5>
                    <span class="badge bg-light text-dark px-3 py-2 rounded-pill">ID: <%= grupo.getIdGrupo() %></span>
                </div>
                <div class="card-body p-4">
                    
                    <% if ("duplicado".equals(error)) { %>
                        <div class="alert alert-danger alert-dismissible fade show rounded-3" role="alert">
                            <strong>¡Error!</strong> Ya existe otro grupo con ese mismo nombre en el sistema.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <form action="ServletGrupos" method="POST">
                        <input type="hidden" name="idGrupo" value="<%= grupo.getIdGrupo() %>">
                        
                        <div class="mb-3">
                            <label for="nombreGrupo" class="form-label fw-semibold">Nombre del Grupo</label>
                            <input type="text" class="form-control" id="nombreGrupo" name="nombreGrupo" value="<%= grupo.getNombreGrupo() %>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nombreDocente" class="form-label fw-semibold">Docente Encargado</label>
                            <select class="form-select" id="nombreDocente" name="nombreDocente" required>
                                <option value="" disabled>Selecciona un docente</option>
                                <% if (docentes != null) {
                                    for (String doc : docentes) { %>
                                        <option value="<%= doc %>" <%= doc.equalsIgnoreCase(grupo.getNombreDocente()) ? "selected" : "" %>><%= doc %></option>
                                <% } } %>
                            </select>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label for="integrante1" class="form-label fw-semibold">Integrante 1</label>
                                <select class="form-select" id="integrante1" name="integrante1">
                                    <option value="">Ninguno / Vacío</option>
                                    <% if (estudiantes != null) {
                                        for (String est : estudiantes) { %>
                                            <option value="<%= est %>" <%= est.equalsIgnoreCase(grupo.getIntegrante1()) ? "selected" : "" %>><%= est %></option>
                                    <% } } %>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="integrante2" class="form-label fw-semibold">Integrante 2</label>
                                <select class="form-select" id="integrante2" name="integrante2">
                                    <option value="">Ninguno / Vacío</option>
                                    <% if (estudiantes != null) {
                                        for (String est : estudiantes) { %>
                                            <option value="<%= est %>" <%= est.equalsIgnoreCase(grupo.getIntegrante2()) ? "selected" : "" %>><%= est %></option>
                                    <% } } %>
                                </select>
                            </div>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label for="integrante3" class="form-label fw-semibold">Integrante 3</label>
                                <select class="form-select" id="integrante3" name="integrante3">
                                    <option value="">Ninguno / Vacío</option>
                                    <% if (estudiantes != null) {
                                        for (String est : estudiantes) { %>
                                            <option value="<%= est %>" <%= est.equalsIgnoreCase(grupo.getIntegrante3()) ? "selected" : "" %>><%= est %></option>
                                    <% } } %>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="integrante4" class="form-label fw-semibold">Integrante 4</label>
                                <select class="form-select" id="integrante4" name="integrante4">
                                    <option value="">Ninguno / Vacío</option>
                                    <% if (estudiantes != null) {
                                        for (String est : estudiantes) { %>
                                            <option value="<%= est %>" <%= est.equalsIgnoreCase(grupo.getIntegrante4()) ? "selected" : "" %>><%= est %></option>
                                    <% } } %>
                                </select>
                            </div>
                        </div>

                        <div class="d-grid mb-3 mt-4">
                            <button type="submit" name="accion" value="actualizar" class="btn btn-success rounded-pill py-2 fw-bold shadow-sm">
                                Actualizar Grupo
                            </button>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <button type="submit" name="accion" value="eliminar" class="btn btn-danger rounded-pill px-4 text-nowrap w-auto" style="width: auto !important; background-color: #dc3545 !important; border-color: #dc3545 !important;" onclick="return confirm('¿Estás seguro de que deseas eliminar este grupo?');">
                                <i class="bi bi-trash me-1"></i>Eliminar Grupo
                            </button>
                            
                            <a href="ServletUsuarios?accion=panelAdmin&tab=grupos" class="btn btn-secondary rounded-pill px-4 text-nowrap text-decoration-none w-auto">
                                Cancelar
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp" %>