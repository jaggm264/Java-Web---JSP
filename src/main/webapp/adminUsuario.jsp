<%@include file="lib/header.jsp" %>

<div class="container-fluid py-4 pb-5">
    <div class="row g-4">

        <aside class="col-lg-3 col-xl-2">
            <div class="card shadow-sm sticky-lg-top border-0 rounded-4">
                <div class="card-body">
                    <p class="text-body-secondary small mb-2 fw-semibold">Secciones</p>
                    <div class="nav nav-pills flex-lg-column gap-2" id="menu" role="tablist">
                        <button class="nav-link active text-start rounded-pill px-3" data-bs-toggle="pill" data-bs-target="#reportes" type="button" role="tab">
                            <i class="bi bi-flag me-2"></i>Gestionar reportes
                        </button>
                        <button class="nav-link text-start rounded-pill px-3" data-bs-toggle="pill" data-bs-target="#usuarios" type="button" role="tab">
                            <i class="bi bi-people me-2"></i>Gestionar usuarios
                        </button>
                        <button class="nav-link text-start rounded-pill px-3" data-bs-toggle="pill" data-bs-target="#grupos" type="button" role="tab">
                            <i class="bi bi-diagram-3 me-2"></i>Gestionar grupos
                        </button>
                        <button class="nav-link text-start rounded-pill px-3" data-bs-toggle="pill" data-bs-target="#ias" type="button" role="tab">
                            <i class="bi bi-robot me-2"></i>Gestionar IAs
                        </button>
                    </div>
                </div>
            </div>
        </aside>

        <main class="col-lg-9 col-xl-10">
            <div class="tab-content">

                <section class="tab-pane fade show active" id="reportes" role="tabpanel">
                    <div class="card text-bg-dark border-0 shadow-sm mb-4 overflow-hidden rounded-4">
                        <div class="ratio ratio-21x9">
                            <img src="imagenes/gestionReportes.jpg" class="object-fit-cover opacity-50" alt="Reportes">
                        </div>
                        <div class="card-img-overlay d-flex flex-column justify-content-end p-4">
                            <h2 class="card-title fw-bold"><i class="bi bi-flag-fill text-danger me-2"></i>Gestionar reportes</h2>
                            <p class="card-text text-light">Revisa, prioriza y envia informes para todas las personas.</p>
                        </div>
                    </div>

                    <div class="row g-3 mb-4">
                        <div class="col-12">
                            <div class="card border-success border-2 text-center rounded-4 shadow-sm">
                                <div class="card-body">
                                    <i class="bi bi-file-earmark-text fs-2 text-danger"></i>
                                    <h3 class="mb-0 fw-bold">0</h3>
                                    <small class="text-body-secondary">Reportes Creados</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card shadow-sm border-0 rounded-4">
                        <div class="card-header bg-white py-3 d-flex flex-wrap justify-content-between align-items-center gap-2">
                            <h5 class="mb-0 fw-bold">Listado de reportes</h5>
                            <div>
                                <a href="nuevoReporte.jsp" class="btn btn-danger btn-sm rounded-pill px-3 text-decoration-none">
                                    <i class="bi bi-plus-lg me-1"></i>Nuevo reporte
                                </a>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>#</th>
                                        <th>Reporte</th>
                                        <th>Autor</th>
                                        <th>Uso de IA</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>101</td>
                                        <td>Reporte - Equipo 1</td>
                                        <td><img src="imagenes/icon-user.png" width="32" height="32" class="rounded-circle me-2 object-fit-cover" alt="Admin">Andrés Ruiz</td>
                                        <td><span class="badge text-bg-danger">Alta</span></td>
                                        <td><span class="badge text-bg-success">Enviado</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>

                <section class="tab-pane fade" id="usuarios" role="tabpanel">
                    <div class="card text-bg-dark border-0 shadow-sm mb-4 overflow-hidden rounded-4">
                        <div class="ratio ratio-21x9">
                            <img src="https://picsum.photos/seed/usuarios/1200/400" class="object-fit-cover opacity-50" alt="Usuarios">
                        </div>
                        <div class="card-img-overlay d-flex flex-column justify-content-end p-4">
                            <h2 class="card-title fw-bold"><i class="bi bi-people-fill text-info me-2"></i>Gestionar usuarios</h2>
                            <p class="card-text text-light">Crea cuentas, asigna roles y controla el acceso de cada persona.</p>
                        </div>
                    </div>

                    <div class="d-flex flex-wrap justify-content-between gap-2 mb-4">
                        <div class="input-group w-auto">
                            <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                            <input type="search" class="form-control" placeholder="Buscar usuario">
                        </div>
                        <a href="nuevoUsuario.jsp" class="btn btn-info text-white rounded-pill px-4 fw-bold text-decoration-none d-flex align-items-center">
                            <i class="bi bi-person-plus me-1"></i>Nuevo usuario
                        </a>
                    </div>

                    <div class="row g-4">
                        <!-- Único usuario de ejemplo (Administrador) -->
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm text-center border-0 rounded-4">
                                <div class="card-body p-4">
                                    <img src="imagenes/icon-user.png" class="rounded-circle border border-3 border-secondary mb-3 object-fit-cover" width="96" height="96" alt="Andrés Ruiz">
                                    <h5 class="mb-0 fw-bold">Andrés Ruiz</h5>
                                    <p class="text-body-secondary small mb-3">andres@correo.com</p>
                                    <div class="text-center">
                                        <span class="badge text-bg-dark px-3 py-2 rounded-pill">Administrador</span>
                                    </div>
                                </div>
                                <div class="card-footer bg-white border-0 pb-4 d-flex justify-content-center">
                                    <a href="#" class="btn btn-sm btn-outline-primary rounded-pill px-4"><i class="bi bi-pencil"></i> Editar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="tab-pane fade" id="grupos" role="tabpanel">
                    <div class="card text-bg-dark border-0 shadow-sm mb-4 overflow-hidden rounded-4">
                        <div class="ratio ratio-21x9">
                            <img src="imagenes/gestionGrupos.jpg" class="object-fit-cover opacity-50" alt="Grupos">
                        </div>
                        <div class="card-img-overlay d-flex flex-column justify-content-end p-4">
                            <h2 class="card-title fw-bold"><i class="bi bi-diagram-3-fill text-success me-2"></i>Gestionar grupos</h2>
                            <p class="card-text text-light">Organiza a las personas en equipos y define quién pertenece a cada uno.</p>
                        </div>
                    </div>

                    <div class="text-end mb-4">
                        <a href="crearGrupo.jsp" class="btn btn-success rounded-pill px-4 fw-bold text-decoration-none d-inline-flex align-items-center">
                            <i class="bi bi-plus-circle me-1"></i>Crear grupo
                        </a>
                    </div>

                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                                <img src="https://picsum.photos/seed/equipo1/600/260" class="card-img-top" alt="Equipo 1">
                                <div class="card-body p-4">
                                    <h5 class="card-title fw-bold mb-3">Equipo 1</h5>
                                    
                                    <!-- Docente encargado -->
                                    <div class="p-2 mb-3 bg-light rounded-3 d-flex align-items-center gap-2 border">
                                        <i class="bi bi-person-badge text-success fs-5"></i>
                                        <span class="small fw-semibold text-secondary">Docente encargado:</span>
                                        <span class="small text-dark fw-bold">Prof. Carlos Gómez</span>
                                    </div>

                                    <small class="text-muted fw-semibold">Capacidad: 1 docente + 4 estudiantes (0 de 4 inscritos)</small>
                                    <div class="progress mb-3 mt-1" style="height: 10px; border-radius: 5px;">
                                        <div class="progress-bar bg-success rounded-pill w-0" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>

                                    <button class="btn btn-sm btn-outline-success rounded-pill px-3" data-bs-toggle="collapse" data-bs-target="#miembrosEquipo1">Ver miembros</button>
                                    <div class="collapse mt-3" id="miembrosEquipo1">
                                        <ul class="list-group rounded-3">
                                            <li class="list-group-item d-flex justify-content-between align-items-center small text-muted">Sin estudiantes registrados aún</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-footer bg-white border-0 pb-4 px-4 d-flex justify-content-end">
                                    <button class="btn btn-sm btn-outline-danger rounded-pill px-3"><i class="bi bi-trash"></i> Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="tab-pane fade" id="ias" role="tabpanel">
                    <div class="card text-bg-dark border-0 shadow-sm mb-4 overflow-hidden rounded-4">
                        <div class="ratio ratio-21x9">
                            <img src="imagenes/gestionReportes.jpg" class="object-fit-cover opacity-50" alt="Inteligencias artificiales">
                        </div>
                        <div class="card-img-overlay d-flex flex-column justify-content-end p-4">
                            <h2 class="card-title fw-bold"><i class="bi bi-robot text-primary me-2"></i>Gestionar IAs</h2>
                            <p class="card-text text-light">Activa modelos, ajusta su comportamiento y vigila su rendimiento en el sistema.</p>
                        </div>
                    </div>

                    <div class="text-center mb-4">
                        <a href="registrarIA.jsp" class="btn btn-primary rounded-pill px-5 fw-bold text-decoration-none d-inline-flex align-items-center justify-content-center">
                            <i class="bi bi-cpu me-2"></i>Registrar IA
                        </a>
                    </div>

                    <div class="row g-4">
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden border-top border-primary border-4">
                                <div class="card-body p-4">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <h5 class="card-title fw-bold">ChatGPT</h5>
                                        <span class="badge text-bg-success">En línea</span>
                                    </div>
                                    <p class="text-body-secondary small mb-4">Ideal para redacción de ensayos, explicación de conceptos generales y tutoría conversacional.</p>
                                    <div class="d-flex justify-content-between align-items-center text-muted small">
                                        <span>Estado: Activo</span>
                                        <button class="btn btn-sm btn-outline-primary rounded-pill px-3">Configurar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden border-top border-success border-4">
                                <div class="card-body p-4">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <h5 class="card-title fw-bold">Gemini</h5>
                                        <span class="badge text-bg-success">En línea</span>
                                    </div>
                                    <p class="text-body-secondary small mb-4">Potente para análisis multimodal, síntesis rápida de documentos y búsqueda en tiempo real.</p>
                                    <div class="d-flex justify-content-between align-items-center text-muted small">
                                        <span>Estado: Activo</span>
                                        <button class="btn btn-sm btn-outline-primary rounded-pill px-3">Configurar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden border-top border-warning border-4">
                                <div class="card-body p-4">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <h5 class="card-title fw-bold">DeepSeek</h5>
                                        <span class="badge text-bg-success">En línea</span>
                                    </div>
                                    <p class="text-body-secondary small mb-4">Excelente para programación avanzada, resolución de algoritmos complejos y lógica matemática.</p>
                                    <div class="d-flex justify-content-between align-items-center text-muted small">
                                        <span>Estado: Activo</span>
                                        <button class="btn btn-sm btn-outline-primary rounded-pill px-3">Configurar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden border-top border-secondary border-4">
                                <div class="card-body p-4">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <h5 class="card-title fw-bold">Notebook</h5>
                                        <span class="badge text-bg-success">En línea</span>
                                    </div>
                                    <p class="text-body-secondary small mb-4">Interactúa directamente con tus propios documentos, PDFs y notas de estudio sin riesgo de alucinaciones. complejos y lógica matemática.</p>
                                    <div class="d-flex justify-content-between align-items-center text-muted small">
                                        <span>Estado: Activo</span>
                                        <button class="btn btn-sm btn-outline-primary rounded-pill px-3">Configurar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </main>

    </div>
</div>

<%@include file="lib/footer.jsp" %>