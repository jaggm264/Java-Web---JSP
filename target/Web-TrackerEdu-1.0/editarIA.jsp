<%@include file="lib/header.jsp" %>
<%@page import="Modelo.HerramientaAI" %>

<%
    HerramientaAI ai = (HerramientaAI) request.getAttribute("aiAEditar");
    if (ai == null) {
        ai = new HerramientaAI();
    }
    String nivelActual = ai.getDescripcionNivel();
    String error = request.getParameter("error");
%>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-primary text-white py-3 rounded-top-4 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-pencil-square me-2"></i>Editar / Eliminar Herramienta IA</h5>
                    <span class="badge bg-light text-dark px-3 py-2 rounded-pill">ID: <%= ai.getIdHerramienta() %></span>
                </div>
                <div class="card-body p-4">
                    
                    <% if ("duplicado".equals(error)) { %>
                        <div class="alert alert-danger alert-dismissible fade show rounded-3" role="alert">
                            <strong>¡Error!</strong> Ya existe otra herramienta de IA con el mismo nombre o la misma URL en el sistema.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <form action="ServletHerramientaIA" method="POST">
                        <input type="hidden" name="idHerramienta" value="<%= ai.getIdHerramienta() %>">
                        
                        <div class="mb-3">
                            <label for="nombreAI" class="form-label fw-semibold">Nombre de la IA</label>
                            <input type="text" class="form-control" id="nombreAI" name="nombreAI" value="<%= ai.getNombreAI() %>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nombreCompetencia" class="form-label fw-semibold">Competencia / Enfoque</label>
                            <input type="text" class="form-control" id="nombreCompetencia" name="nombreCompetencia" value="<%= ai.getNombreCompetencia() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="descripcionNivel" class="form-label fw-semibold">Nivel de la IA</label>
                            <select class="form-select" id="descripcionNivel" name="descripcionNivel" required>
                                <option value="Básico" <%= "Básico".equals(nivelActual) ? "selected" : "" %>>Básico</option>
                                <option value="Intermedio" <%= "Intermedio".equals(nivelActual) ? "selected" : "" %>>Intermedio</option>
                                <option value="Avanzado" <%= "Avanzado".equals(nivelActual) ? "selected" : "" %>>Avanzado</option>
                                <option value="Básico / Intermedio" <%= "Básico / Intermedio".equals(nivelActual) ? "selected" : "" %>>Básico / Intermedio</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="url" class="form-label fw-semibold">URL de la IA</label>
                            <input type="url" class="form-control" id="url" name="url" value="<%= ai.getUrl() %>" required>
                        </div>

                        <div class="mb-4">
                            <label for="imagen" class="form-label fw-semibold">Icono / Imagen Predeterminada</label>
                            <select class="form-select" id="imagen" name="imagen">
                                <option value="icon-ai.png" <%= "icon-ai.png".equals(ai.getImagen()) ? "selected" : "" %>>Icono Genérico IA</option>
                                <option value="ChatGPT-Logo.svg.png" <%= "ChatGPT-Logo.svg.png".equals(ai.getImagen()) ? "selected" : "" %>>ChatGPT Logo</option>
                                <option value="gemini-icon.png" <%= "gemini-icon.png".equals(ai.getImagen()) ? "selected" : "" %>>Gemini Icon</option>
                                <option value="free-deepseek-icon-svg-download-png-.png" <%= "free-deepseek-icon-svg-download-png-.png".equals(ai.getImagen()) ? "selected" : "" %>>DeepSeek Icon</option>
                                <option value="notebooklm-icon.png" <%= "notebooklm-icon.png".equals(ai.getImagen()) ? "selected" : "" %>>NotebookLM Icon</option>
                            </select>
                        </div>

                        <div class="d-grid mb-3 mt-4">
                            <button type="submit" name="accion" value="actualizar" class="btn btn-primary rounded-pill py-2 fw-bold shadow-sm">
                                Actualizar IA
                            </button>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <button type="submit" name="accion" value="eliminar" class="btn btn-danger rounded-pill px-4 text-nowrap w-auto" style="background-color: #dc3545 !important; border-color: #dc3545 !important;" onclick="return confirm('¿Estás seguro de que deseas eliminar esta IA?');">
                                <i class="bi bi-trash me-1"></i>Eliminar IA
                            </button>
                            
                            <a href="ServletUsuarios?accion=panelAdmin&tab=ias" class="btn btn-secondary rounded-pill px-4 text-nowrap text-decoration-none w-auto">
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