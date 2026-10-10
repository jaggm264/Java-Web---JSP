<%@include file="lib/header.jsp" %>

<div class="container-fluid py-4 pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-info text-white py-3 rounded-top-4 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-person-gear me-2"></i>Editar / Eliminar Usuario</h5>
                    <span class="badge bg-light text-dark px-3 py-2 rounded-pill">ID: 1</span>
                </div>
                <div class="card-body p-4">
                    <form action="UsuarioServlet" method="POST">
                        <input type="hidden" name="idUsuario" value="1">
                        
                        <div class="mb-3">
                            <label for="nombre" class="form-label fw-semibold">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="Andrés Ruiz" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="correo" class="form-label fw-semibold">Correo Institucional</label>
                            <input type="email" class="form-control" id="correo" name="correo" value="andres@correo.com" required>
                        </div>

                        <div class="mb-3">
                            <label for="documento" class="form-label fw-semibold">Documento de identificación</label>
                            <input type="text" class="form-control" id="documento" name="documento" value="123456789" required>
                        </div>

                        <div class="mb-3">
                            <label for="contraseña" class="form-label fw-semibold">Contraseña</label>
                            <input type="password" class="form-control" id="contraseña" name="contraseña" value="1234" required>
                        </div>

                        <div class="mb-3">
                            <label for="rol" class="form-label fw-semibold">Rol</label>
                            <select class="form-select" id="rol" name="rol" required>
                                <option value="Administrador" selected>Administrador</option>
                                <option value="Estudiante">Estudiante</option>
                                <option value="Profesor">Profesor</option>
                            </select>
                        </div>

                        <div class="d-grid mb-3 mt-4">
                            <button type="submit" name="accion" value="actualizar" class="btn btn-info text-white rounded-pill py-2 fw-bold shadow-sm">
                                Actualizar Información
                            </button>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <button type="submit" name="accion" value="eliminar" class="btn btn-danger rounded-pill px-4 text-nowrap" style="width: auto !important; background-color: #dc3545 !important; border-color: #dc3545 !important;" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                                <i class="bi bi-trash me-1"></i>Eliminar Usuario
                            </button>
                            
                            <a href="adminUsuario.jsp" class="btn btn-secondary rounded-pill px-4 text-nowrap text-decoration-none">
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