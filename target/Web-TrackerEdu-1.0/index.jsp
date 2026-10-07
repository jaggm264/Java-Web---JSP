<%@include file="lib/header2.jsp" %>

    <main class="container mb-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold text-primary">¿Por qué utilizar TrackerEdu?</h2>
            <p class="text-muted">Diseñado para apoyar a estudiantes y docentes en el análisis y apropiación responsable de la Inteligencia Artificial.</p>
        </div>

        <div class="row g-4 mb-5 justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card h-100 border-0 shadow-sm rounded-4 p-3 text-center">
                    <div class="card-body d-flex flex-column align-items-center">
                        <div class="p-3 bg-primary-subtle text-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3">
                            <i class="fa-solid fa-pen-to-square fs-2"></i>
                        </div>
                        <h5 class="card-title fw-bold">Registro de Actividad</h5>
                        <p class="card-text text-muted small">Documenta tus consultas, proyectos y promts utilizados en tus actividades de estudio.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="card h-100 border-0 shadow-sm rounded-4 p-3 text-center">
                    <div class="card-body d-flex flex-column align-items-center">
                        <div class="p-3 bg-warning-subtle text-warning rounded-circle d-inline-flex align-items-center justify-content-center mb-3">
                            <i class="fa-solid fa-robot fs-2"></i>
                        </div>
                        <h5 class="card-title fw-bold">Multi-Herramientas</h5>
                        <p class="card-text text-muted small">Compara y gestiona tus interacciones con ChatGPT, Gemini, DeepSeek y NotebookLM.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="card h-100 border-0 shadow-sm rounded-4 p-3 text-center">
                    <div class="card-body d-flex flex-column align-items-center">
                        <div class="p-3 bg-info-subtle text-info rounded-circle d-inline-flex align-items-center justify-content-center mb-3">
                            <i class="fa-solid fa-shield-halved fs-2"></i>
                        </div>
                        <h5 class="card-title fw-bold">Uso Ético y Guiado</h5>
                        <p class="card-text text-muted small">Fomenta el uso transparente de la IA como complemento y tutor en tu proceso académico.</p>
                    </div>
                </div>
            </div>
        </div>

        <section class="bg-white p-4 p-lg-5 rounded-4 shadow-sm mb-5">
            <div class="row align-items-center g-4">
                <div class="col-lg-6 text-center">
                    <img src="imagenes/estudio.jpg"alt="Estudio" class="img-fluid rounded-3 shadow border">
                </div>
                
                <div class="col-lg-6 text-center d-flex flex-column align-items-center">
                    <span class="badge bg-success-subtle text-success mb-2 px-3 py-2 rounded-pill fw-bold">Analíticas en Tiempo Real</span>
                    <h2 class="fw-bold mb-3">Visualiza tu Impacto y Horas de Estudio</h2>
                    <p class="text-muted mb-4">Nuestra plataforma genera reportes detallados que clasifican el tipo de tarea realizada (programación, cálculo, redacción o investigación) y miden tu productividad.</p>
                    <ol class="list-unstyled d-flex flex-column align-items-center gap-2 mb-4 text-center">
                        <li class="d-flex align-items-center gap-2">
                            <span class="badge bg-primary rounded-circle">1</span> Granularidad por tipo de IA empleada.
                        </li>
                        <li class="d-flex align-items-center gap-2">
                            <span class="badge bg-primary rounded-circle">2</span> Reportes exportables para docentes.
                        </li>
                        <li class="d-flex align-items-center gap-2">
                            <span class="badge bg-primary rounded-circle">3</span> Control de frecuencias y patrones de uso.
                        </li>
                    </ol>
                    
                    <a href="IAs_index.jsp" class="btn btn-primary rounded-pill px-4">Conocer más sobre las IAs</a>
                </div>
            </div>
        </section>
    </main>
<%@include file="lib/footer.jsp" %>
