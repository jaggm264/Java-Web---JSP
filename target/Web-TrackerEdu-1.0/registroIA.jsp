<%@include file="lib/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-primary text-white py-3 rounded-top-4">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-cpu me-2"></i>Registrar Nueva Herramienta IA</h5>
                </div>
                <div class="card-body p-4">
                    <form action="IAServlet" method="POST">
                        <input type="hidden" name="accion" value="crear">
                        
                        <div class="mb-3">
                            <label for="nombreAI" class="form-label fw-semibold">Nombre de la IA</label>
                            <input type="text" class="form-control" id="nombreAI" name="nombreAI" placeholder="Ej. Claude" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nombreCompetencia" class="form-label fw-semibold">Competencia / Enfoque</label>
                            <input type="text" class="form-control" id="nombreCompetencia" name="nombreCompetencia" placeholder="Ej. Redacción y análisis de textos" required>
                        </div>

                        <div class="mb-4">
                            <label for="descripcionNivel" class="form-label fw-semibold">Nivel / Descripción</label>
                            <input type="text" class="form-control" id="descripcionNivel" name="descripcionNivel" placeholder="Ej. Avanzado / Intermedio" required>
                        </div>

                        <div class="d-flex flex-wrap gap-2">
                            <a href="adminUsuario.jsp" class="btn btn-secondary rounded-pill px-4 text-decoration-none">Cancelar</a>
                            <button type="submit" class="btn btn-primary rounded-pill px-4 fw-bold">Registrar IA</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp" %>