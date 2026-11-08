<%@include file="lib/header.jsp" %>
<%@page import="Modelo.Reporte" %>

<%
    Reporte reporte = (Reporte) request.getAttribute("reporteDocente");
    
    String docenteEncargado = "No especificado";
    String integrantes = "No especificados";
    String usoGlobal = "0";
    String promedioUsos = "0.0";
    String iaMasUsada = "N/A";
    String iaMenosUsada = "N/A";
    String rankingParticipacion = "Sin datos";
    String aporteIndividual = "Sin datos";
    String herramientaFavorita = "Sin datos";

    if (reporte != null && reporte.getContenido() != null) {
        String contenido = reporte.getContenido();
        String[] lineas = contenido.split("\n");
        for (String linea : lineas) {
            if (linea.contains("Docente Encargado:")) docenteEncargado = linea.replace("Docente Encargado:", "").trim();
            if (linea.contains("Integrantes:")) integrantes = linea.replace("Integrantes:", "").trim();
            if (linea.contains("Uso Global de IA:")) usoGlobal = linea.replace("Uso Global de IA:", "").trim();
            if (linea.contains("Promedio de Usos:")) promedioUsos = linea.replace("Promedio de Usos:", "").trim();
            if (linea.contains("IA Mas Usada:")) iaMasUsada = linea.replace("IA Mas Usada:", "").trim();
            if (linea.contains("IA Menos Usada:")) iaMenosUsada = linea.replace("IA Menos Usada:", "").trim();
            if (linea.contains("Ranking Participacion:")) rankingParticipacion = linea.replace("Ranking Participacion:", "").trim();
            if (linea.contains("Aporte Individual:")) aporteIndividual = linea.replace("Aporte Individual:", "").trim();
            if (linea.contains("Herramienta Favorita:")) herramientaFavorita = linea.replace("Herramienta Favorita:", "").trim();
        }
    }
