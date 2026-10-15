<%@include file="lib/header.jsp" %>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-primary text-white py-3 rounded-top-4">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-cpu me-2"></i>Registrar Nueva Herramienta IA</h5>
                </div>
                <div class="card-body p-4">
                    <form action="ServletHerramientaIA" method="POST">
                        <input type="hidden" name="accion" value="crear">
                        
                        <div class="mb-3">
                            <label for="nombreAI" class="form-label fw-semibold">Nombre de la IA</label>
                            <input type="text" class="form-control" id="nombreAI" name="nombreAI" placeholder="Ej. Claude" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nombreCompetencia" class="form-label fw-semibold">Competencia / Enfoque</label>
                            <input type="text" class="form-control" id="nombreCompetencia" name="nombreCompetencia" placeholder="Ej. Redacción y análisis" required>
                        </div>

                        <div class="mb-3">
                            <label for="descripcionNivel" class="form-label fw-semibold">Nivel de la IA</label>
                            <select class="form-select" id="descripcionNivel" name="descripcionNivel" required>
                                <option value="" disabled selected>Selecciona el nivel</option>
                                <option value="Básico">Básico</option>
                                <option value="Intermedio">Intermedio</option>
                                <option value="Avanzado">Avanzado</option>
                                <option value="Básico / Intermedio">Básico / Intermedio</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="url" class="form-label fw-semibold">URL de la IA</label>
                            <input type="url" class="form-control" id="url" name="url" placeholder="https://ejemplo.com" required>
                        </div>

                        <div class="mb-4">
                            <label for="imagen" class="form-label fw-semibold">Icono / Imagen Predeterminada</label>
                            <select class="form-select" id="imagen" name="imagen">
                                <option value="icon-ai.png" selected>Icono Genérico IA</option>
                                <option value="ChatGPT-Logo.svg.png">ChatGPT Logo</option>
                                <option value="gemini-icon.png">Gemini Icon</option>
                                <option value="free-deepseek-icon-svg-download-png-.png">DeepSeek Icon</option>
                                <option value="notebooklm-icon.png">NotebookLM Icon</option>
                            </select>
                        </div>

                        <div class="d-flex flex-wrap gap-2">
                            <a href="ServletUsuarios?accion=panelAdmin&tab=ias" class="btn btn-secondary rounded-pill px-4 text-decoration-none">Cancelar</a>
                            <button type="submit" class="btn btn-primary rounded-pill px-4 fw-bold">Registrar IA</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp" %>