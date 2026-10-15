<%@include file="lib/header.jsp" %>
<%@page import="Modelo.Usuario" %>
<%@page import="Modelo.Estudiante" %>

<%
    Usuario u = (Usuario) request.getAttribute("usuarioAEditar");
    if (u == null) {
        u = new Estudiante(); 
    }
    boolean esAdmin = "Administrador".equals(u.getRol()) || "Admin".equals(u.getRol());
    String error = request.getParameter("error");
%>

<div class="container-fluid py-4 pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-info text-white py-3 rounded-top-4 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-person-gear me-2"></i>Editar / Eliminar Usuario</h5>
                    <span class="badge bg-light text-dark px-3 py-2 rounded-pill">ID: <%= u.getidUsuario() %></span>
                </div>
                <div class="card-body p-4">
                    
                    <% if ("duplicado".equals(error)) { %>
                        <div class="alert alert-danger alert-dismissible fade show rounded-3" role="alert">
                            <strong>¡Error!</strong> El correo o documento ingresado ya está registrado por otro usuario.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <form action="ServletUsuarios" method="POST">
                        <input type="hidden" name="idUsuario" value="<%= u.getidUsuario() %>">
                        
                        <div class="mb-3">
                            <label for="nombre" class="form-label fw-semibold">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<%= u.getNombre() %>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="correo" class="form-label fw-semibold">Correo Institucional</label>
                            <input type="email" class="form-control" id="correo" name="correo" value="<%= u.getCorreo() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="documento" class="form-label fw-semibold">Documento de identificación</label>
                            <input type="text" class="form-control" id="documento" name="documento" value="<%= u.getDocumento() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="contraseña" class="form-label fw-semibold">Contraseña</label>
                            <input type="password" class="form-control" id="contraseña" name="contraseña" value="<%= u.getContraseña() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="rol" class="form-label fw-semibold">Rol</label>
                            <select class="form-select" id="rol" name="rol" required>
                                <% if (esAdmin) { %>
                                    <option value="Administrador" selected>Administrador</option>
                                <% } %>
                                <option value="Estudiante" <%= "Estudiante".equals(u.getRol()) ? "selected" : "" %>>Estudiante</option>
                                <option value="Profesor" <%= "Profesor".equals(u.getRol()) || "Docente".equals(u.getRol()) ? "selected" : "" %>>Profesor</option>
                            </select>
                        </div>

                        <div class="d-grid mb-3 mt-4">
                            <button type="submit" name="accion" value="actualizar" class="btn btn-info text-white rounded-pill py-2 fw-bold shadow-sm" style="background-color: #0dcaf0 !important; border-color: #0dcaf0 !important;">
                                Actualizar Información
                            </button>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <button type="submit" name="accion" value="eliminar" class="btn btn-danger rounded-pill px-4 text-nowrap" style="width: auto !important; background-color: #dc3545 !important; border-color: #dc3545 !important;" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                                <i class="bi bi-trash me-1"></i>Eliminar Usuario
                            </button>
                            
                            <a href="ServletUsuarios?accion=panelAdmin&tab=usuarios" class="btn btn-secondary rounded-pill px-4 text-nowrap text-decoration-none">
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