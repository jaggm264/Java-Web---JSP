<%@include file="lib/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-primary text-white py-3 rounded-top-4 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-pencil-square me-2"></i>Editar / Eliminar Herramienta IA</h5>
                    <span class="badge bg-light text-dark px-3 py-2 rounded-pill">ID: 1</span>
                </div>
                <div class="card-body p-4">
                    <form action="IAServlet" method="POST">
                        <input type="hidden" name="idHerramienta" value="1">
                        
                        <div class="mb-3">
                            <label for="nombreAI" class="form-label fw-semibold">Nombre de la IA</label>
                            <input type="text" class="form-control" id="nombreAI" name="nombreAI" value="ChatGPT" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nombreCompetencia" class="form-label fw-semibold">Competencia / Enfoque</label>
                            <input type="text" class="form-control" id="nombreCompetencia" name="nombreCompetencia" value="Generación de texto y Asistencia general" required>
                        </div>

                        <div class="mb-4">
                            <label for="descripcionNivel" class="form-label fw-semibold">Nivel / Descripción</label>
                            <input type="text" class="form-control" id="descripcionNivel" name="descripcionNivel" value="Básico / Intermedio" required>
                        </div>

                        <div class="d-grid mb-3 mt-4">
                            <button type="submit" name="accion" value="actualizar" class="btn btn-primary rounded-pill py-2 fw-bold shadow-sm">
                                Actualizar IA
                            </button>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <button type="submit" name="accion" value="eliminar" class="btn btn-danger rounded-pill px-4 text-nowrap w-auto" style="width: auto !important; background-color: #dc3545 !important; border-color: #dc3545 !important;" onclick="return confirm('¿Estás seguro de que deseas eliminar esta IA?');">
                                <i class="bi bi-trash me-1"></i>Eliminar IA
                            </button>
                            
                            <a href="adminUsuario.jsp" class="btn btn-secondary rounded-pill px-4 text-nowrap text-decoration-none w-auto">
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