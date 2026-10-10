<%@include file="lib/header.jsp" %>

<div class="container-fluid py-4 pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-primary text-white py-3 rounded-top-4 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-pencil-square me-2"></i>Editar / Eliminar Reporte</h5>
                    <span class="badge bg-light text-dark px-3 py-2 rounded-pill">ID: 101</span>
                </div>
                <div class="card-body p-4">
                    <form action="ReporteServlet" method="POST">
                        <input type="hidden" name="idReporte" value="101">
                        
                        <div class="mb-3">
                            <label for="nombreReporte" class="form-label fw-semibold">Nombre del Reporte</label>
                            <input type="text" class="form-control" id="nombreReporte" name="nombreReporte" value="Reporte - Equipo 1" required>
                        </div>
                        <div class="mb-3">
                            <label for="contenido" class="form-label fw-semibold">Contenido / Detalles</label>
                            <textarea class="form-control" id="contenido" name="contenido" rows="4" required>Detalles del reporte del equipo 1...</textarea>
                        </div>
                        <div class="d-grid mb-3 mt-4">
                            <button type="submit" name="accion" value="actualizar" class="btn btn-primary rounded-pill py-2 fw-bold shadow-sm">
                                Actualizar Reporte
                            </button>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <button type="submit" name="accion" value="eliminar" class="btn btn-outline-danger rounded-pill px-4 text-nowrap w-auto" style="width: auto !important; background-color: #dc3545 !important; border-color: #dc3545 !important;" onclick="return confirm('¿Estás seguro de que deseas eliminar este reporte?');">
                                <i class="bi bi-trash me-1"></i>Eliminar Reporte
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