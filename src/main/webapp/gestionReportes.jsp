<%@include file="lib/header.jsp" %>

<div class="container my-5">
    
    <div class="text-center mb-5">
        <h1 class="fw-bold text-dark">Gestión de Reportes</h1>
        <p class="fs-5 text-secondary">Administración de reportes y estadísticas</p>
    </div>

    <div class="row justify-content-center">
        <div class="col-12 col-lg-8">
            <div class="card shadow-sm border-0 rounded-4 p-4 bg-white">
                
                <div class="d-flex flex-wrap justify-content-center gap-3 mb-5 mt-3">
                    <a href="crearReporte.jsp" class="btn btn-success fw-bold px-4 rounded-pill">Generar reporte</a>
                    <a href="modificarReporte.jsp" class="btn btn-warning fw-bold px-4 rounded-pill text-dark">Modificar reporte</a>
                    <a href="eliminarReporte.jsp" class="btn btn-danger fw-bold px-4 rounded-pill">Eliminar reporte</a>
                </div>

                <div class="text-start mb-2">
                    <h5 class="fw-bold text-secondary mb-3">Reportes generados:</h5>
                    <div class="border rounded-3 p-5 text-center text-muted bg-light">No hay reportes para mostrar</div>

                </div>
                
            </div>
        </div>
    </div>

    <div class="mt-5 text-start">
        <a href="adminUsuario.jsp" class="btn btn-outline-secondary fw-bold px-4 rounded-pill">Volver al Panel</a>
    </div>

</div>

<%@include file="lib/footer.jsp" %>