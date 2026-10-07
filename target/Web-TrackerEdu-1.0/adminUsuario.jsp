<%@include file="lib/header.jsp" %>

<div class="container my-5">

    <div class="text-center mb-5">
        <h1 class="fw-bold">Panel de administrador</h1>
        <p class="fs-5 text-secondary">¿Qué desea hacer hoy, Administrador?</p>
    </div>

    <div class="row justify-content-center g-4">

        <div class="col-12 col-md-5">
            <a href="gestionGrupos.jsp" class="text-decoration-none">
                <div class="card shadow-sm border-0 rounded-4 h-100 bg-white text-center overflow-hidden">
                    
                        <img src="imagenes/gestionGrupos.jpg" class="card-img-top" height="500" alt="Gestión de grupos">

                    <div class="card-body d-flex flex-column justify-content-start align-items-center p-4">
                        <h2 class="fw-bold text-dark mb-3 mt-2">Gestión de grupos</h2>
                        <p class="text-muted mb-4 px-3">Administre, asigne y organice los grupos de estudiantes.</p>
                        <span class="btn btn-primary rounded-pill px-5 fw-bold">Ingresar</span>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-12 col-md-5">
            <a href="gestionReportes.jsp" class="text-decoration-none">
                <div class="card shadow-sm border-0 rounded-4 h-100 bg-white text-center overflow-hidden">
                    
                    <img src="imagenes/gestionReportes.jpg" class="card-img-top" height="500" alt="Gestión de reportes">

                    <div class="card-body d-flex flex-column justify-content-start align-items-center p-4">
                        <h2 class="fw-bold text-dark mb-3 mt-2">Gestión de reportes</h2>
                        <p class="text-muted mb-4 px-3">Supervise y analice los reportes de uso de inteligencia artificial.</p>
                        <span class="btn btn-primary rounded-pill px-5 fw-bold">Ingresar</span>
                    </div>
                </div>
            </a>
        </div>

    </div>

    <div class="mt-5 text-start">
        <a href="login.jsp" class="btn btn-outline-danger fw-bold px-4 rounded-pill">SALIR</a>
    </div>

</div>

<%@include file="lib/footer.jsp" %>