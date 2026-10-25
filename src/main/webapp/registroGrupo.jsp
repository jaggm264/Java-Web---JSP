<%@include file="lib/header.jsp" %>
<%@page import="java.util.ArrayList" %>

<%
    String error = request.getParameter("error");
    ArrayList<String> docentes = (ArrayList<String>) request.getAttribute("listaDocentesDisponibles");
    ArrayList<String> estudiantes = (ArrayList<String>) request.getAttribute("listaEstudiantesDisponibles");
%>

<div class="container-fluid py-4 pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-success text-white py-3 rounded-top-4">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-diagram-3-fill me-2"></i>Crear Nuevo Grupo</h5>
                </div>
                <div class="card-body p-4">
                    
                    <% if ("duplicado".equals(error)) { %>
                        <div class="alert alert-danger alert-dismissible fade show rounded-3" role="alert">
                            <strong>¡Error!</strong> Ya existe un grupo registrado con ese nombre.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <form action="ServletGrupos" method="POST">
                        <input type="hidden" name="accion" value="crear">
                        
                        <div class="mb-3">
                            <label for="nombreGrupo" class="form-label fw-semibold">Nombre del Grupo</label>
                            <input type="text" class="form-control" id="nombreGrupo" name="nombreGrupo" placeholder="Ej. Equipo 1" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nombreDocente" class="form-label fw-semibold">Docente Encargado</label>
                            <select class="form-select" id="nombreDocente" name="nombreDocente" required>
                                <option value="" disabled selected>Selecciona un docente disponible</option>
                                <% if (docentes != null) {
                                    for (String doc : docentes) { %>
                                        <option value="<%= doc %>"><%= doc %></option>
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
                                            <option value="<%= est %>"><%= est %></option>
                                    <% } } %>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="integrante2" class="form-label fw-semibold">Integrante 2</label>
                                <select class="form-select" id="integrante2" name="integrante2">
                                    <option value="">Ninguno / Vacío</option>
                                    <% if (estudiantes != null) {
                                        for (String est : estudiantes) { %>
                                            <option value="<%= est %>"><%= est %></option>
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
                                            <option value="<%= est %>"><%= est %></option>
                                    <% } } %>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="integrante4" class="form-label fw-semibold">Integrante 4</label>
                                <select class="form-select" id="integrante4" name="integrante4">
                                    <option value="">Ninguno / Vacío</option>
                                    <% if (estudiantes != null) {
                                        for (String est : estudiantes) { %>
                                            <option value="<%= est %>"><%= est %></option>
                                    <% } } %>
                                </select>
                            </div>
                        </div>
                        
                        <div class="d-flex flex-wrap gap-2">
                            <a href="ServletUsuarios?accion=panelAdmin&tab=grupos" class="btn btn-secondary rounded-pill px-4 text-decoration-none">Cancelar</a>
                            <button type="submit" class="btn btn-success rounded-pill px-4 fw-bold">Crear Grupo</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp" %>