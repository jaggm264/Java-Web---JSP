<%@include file="lib/header.jsp" %>

<div class="container my-5">

    <div class="text-center mb-4">
        <h1 class="fw-bold">Panel de Docente: Profesor</h1>
        <p class="fs-5 text-secondary">
            Grupo Asignado: <span class="fw-semibold text-dark">Sin asignar</span>
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
                                <strong class="text-secondary">Integrante 1: <span class="text-muted fw-normal">Por definir</span></strong>
                            </div>
                            <div class="p-3 border-0 bg-light rounded-3 d-flex align-items-center gap-3">
                                <img src="imagenes/icon-user.png" alt="Integrante 2" width="36" height="36" class="rounded-2 object-fit-cover">
                                <strong class="text-secondary">Integrante 2: <span class="text-muted fw-normal">Por definir</span></strong>
                            </div>
                            <div class="p-3 border-0 bg-light rounded-3 d-flex align-items-center gap-3">
                                <img src="imagenes/icon-user.png" alt="Integrante 3" width="36" height="36" class="rounded-2 object-fit-cover">
                                <strong class="text-secondary">Integrante 3: <span class="text-muted fw-normal">Por definir</span></strong>
                            </div>
                            <div class="p-3 border-0 bg-light rounded-3 d-flex align-items-center gap-3">
                                <img src="imagenes/icon-user.png" alt="Integrante 4" width="36" height="36" class="rounded-2 object-fit-cover">
                                <strong class="text-secondary">Integrante 4: <span class="text-muted fw-normal">Por definir</span></strong>
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

                        <div class="mb-3 d-flex align-items-center gap-3">
                            <span class="fw-semibold text-secondary" style="width: 90px;">Gemini:</span>
                            <div class="progress flex-grow-1 bg-light border" style="height: 14px; border-radius: 10px;">
                                <div class="progress-bar bg-primary rounded-pill" role="progressbar" style="width: 0%;"></div>
                            </div>
                            <span class="small text-muted fw-semibold" style="width: 35px; text-align: right;">0%</span>
                        </div>

                        <div class="mb-3 d-flex align-items-center gap-3">
                            <span class="fw-semibold text-secondary" style="width: 90px;">ChatGPT:</span>
                            <div class="progress flex-grow-1 bg-light border" style="height: 14px; border-radius: 10px;">
                                <div class="progress-bar bg-success rounded-pill" role="progressbar" style="width: 0%;"></div>
                            </div>
                            <span class="small text-muted fw-semibold" style="width: 35px; text-align: right;">0%</span>
                        </div>

                        <div class="mb-3 d-flex align-items-center gap-3">
                            <span class="fw-semibold text-secondary" style="width: 90px;">Claude:</span>
                            <div class="progress flex-grow-1 bg-light border" style="height: 14px; border-radius: 10px;">
                                <div class="progress-bar bg-info rounded-pill" role="progressbar" style="width: 0%;"></div>
                            </div>
                            <span class="small text-muted fw-semibold" style="width: 35px; text-align: right;">0%</span>
                        </div>

                        <div class="mb-4 d-flex align-items-center gap-3">
                            <span class="fw-semibold text-secondary" style="width: 90px;">Deepseek:</span>
                            <div class="progress flex-grow-1 bg-light border" style="height: 14px; border-radius: 10px;">
                                <div class="progress-bar bg-dark rounded-pill" role="progressbar" style="width: 0%;"></div>
                            </div>
                            <span class="small text-muted fw-semibold" style="width: 35px; text-align: right;">0%</span>
                        </div>
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