<%@include file="lib/header.jsp" %>
<%@page import="Modelo.Estudiante" %>
<%@page import="Modelo.Usuario" %>
<%@page import="Modelo.gestionarAI" %>
<%@page import="Modelo.HerramientaAI" %>
<%@page import="java.util.ArrayList" %>

<%
    Usuario usuarioSesion = (Usuario) session.getAttribute("usuarioLogueado");
    Estudiante estudiante = null;
    String nombreEstudiante = "estudiante";
    
    if (usuarioSesion instanceof Estudiante) {
        estudiante = (Estudiante) usuarioSesion;
        nombreEstudiante = estudiante.getNombre();
    } else if (usuarioSesion != null) {
        nombreEstudiante = usuarioSesion.getNombre();
    }

    gestionarAI gestorAIStudent = (gestionarAI) application.getAttribute("gestorAIInstance");
    if (gestorAIStudent == null) {
        gestorAIStudent = new gestionarAI();
        application.setAttribute("gestorAIInstance", gestorAIStudent);
    }
    ArrayList<HerramientaAI> listaIAsEstudiante = gestorAIStudent.obtenerTodasLasHerramientas();
    int totalIAs = (listaIAsEstudiante != null) ? listaIAsEstudiante.size() : 0;
    
    int totalUsosGlobal = 0;
    if (listaIAsEstudiante != null) {
        for (HerramientaAI h : listaIAsEstudiante) {
            totalUsosGlobal += h.getUsos();
        }
    }
%>

<div class="container my-5">

    <div class="text-center mb-4">
        <h1 class="fw-bold">Bienvenid@, <%= nombreEstudiante %></h1>
        <p class="fs-5 text-secondary">Querido estudiante, pertenece al grupo:</p>
    </div>
    
    <div class="mb-5">
        <img src="imagenes/banner-estudiante.jpg" alt="Banner del Estudiante" class="w-100 rounded-4 shadow-sm img-fluid" style="max-height: 280px; object-fit: cover;">
    </div>
    
    <div class="text-center mb-5">
        <h5 class="fw-bold text-secondary">IAs para guiar tu método de estudio</h5>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-12 col-md-4">
            <div class="card border-0 shadow-sm rounded-4 p-4 bg-white d-flex flex-row align-items-center justify-content-between">
                <div>
                    <p class="text-secondary small fw-medium mb-1">IAs Disponibles</p>
                    <h3 class="fw-bold text-primary mb-0"><%= totalIAs %></h3>
                </div>
                <div class="p-2 bg-primary bg-opacity-10 rounded-4">
                    <img src="imagenes/icon-ai.png" alt="IAs Disponibles" width="36" height="36" class="img-fluid">
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="card border-0 shadow-sm rounded-4 p-4 bg-white d-flex flex-row align-items-center justify-content-between">
                <div>
                    <p class="text-secondary small fw-medium mb-1">Usos Totales Registrados</p>
                    <h3 class="fw-bold text-info mb-0"><%= totalUsosGlobal %></h3>
                </div>
                <div class="p-2 bg-info bg-opacity-10 rounded-4">
                    <img src="imagenes/icon-uses.png" alt="Usos Totales" width="36" height="36" class="img-fluid">
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="card border-0 shadow-sm rounded-4 p-4 bg-white d-flex flex-row align-items-center justify-content-between">
                <div>
                    <p class="text-secondary small fw-medium mb-1">Estado del Sistema</p>
                    <h5 class="fw-bold text-success mb-0 d-flex align-items-center gap-2 mt-1">
                        <span class="spinner-grow spinner-grow-sm text-success" role="status"></span> Activo
                    </h5>
                </div>
                <div class="p-2 bg-success bg-opacity-10 rounded-4">
                    <img src="imagenes/icont-status.png" alt="Estado del Sistema" width="36" height="36" class="img-fluid">
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 justify-content-center align-items-stretch mb-5">
        <%
            if (listaIAsEstudiante != null && !listaIAsEstudiante.isEmpty()) {
                for (HerramientaAI ia : listaIAsEstudiante) {
                    String imgPath = (ia.getImagen() != null && !ia.getImagen().isEmpty()) ? "imagenes/" + ia.getImagen() : "imagenes/icon-ai.png";
        %>
        <div class="col-12 col-sm-6 col-lg-3 d-flex align-items-stretch">
            <div class="card border-0 shadow-sm rounded-4 p-4 text-center bg-white d-flex flex-column justify-content-between h-100 w-100">
                
                <div>
                    <img src="<%= imgPath %>" alt="<%= ia.getNombreAI() %>" class="img-fluid mb-3 object-fit-contain" width="64" height="64">
                    <h5 class="fw-bold text-dark mb-2"><%= ia.getNombreAI() %></h5>
                    <span class="badge bg-light text-dark border rounded-pill px-3 py-1 mb-3 small">
                        Usos: <strong class="text-primary"><%= ia.getUsos() %></strong>
                    </span>
                </div>
                
                <div class="bg-light p-3 rounded-3 mb-3 text-start">
                    <p class="small text-secondary mb-1"><strong>Enfoque:</strong> <%= ia.getNombreCompetencia() %></p>
                    <p class="small text-secondary mb-0"><strong>Nivel:</strong> <%= ia.getDescripcionNivel() %></p>
                </div>

                <div>
                    <% if (ia.getUrl() != null && !ia.getUrl().isEmpty()) { %>
                        <a href="ServletHerramientaIA?accion=usar&id=<%= ia.getIdHerramienta() %>" 
                           target="_blank" 
                           onclick="actualizarContadorEnVivo()" 
                           class="btn btn-dark text-warning fw-bold w-100 rounded-pill py-2 shadow-sm">
                           USAR
                        </a>
                    <% } %>
                </div>

            </div>
        </div>
        <% 
                }
            } else { 
        %>
            <div class="col-12 text-center py-4">
                <p class="text-muted fw-semibold">No hay herramientas de IA disponibles en este momento.</p>
            </div>
        <% } %>
    </div>

    <div>
        <p class="text-center fw-bold fs-5 mb-0 text-dark">Recuerda usar las IAs de manera adecuada!</p>
    </div>

</div>

<script>
    function actualizarContadorEnVivo() {
        setTimeout(function() {
            location.reload();
        }, 400);
    }
</script>

<%@include file="lib/footer.jsp" %>