<%@include file="lib/header.jsp" %>

<div class="container my-5">

    <div class="text-center mb-4">
        <h1 class="fw-bold">Bienvenid@ estudiante</h1>
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
                    <h3 class="fw-bold text-primary mb-0">4</h3>
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
                    <h3 class="fw-bold text-info mb-0">0</h3>
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

    <div class="row g-4 justify-content-center align-items-start mb-5">
        
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-3 text-center bg-white d-flex flex-column align-items-center justify-content-between">
                <div class="w-100">
                    <img src="imagenes/ChatGPT-Logo.svg.png" alt="ChatGPT" class="img-fluid mb-3" width="60" height="60">
                    <h5 class="fw-bold text-dark">ChatGPT</h5>
                    <span class="badge bg-light text-dark border rounded-pill px-3 py-1 mb-2 small">
                        Usos: <strong class="text-primary">0</strong>
                    </span>
                </div>
                
                <div class="w-100 mt-2">
                    <button class="btn btn-outline-primary btn-sm rounded-pill w-100 mb-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapseChatGPT" aria-expanded="false" aria-controls="collapseChatGPT">
                        Ver información
                    </button>
                    
                    <div class="collapse" id="collapseChatGPT">
                        <p class="small text-muted mb-3">Excelente para redacción, generación de ideas, estructuración de textos y explicación paso a paso de conceptos.</p>
                        <a href="https://chatgpt.com" target="_blank" class="btn btn-dark text-warning fw-bold w-100 rounded-3">USAR</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-3 text-center bg-white d-flex flex-column align-items-center justify-content-between">
                <div class="w-100">
                    <img src="imagenes/gemini-icon.png" alt="Gemini" class="img-fluid mb-3" width="60" height="60">
                    <h5 class="fw-bold text-dark">Gemini</h5>
                    <span class="badge bg-light text-dark border rounded-pill px-3 py-1 mb-2 small">
                        Usos: <strong class="text-primary">0</strong>
                    </span>
                </div>
                
                <div class="w-100 mt-2">
                    <button class="btn btn-outline-primary btn-sm rounded-pill w-100 mb-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGemini" aria-expanded="false" aria-controls="collapseGemini">
                        Ver información
                    </button>
                    
                    <div class="collapse" id="collapseGemini">
                        <p class="small text-muted mb-3">Ideal para búsquedas en tiempo real, análisis de imágenes y conexión directa con el ecosistema de Google.</p>
                        <a href="https://gemini.google.com" target="_blank" class="btn btn-dark text-warning fw-bold w-100 rounded-3">USAR</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-3 text-center bg-white d-flex flex-column align-items-center justify-content-between">
                <div class="w-100">
                    <img src="imagenes/free-deepseek-icon-svg-download-png-.png" alt="DeepSeek" class="img-fluid mb-3" width="60" height="60">
                    <h5 class="fw-bold text-dark">DeepSeek</h5>
                    <span class="badge bg-light text-dark border rounded-pill px-3 py-1 mb-2 small">
                        Usos: <strong class="text-primary">0</strong>
                    </span>
                </div>
                
                <div class="w-100 mt-2">
                    <button class="btn btn-outline-primary btn-sm rounded-pill w-100 mb-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDeepSeek" aria-expanded="false" aria-controls="collapseDeepSeek">
                        Ver información
                    </button>
                    
                    <div class="collapse" id="collapseDeepSeek">
                        <p class="small text-muted mb-3">Potente en razonamiento lógico avanzado, resolución de matemáticas y optimización de código de programación.</p>
                        <a href="https://chat.deepseek.com" target="_blank" class="btn btn-dark text-warning fw-bold w-100 rounded-3">USAR</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-3 text-center bg-white d-flex flex-column align-items-center justify-content-between">
                <div class="w-100">
                    <img src="imagenes/notebooklm-icon.png" alt="NotebookLM" class="img-fluid mb-3" width="60" height="60">
                    <h5 class="fw-bold text-dark">NotebookLM</h5>
                    <span class="badge bg-light text-dark border rounded-pill px-3 py-1 mb-2 small">
                        Usos: <strong class="text-primary">0</strong>
                    </span>
                </div>
                
                <div class="w-100 mt-2">
                    <button class="btn btn-outline-primary btn-sm rounded-pill w-100 mb-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNotebook" aria-expanded="false" aria-controls="collapseNotebook">
                        Ver información
                    </button>
                    
                    <div class="collapse" id="collapseNotebook">
                        <p class="small text-muted mb-3">Interactúa directamente con tus propios documentos, PDFs y notas de estudio sin riesgo de alucinaciones.</p>
                        <a href="https://notebooklm.google.com" target="_blank" class="btn btn-dark text-warning fw-bold w-100 rounded-3">USAR</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div>
        <p class="text-center fw-bold fs-5 mb-0 text-dark">Recuerda usar las IAs de manera adecuada!</p>
    </div>

    <div class="d-flex justify-content-start align-items-center mt-4">
        <a href="login.jsp" class="btn btn-outline-danger fw-bold px-4 rounded-pill">SALIR</a>
    </div>

</div>

<%@include file="lib/footer.jsp" %>