%>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            
            <!-- Encabezado Principal -->
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4 bg-white">
                <div class="card-body p-4 p-md-5 d-flex flex-wrap justify-content-between align-items-center gap-3 bg-gradient bg-primary bg-opacity-10">
                    <div>
                        <span class="badge bg-primary text-white px-3 py-2 rounded-pill mb-2 fw-semibold">Informe Analítico Oficial</span>
                        <h2 class="fw-bold text-dark mb-1"><%= (reporte != null) ? reporte.getNombreReporte() : "Informe General" %></h2>
                        <p class="text-secondary small mb-0"><i class="bi bi-shield-check me-1"></i> Sistema de Monitoreo TrackerEdu IA</p>
                    </div>
                    <div class="d-flex gap-2 flex-wrap">
                        <% if (reporte != null) { 
                            String nombreGrupoReporte = reporte.getNombreReporte().replace("Informe General -", "").trim();
                        %>
                        <a href="ServletReportes?accion=exportarCSV&grupo=<%= nombreGrupoReporte %>" class="btn btn-success rounded-pill px-4 fw-semibold text-decoration-none shadow-sm text-white">
                            <i class="bi bi-file-earmark-spreadsheet me-1"></i>Exportar a CSV
                        </a>
                        <% } %>
                        <a href="docenteUsuario.jsp" class="btn btn-dark rounded-pill px-4 fw-semibold shadow-sm text-decoration-none">
                            <i class="bi bi-arrow-left me-2"></i>Volver al Panel
                        </a>
                    </div>
                </div>
            </div>

            <% if (reporte != null) { %>
                <!-- Fila 1: Estructura del Grupo y Métricas Globales -->
                <div class="row g-4 mb-4">
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm rounded-4 h-100 p-4 bg-white">
                            <h5 class="fw-bold text-dark mb-3 d-flex align-items-center gap-2">
                                <i class="bi bi-people-fill text-primary"></i> Datos del Grupo
                            </h5>
                            <div class="mb-3 p-3 bg-light rounded-3 border">
                                <span class="small text-muted d-block fw-semibold text-uppercase" style="font-size: 0.75rem;">Docente Encargado</span>
                                <span class="fw-bold text-dark fs-6"><%= docenteEncargado %></span>
                            </div>
                            <div class="p-3 bg-light rounded-3 border">
                                <span class="small text-muted d-block fw-semibold text-uppercase" style="font-size: 0.75rem;">Estudiantes Integrantes</span>
                                <span class="fw-semibold text-secondary"><%= integrantes %></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm rounded-4 h-100 p-4 bg-white">
                            <h5 class="fw-bold text-dark mb-3 d-flex align-items-center gap-2">
                                <i class="bi bi-bar-chart-fill text-success"></i> Rendimiento Global
                            </h5>
                            <div class="row g-3 mb-3">
                                <div class="col-6">
                                    <div class="p-3 bg-success bg-opacity-10 rounded-3 text-center border border-success border-opacity-25">
                                        <span class="small text-success fw-bold d-block">Uso Global</span>
                                        <h3 class="fw-bold text-success mb-0"><%= usoGlobal %></h3>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="p-3 bg-info bg-opacity-10 rounded-3 text-center border border-info border-opacity-25">
                                        <span class="small text-info fw-bold d-block">Promedio / IA</span>
                                        <h3 class="fw-bold text-info mb-0"><%= promedioUsos %></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="p-2 bg-light rounded-3 text-center small text-secondary border">
                                <span class="text-dark fw-semibold">Más usada:</span> <%= iaMasUsada %> &nbsp;|&nbsp; <span class="text-dark fw-semibold">Menos usada:</span> <%= iaMenosUsada %>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Fila 2: Análisis Individual Organizado -->
                <div class="card border-0 shadow-sm rounded-4 p-4 bg-white mb-4">
                    <h5 class="fw-bold text-dark mb-4 d-flex align-items-center gap-2">
                        <i class="bi bi-person-lines-fill text-info"></i> Análisis Detallado por Integrante
                    </h5>
                    
                    <div class="row g-4">
                        <!-- Ranking -->
                        <div class="col-12">
                            <div class="p-3 bg-light rounded-3 border">
                                <span class="small text-muted d-block fw-semibold mb-2 text-uppercase" style="font-size: 0.75rem;">
                                    <i class="bi bi-trophy text-warning me-1"></i> Ranking de Participación
                                </span>
                                <div class="fw-bold text-dark fs-6 bg-white p-3 rounded-2 border">
                                    <%= rankingParticipacion %>
                                </div>
                            </div>
                        </div>

                        <!-- Porcentaje de Aporte Individual -->
                        <div class="col-md-6">
                            <div class="p-3 bg-light rounded-3 border h-100">
                                <span class="small text-muted d-block fw-semibold mb-2 text-uppercase" style="font-size: 0.75rem;">
                                    <i class="bi bi-pie-chart text-primary me-1"></i> Porcentaje de Aporte Individual
                                </span>
                                <div class="fw-semibold text-dark bg-white p-3 rounded-2 border h-100">
                                    <%= aporteIndividual %>
                                </div>
                            </div>
                        </div>

                        <!-- Herramienta Favorita -->
                        <div class="col-md-6">
                            <div class="p-3 bg-light rounded-3 border h-100">
                                <span class="small text-muted d-block fw-semibold mb-2 text-uppercase" style="font-size: 0.75rem;">
                                    <i class="bi bi-star text-warning me-1"></i> Herramienta Favorita por Integrante
                                </span>
                                <div class="fw-semibold text-dark bg-white p-3 rounded-2 border h-100">
                                    <%= herramientaFavorita %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <% } else { %>
                <div class="card border-0 shadow-sm rounded-4 p-5 text-center bg-white">
                    <div class="py-4">
                        <i class="bi bi-folder-x display-1 text-muted mb-3"></i>
                        <h4 class="fw-bold text-dark">Informe no disponible</h4>
                        <p class="text-muted">El administrador aún no ha generado el reporte automático para este grupo en el sistema.</p>
                        <a href="docenteUsuario.jsp" class="btn btn-primary rounded-pill px-4 mt-2">Regresar al Panel</a>
                    </div>
                </div>
            <% } %>

        </div>
    </div>
</div>

<%@include file="lib/footer.jsp" %>