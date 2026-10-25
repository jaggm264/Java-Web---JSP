<%@include file="lib/header.jsp" %>
<%@page import="Modelo.Docente" %>
<%@page import="Modelo.Usuario" %>
<%@page import="Modelo.gestionarGrupo" %>
<%@page import="Modelo.Grupo" %>
<%@page import="Modelo.gestionarAI" %>
<%@page import="Modelo.HerramientaAI" %>
<%@page import="java.util.ArrayList" %>

<%
    Usuario usuarioSesion = (Usuario) session.getAttribute("usuarioLogueado");
    Docente docente = null;
    String nombreDocente = "Profesor";
    
    if (usuarioSesion instanceof Docente) {
        docente = (Docente) usuarioSesion;
        nombreDocente = docente.getNombre();
    } else if (usuarioSesion != null) {
        nombreDocente = usuarioSesion.getNombre();
    }

    gestionarGrupo gestorGDocente = (gestionarGrupo) application.getAttribute("gestorGrupoInstance");
    Grupo grupoDocente = null;
    if (gestorGDocente != null && docente != null) {
        for (Grupo g : gestorGDocente.obtenerTodosLosGrupos()) {
            if (g.getNombreDocente() != null && g.getNombreDocente().equalsIgnoreCase(docente.getNombre())) {
                grupoDocente = g;
                break;
            }
        }
    }
    String nombreGrupoDocente = (grupoDocente != null) ? grupoDocente.getNombreGrupo() : "Sin asignar";
    String int1 = (grupoDocente != null && grupoDocente.getIntegrante1() != null && !grupoDocente.getIntegrante1().isEmpty()) ? grupoDocente.getIntegrante1() : "Por definir";
    String int2 = (grupoDocente != null && grupoDocente.getIntegrante2() != null && !grupoDocente.getIntegrante2().isEmpty()) ? grupoDocente.getIntegrante2() : "Por definir";
    String int3 = (grupoDocente != null && grupoDocente.getIntegrante3() != null && !grupoDocente.getIntegrante3().isEmpty()) ? grupoDocente.getIntegrante3() : "Por definir";
    String int4 = (grupoDocente != null && grupoDocente.getIntegrante4() != null && !grupoDocente.getIntegrante4().isEmpty()) ? grupoDocente.getIntegrante4() : "Por definir";

    // Gestión de IAs para las barras de progreso dinámicas
    gestionarAI gestorAIDocente = (gestionarAI) application.getAttribute("gestorAIInstance");
    if (gestorAIDocente == null) {
        gestorAIDocente = new gestionarAI();
        application.setAttribute("gestorAIInstance", gestorAIDocente);
    }
    ArrayList<HerramientaAI> listaIAsDocente = gestorAIDocente.obtenerTodasLasHerramientas();
    
    int totalUsosIAsDocente = 0;
    if (listaIAsDocente != null) {
        for (HerramientaAI h : listaIAsDocente) {
            totalUsosIAsDocente += h.getUsos();
        }
    }
%>

<div class="container my-5">

    <div class="text-center mb-4">
        <h1 class="fw-bold">Panel de Docente: <%= nombreDocente %></h1>
        <p class="fs-5 text-secondary">
            Grupo Asignado: <span class="fw-semibold text-dark"><%= nombreGrupoDocente %></span>
        </p>
    </div>
    <div class="row justify-content-center mb-4">
        <div class="col-12 col-lg-10">
            <img src="imagenes/banner-docente.jpg" alt="Banner de docente" class="w-100 rounded-4 shadow-sm img-fluid" style="max-height: 280px; object-fit: cover;">
        </div>
    </div>
    <div class="row justify-content-center g-4">

        <div class="col-12 col-md-6 col-lg-5">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4 d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="fw-bold mb-4 text-center text-dark">Integrantes del grupo</h5>

                        <div class="d-flex flex-column gap-3">
                            <div class="p-3 border-0 bg-light rounded-3 d-flex align-items-center gap-3">
                                <img src="imagenes/icon-user.png" alt="Integrante 1" width="36" height="36" class="rounded-2 object-fit-cover">
                                <strong class="text-secondary">Integrante 1: <span class="text-muted fw-normal"><%= int1 %></span></strong>
                            </div>
                            <div class="p-3 border-0 bg-light rounded-3 d-flex align-items-center gap-3">
                                <img src="imagenes/icon-user.png" alt="Integrante 2" width="36" height="36" class="rounded-2 object-fit-cover">
                                <strong class="text-secondary">Integrante 2: <span class="text-muted fw-normal"><%= int2 %></span></strong>
                            </div>
                            <div class="p-3 border-0 bg-light rounded-3 d-flex align-items-center gap-3">
                                <img src="imagenes/icon-user.png" alt="Integrante 3" width="36" height="36" class="rounded-2 object-fit-cover">
                                <strong class="text-secondary">Integrante 3: <span class="text-muted fw-normal"><%= int3 %></span></strong>
                            </div>
                            <div class="p-3 border-0 bg-light rounded-3 d-flex align-items-center gap-3">
                                <img src="imagenes/icon-user.png" alt="Integrante 4" width="36" height="36" class="rounded-2 object-fit-cover">
                                <strong class="text-secondary">Integrante 4: <span class="text-muted fw-normal"><%= int4 %></span></strong>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-5">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4 d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="fw-bold mb-4 text-center text-dark">Uso de IA del grupo</h5>

                        <%
                            if (listaIAsDocente != null && !listaIAsDocente.isEmpty()) {
                                for (HerramientaAI ia : listaIAsDocente) {
                                    int usosIa = ia.getUsos();
                                    int porcentaje = (totalUsosIAsDocente > 0) ? (usosIa * 100) / totalUsosIAsDocente : 0;
                        %>
                        <div class="mb-3 d-flex align-items-center gap-3">
                            <span class="fw-semibold text-secondary" style="width: 100px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" title="<%= ia.getNombreAI() %>"><%= ia.getNombreAI() %>:</span>
                            <div class="progress flex-grow-1 bg-light border" style="height: 14px; border-radius: 10px;">
                                <div class="progress-bar bg-primary rounded-pill" role="progressbar" style="width: <%= porcentaje %>%;"></div>
                            </div>
                            <span class="small text-muted fw-semibold" style="width: 75px; text-align: right;"><%= usosIa %> (<%= porcentaje %>%)</span>
                        </div>
                        <% 
                                }
                            } else { 
                        %>
                            <p class="text-muted small text-center">No hay herramientas de IA registradas en el sistema.</p>
                        <% } %>

                    </div>

                    <div class="text-center pt-3 border-top mt-3">
                        <h6 class="fw-bold text-secondary mb-2">Informe de IA:</h6>
                        <a href="#" class="btn btn-outline-primary fw-bold px-4 rounded-pill shadow-sm">Ver Informe General</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-5 text-start">
        <a href="login.jsp" class="btn btn-outline-danger fw-bold px-4 rounded-pill shadow-sm">SALIR</a>
    </div>
</div>

<%@include file="lib/footer.jsp" %>