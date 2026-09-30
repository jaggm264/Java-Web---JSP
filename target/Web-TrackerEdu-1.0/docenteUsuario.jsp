<%@include file="lib/header.jsp" %>

<div class="container my-5">

    <div class="text-center mb-5">
        <h1 class="fw-bold">Panel de Docente: Profesor</h1>
        <p class="fs-5 text-secondary">
            Grupo Asignado: <span class="fw-semibold text-dark">Sin asignar</span>
        </p>
    </div>

    <div class="row justify-content-center g-4">

        <div class="col-md-5">
            <div class="card shadow-sm h-100">
                <div class="card-body p-4">
                    <h5 class="fw-bold mb-4 text-center">Integrantes del grupo</h5>

                    <div class="d-flex flex-column gap-3">
                        <div class="p-2 border rounded bg-light">
                            <strong>Integrante 1:</strong>
                        </div>
                        <div class="p-2 border rounded bg-light">
                            <strong>Integrante 2:</strong>
                        </div>
                        <div class="p-2 border rounded bg-light">
                            <strong>Integrante 3:</strong>
                        </div>
                        <div class="p-2 border rounded bg-light">
                            <strong>Integrante 4:</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="card shadow-sm h-100">
                <div class="card-body p-4">
                    <h5 class="fw-bold mb-4 text-center">Uso de IA del grupo</h5>

                    <div class="mb-3 d-flex align-items-center gap-2">
                        <span class="fw-semibold" style="width: 90px;">Gemini:</span>
                        <div class="progress flex-grow-1" style="height: 20px;">
                            <div class="progress-bar bg-secondary" role="progressbar" style="width: 0%;"></div>
                        </div>
                    </div>

                    <div class="mb-3 d-flex align-items-center gap-2">
                        <span class="fw-semibold" style="width: 90px;">ChatGPT:</span>
                        <div class="progress flex-grow-1" style="height: 20px;">
                            <div class="progress-bar bg-secondary" role="progressbar" style="width: 0%;"></div>
                        </div>
                    </div>

                    <div class="mb-3 d-flex align-items-center gap-2">
                        <span class="fw-semibold" style="width: 90px;">Claude:</span>
                        <div class="progress flex-grow-1" style="height: 20px;">
                            <div class="progress-bar bg-secondary" role="progressbar" style="width: 0%;"></div>
                        </div>
                    </div>

                    <div class="mb-4 d-flex align-items-center gap-2">
                        <span class="fw-semibold" style="width: 90px;">Deepseek:</span>
                        <div class="progress flex-grow-1" style="height: 20px;">
                            <div class="progress-bar bg-secondary" role="progressbar" style="width: 0%;"></div>
                        </div>
                    </div>

                    <div class="text-center pt-3 border-top">
                        <h6 class="fw-bold text-secondary mb-2">Informe de IA:</h6>
                        <a href="#" class="btn btn-outline-primary fw-bold px-4">Ver Informe General</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="mt-5 text-start">
        <a href="login.jsp" class="btn btn-outline-danger fw-bold px-4">SALIR</a>
    </div>

</div>

<%@include file="lib/footer.jsp" %>