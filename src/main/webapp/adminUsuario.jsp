<%@include file="lib/header.jsp" %>

<div class="container my-5">

    <div class="text-center mb-5">
        <h1 class="fw-bold">Panel de administrador</h1>
        <p class="fs-5 text-secondary">
            ¿Qué desea hacer hoy, Administrador?
        </p>
    </div>

    <div class="row justify-content-center g-4">

        <div class="col-md-5">

            <div class="card shadow-sm h-100">

                <div class="card-body text-center">
                    <h3 class="fw-bold mb-4">Gestion de grupos</h3>
                    <p class="text-muted mb-4">Administre los grupos creados</p>

                    <div class="d-flex justify-content-center gap-2 mb-4">
                        <a href="#" class="btn btn-outline-success fw-bold">Crear grupo</a>
                        <a href="#" class="btn btn-outline-danger fw-bold">Eliminar grupo</a>
                    </div>

                    <div class="text-start mb-4">
                        <h6 class="fw-bold text-secondary">Grupos creados</h6>
                        <div class="border rounded p-3 text-muted">
                            No hay grupos para mostrar</div>
                    </div>

                    <a href="#" class="btn btn-outline-dark fw-bold w-100">Cambiar y verificar grupos</a>
                </div>

            </div>

        </div>

        <div class="col-md-5">

            <div class="card shadow-sm h-100">

                <div class="card-body text-center">
                    <h3 class="fw-bold mb-4">Gestion de reportes</h3>
                    <p class="text-muted mb-4">Administre los reportes creados </p>

                    <div class="d-flex justify-content-center gap-2 mb-4">
                        <a href="#" class="btn btn-outline-success fw-bold">Crear reporte</a>
                        <a href="#" class="btn btn-outline-danger fw-bold">Eliminar reporte</a>
                    </div>

                    <div class="text-start mb-4">
                        <h6 class="fw-bold text-secondary">Reportes creado</h6>
                        <div class="border rounded p-3 text-muted">
                            No hay reportes para mostrar</div>
                    </div>

                    <a href="#" class="btn btn-outline-dark fw-bold w-100">Cambiar y verificar reportes</a>

                </div>

            </div>

        </div>

    </div>

    <div class="mt-5 text-start">
        <a href="login.jsp" class="btn btn-outline-danger fw-bold px-4">SALIR</a>
    </div>

</div>

<%@include file="lib/footer.jsp" %>