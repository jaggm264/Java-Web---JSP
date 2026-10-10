<%@include file="lib/header.jsp" %>

<div class="container-fluid py-4 pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-danger text-white py-3 rounded-top-4">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-file-earmark-plus me-2"></i>Registrar Nuevo Reporte</h5>
                </div>
                <div class="card-body p-4">
                    <form action="ReporteServlet" method="POST">
                        <input type="hidden" name="accion" value="crear">
                        
                        <div class="mb-3">
                            <label for="nombreReporte" class="form-label fw-semibold">Nombre del Reporte</label>
                            <input type="text" class="form-control" id="nombreReporte" name="nombreReporte" placeholder="Ej. Reporte - Equipo 1" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="contenido" class="form-label fw-semibold">Contenido / Detalles</label>
                            <textarea class="form-control" id="contenido" name="contenido" rows="4" placeholder="Escriba los detalles del reporte..." required></textarea>
                        </div>

                        <div class="d-flex flex-wrap gap-2">
                            <a href="adminUsuario.jsp" class="btn btn-secondary rounded-pill px-4">Cancelar</a>
                            <button type="submit" class="btn btn-danger rounded-pill px-4">Guardar Reporte</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp" %>