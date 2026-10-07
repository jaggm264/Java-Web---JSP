<%@include file="lib/header2.jsp" %>

<!-- ================= BARRA SUPERIOR ================= -->
<nav class="navbar navbar-dark bg-dark sticky-top shadow">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center gap-2" href="#">
            <i class="bi bi-shield-lock-fill text-warning"></i> Panel de administración
        </a>
        <div class="d-flex align-items-center gap-3">
            <button class="btn btn-outline-light btn-sm position-relative" type="button" data-bs-toggle="offcanvas" data-bs-target="#panelAvisos">
                <i class="bi bi-bell"></i>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
            </button>
            <div class="dropdown">
                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown">
                    <img src="https://i.pravatar.cc/80?img=12" alt="Administrador" width="36" height="36" class="rounded-circle border border-warning me-2">
                    <span class="d-none d-md-inline">Administrador</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2"></i>Mi perfil</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Configuración</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-box-arrow-right me-2"></i>Cerrar sesión</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- Panel lateral de avisos -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="panelAvisos">
    <div class="offcanvas-header bg-dark text-white">
        <h5 class="offcanvas-title"><i class="bi bi-bell me-2"></i>Avisos recientes</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <div class="list-group list-group-flush">
            <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-flag-fill text-danger me-2"></i>Nuevo reporte crítico pendiente</a>
            <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-person-plus-fill text-success me-2"></i>5 usuarios nuevos esta semana</a>
            <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-robot text-primary me-2"></i>Un modelo de IA necesita revisión</a>
        </div>
    </div>
</div>

<div class="container-fluid py-4">
    <div class="row g-4">

        <!-- ================= MENÚ LATERAL ================= -->
        <aside class="col-lg-3 col-xl-2">
            <div class="card shadow-sm sticky-lg-top">
                <div class="card-body">
                    <p class="text-body-secondary small mb-2">Secciones</p>
                    <div class="nav nav-pills flex-lg-column gap-1" id="menu" role="tablist">
                        <button class="nav-link active text-start" data-bs-toggle="pill" data-bs-target="#reportes" type="button" role="tab">
                            <i class="bi bi-flag me-2"></i>Gestionar reportes
                        </button>
                        <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#usuarios" type="button" role="tab">
                            <i class="bi bi-people me-2"></i>Gestionar usuarios
                        </button>
                        <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#grupos" type="button" role="tab">
                            <i class="bi bi-diagram-3 me-2"></i>Gestionar grupos
                        </button>
                        <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#ias" type="button" role="tab">
                            <i class="bi bi-robot me-2"></i>Gestionar IAs
                        </button>
                    </div>
                </div>
            </div>
        </aside>

        <!-- ================= CONTENIDO ================= -->
        <main class="col-lg-9 col-xl-10">
            <div class="tab-content">

                <!-- ============ 1. REPORTES ============ -->
                <section class="tab-pane fade show active" id="reportes" role="tabpanel">
                    <div class="card text-bg-dark border-0 shadow mb-4 overflow-hidden">
                        <div class="ratio ratio-21x9">
                            <img src="https://picsum.photos/seed/reportes/1200/400" class="object-fit-cover opacity-50" alt="Reportes">
                        </div>
                        <div class="card-img-overlay d-flex flex-column justify-content-end">
                            <h2 class="card-title"><i class="bi bi-flag-fill text-danger me-2"></i>Gestionar reportes</h2>
                            <p class="card-text">Revisa, prioriza y resuelve las denuncias enviadas por la comunidad.</p>
                        </div>
                    </div>

                    <div class="row g-3 mb-4">
                        <div class="col-6 col-md-3"><div class="card border-danger border-2 text-center"><div class="card-body"><i class="bi bi-exclamation-octagon fs-2 text-danger"></i><h3 class="mb-0">12</h3><small class="text-body-secondary">Pendientes</small></div></div></div>
                        <div class="col-6 col-md-3"><div class="card border-warning border-2 text-center"><div class="card-body"><i class="bi bi-hourglass-split fs-2 text-warning"></i><h3 class="mb-0">7</h3><small class="text-body-secondary">En revisión</small></div></div></div>
                        <div class="col-6 col-md-3"><div class="card border-success border-2 text-center"><div class="card-body"><i class="bi bi-check-circle fs-2 text-success"></i><h3 class="mb-0">148</h3><small class="text-body-secondary">Resueltos</small></div></div></div>
                        <div class="col-6 col-md-3"><div class="card border-secondary border-2 text-center"><div class="card-body"><i class="bi bi-archive fs-2 text-secondary"></i><h3 class="mb-0">36</h3><small class="text-body-secondary">Archivados</small></div></div></div>
                    </div>

                    <div class="card shadow-sm">
                        <div class="card-header d-flex flex-wrap justify-content-between align-items-center gap-2">
                            <h5 class="mb-0">Listado de reportes</h5>
                            <div class="d-flex gap-2">
                                <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="collapse" data-bs-target="#filtrosReportes"><i class="bi bi-funnel me-1"></i>Filtros</button>
                                <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#modalReporte"><i class="bi bi-plus-lg me-1"></i>Nuevo reporte</button>
                            </div>
                        </div>
                        <div class="collapse" id="filtrosReportes">
                            <div class="card-body border-bottom bg-body-tertiary">
                                <div class="row g-2">
                                    <div class="col-md-4"><input type="search" class="form-control" placeholder="Buscar por título o autor"></div>
                                    <div class="col-md-3"><select class="form-select"><option>Todos los estados</option><option>Pendiente</option><option>En revisión</option><option>Resuelto</option></select></div>
                                    <div class="col-md-3"><select class="form-select"><option>Cualquier prioridad</option><option>Alta</option><option>Media</option><option>Baja</option></select></div>
                                    <div class="col-md-2 d-grid"><button class="btn btn-dark">Aplicar</button></div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light"><tr><th>#</th><th>Reporte</th><th>Autor</th><th>Prioridad</th><th>Estado</th><th class="text-end">Acciones</th></tr></thead>
                                <tbody>
                                    <tr>
                                        <td>101</td><td>Contenido ofensivo en un chat</td>
                                        <td><img src="https://i.pravatar.cc/40?img=5" width="32" height="32" class="rounded-circle me-2" alt="Laura">Laura</td>
                                        <td><span class="badge text-bg-danger">Alta</span></td><td><span class="badge text-bg-warning">Pendiente</span></td>
                                        <td class="text-end"><button class="btn btn-sm btn-outline-primary" data-bs-toggle="offcanvas" data-bs-target="#panelAvisos"><i class="bi bi-eye"></i></button> <button class="btn btn-sm btn-outline-success"><i class="bi bi-check2"></i></button> <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>102</td><td>Spam en el foro general</td>
                                        <td><img src="https://i.pravatar.cc/40?img=8" width="32" height="32" class="rounded-circle me-2" alt="Carlos">Carlos</td>
                                        <td><span class="badge text-bg-warning">Media</span></td><td><span class="badge text-bg-info">En revisión</span></td>
                                        <td class="text-end"><button class="btn btn-sm btn-outline-primary"><i class="bi bi-eye"></i></button> <button class="btn btn-sm btn-outline-success"><i class="bi bi-check2"></i></button> <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>103</td><td>Error en la respuesta de una IA</td>
                                        <td><img src="https://i.pravatar.cc/40?img=32" width="32" height="32" class="rounded-circle me-2" alt="Marta">Marta</td>
                                        <td><span class="badge text-bg-secondary">Baja</span></td><td><span class="badge text-bg-success">Resuelto</span></td>
                                        <td class="text-end"><button class="btn btn-sm btn-outline-primary"><i class="bi bi-eye"></i></button> <button class="btn btn-sm btn-outline-secondary"><i class="bi bi-archive"></i></button> <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Modal nuevo reporte -->
                    <div class="modal fade" id="modalReporte" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header bg-danger text-white"><h5 class="modal-title">Nuevo reporte</h5><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div>
                                <div class="modal-body">
                                    <div class="mb-3"><label class="form-label">Título</label><input type="text" class="form-control"></div>
                                    <div class="mb-3"><label class="form-label">Prioridad</label><select class="form-select"><option>Alta</option><option>Media</option><option>Baja</option></select></div>
                                    <div class="mb-3"><label class="form-label">Descripción</label><textarea class="form-control" rows="3"></textarea></div>
                                    <div><label class="form-label">Evidencia (imagen)</label><input type="file" class="form-control" accept="image/*"></div>
                                </div>
                                <div class="modal-footer"><button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button><button class="btn btn-danger">Guardar reporte</button></div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- ============ 2. USUARIOS ============ -->
                <section class="tab-pane fade" id="usuarios" role="tabpanel">
                    <div class="card text-bg-dark border-0 shadow mb-4 overflow-hidden">
                        <div class="ratio ratio-21x9">
                            <img src="https://picsum.photos/seed/usuarios/1200/400" class="object-fit-cover opacity-50" alt="Usuarios">
                        </div>
                        <div class="card-img-overlay d-flex flex-column justify-content-end">
                            <h2 class="card-title"><i class="bi bi-people-fill text-info me-2"></i>Gestionar usuarios</h2>
                            <p class="card-text">Crea cuentas, asigna roles y controla el acceso de cada persona.</p>
                        </div>
                    </div>

                    <div class="d-flex flex-wrap justify-content-between gap-2 mb-3">
                        <div class="input-group w-auto">
                            <span class="input-group-text"><i class="bi bi-search"></i></span>
                            <input type="search" class="form-control" placeholder="Buscar usuario">
                        </div>
                        <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#modalUsuario"><i class="bi bi-person-plus me-1"></i>Nuevo usuario</button>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm text-center">
                                <div class="card-body">
                                    <img src="https://i.pravatar.cc/120?img=15" class="rounded-circle border border-3 border-success mb-3" width="96" height="96" alt="Andrés Ruiz">
                                    <h5 class="mb-0">Andrés Ruiz</h5>
                                    <p class="text-body-secondary small">andres@correo.com</p>
                                    <span class="badge text-bg-dark me-1">Administrador</span><span class="badge text-bg-success">Activo</span>
                                </div>
                                <div class="card-footer d-flex justify-content-center gap-2">
                                    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalUsuario"><i class="bi bi-pencil"></i> Editar</button>
                                    <button class="btn btn-sm btn-outline-warning"><i class="bi bi-slash-circle"></i> Suspender</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm text-center">
                                <div class="card-body">
                                    <img src="https://i.pravatar.cc/120?img=47" class="rounded-circle border border-3 border-success mb-3" width="96" height="96" alt="Sofía Mena">
                                    <h5 class="mb-0">Sofía Mena</h5>
                                    <p class="text-body-secondary small">sofia@correo.com</p>
                                    <span class="badge text-bg-primary me-1">Moderadora</span><span class="badge text-bg-success">Activo</span>
                                </div>
                                <div class="card-footer d-flex justify-content-center gap-2">
                                    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalUsuario"><i class="bi bi-pencil"></i> Editar</button>
                                    <button class="btn btn-sm btn-outline-warning"><i class="bi bi-slash-circle"></i> Suspender</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm text-center">
                                <div class="card-body">
                                    <img src="https://i.pravatar.cc/120?img=60" class="rounded-circle border border-3 border-secondary mb-3" width="96" height="96" alt="Julián Torres">
                                    <h5 class="mb-0">Julián Torres</h5>
                                    <p class="text-body-secondary small">julian@correo.com</p>
                                    <span class="badge text-bg-secondary me-1">Usuario</span><span class="badge text-bg-danger">Suspendido</span>
                                </div>
                                <div class="card-footer d-flex justify-content-center gap-2">
                                    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalUsuario"><i class="bi bi-pencil"></i> Editar</button>
                                    <button class="btn btn-sm btn-outline-success"><i class="bi bi-arrow-counterclockwise"></i> Reactivar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal usuario -->
                    <div class="modal fade" id="modalUsuario" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header bg-info"><h5 class="modal-title">Datos del usuario</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
                                <div class="modal-body">
                                    <div class="row g-3">
                                        <div class="col-md-6"><label class="form-label">Nombre</label><input type="text" class="form-control"></div>
                                        <div class="col-md-6"><label class="form-label">Correo</label><input type="email" class="form-control"></div>
                                        <div class="col-md-6"><label class="form-label">Contraseña</label><input type="password" class="form-control"></div>
                                        <div class="col-md-6"><label class="form-label">Rol</label><select class="form-select"><option>Administrador</option><option>Moderador</option><option>Usuario</option></select></div>
                                        <div class="col-12"><label class="form-label">Foto de perfil</label><input type="file" class="form-control" accept="image/*"></div>
                                        <div class="col-12"><div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="usuarioActivo" checked><label class="form-check-label" for="usuarioActivo">Cuenta activa</label></div></div>
                                    </div>
                                </div>
                                <div class="modal-footer"><button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button><button class="btn btn-info">Guardar usuario</button></div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- ============ 3. GRUPOS ============ -->
                <section class="tab-pane fade" id="grupos" role="tabpanel">
                    <div class="card text-bg-dark border-0 shadow mb-4 overflow-hidden">
                        <div class="ratio ratio-21x9">
                            <img src="https://picsum.photos/seed/grupos/1200/400" class="object-fit-cover opacity-50" alt="Grupos">
                        </div>
                        <div class="card-img-overlay d-flex flex-column justify-content-end">
                            <h2 class="card-title"><i class="bi bi-diagram-3-fill text-success me-2"></i>Gestionar grupos</h2>
                            <p class="card-text">Organiza a las personas en equipos y define quién pertenece a cada uno.</p>
                        </div>
                    </div>

                    <div class="text-end mb-3">
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalGrupo"><i class="bi bi-plus-circle me-1"></i>Crear grupo</button>
                    </div>

                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="card h-100 shadow-sm">
                                <img src="https://picsum.photos/seed/equipoA/600/260" class="card-img-top" alt="Equipo Soporte">
                                <div class="card-body">
                                    <h5 class="card-title">Equipo de soporte</h5>
                                    <p class="card-text text-body-secondary">Atiende reportes y dudas de la comunidad.</p>
                                    <small>Capacidad: 8 de 10</small>
                                    <div class="progress mb-3"><div class="progress-bar bg-success w-75" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div></div>
                                    <div class="d-flex mb-3">
                                        <img src="https://i.pravatar.cc/40?img=11" class="rounded-circle border border-2 border-white" width="40" height="40" alt="Miembro">
                                        <img src="https://i.pravatar.cc/40?img=20" class="rounded-circle border border-2 border-white ms-1" width="40" height="40" alt="Miembro">
                                        <img src="https://i.pravatar.cc/40?img=33" class="rounded-circle border border-2 border-white ms-1" width="40" height="40" alt="Miembro">
                                        <span class="badge rounded-pill text-bg-secondary align-self-center ms-2">+5</span>
                                    </div>
                                    <button class="btn btn-sm btn-outline-success" data-bs-toggle="collapse" data-bs-target="#miembrosA">Ver miembros</button>
                                    <div class="collapse mt-3" id="miembrosA">
                                        <ul class="list-group">
                                            <li class="list-group-item d-flex justify-content-between align-items-center">Andrés Ruiz <button class="btn btn-sm btn-outline-danger"><i class="bi bi-x-lg"></i></button></li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center">Sofía Mena <button class="btn btn-sm btn-outline-danger"><i class="bi bi-x-lg"></i></button></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-between"><button class="btn btn-sm btn-outline-primary"><i class="bi bi-person-plus"></i> Añadir miembro</button><button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i> Eliminar</button></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card h-100 shadow-sm">
                                <img src="https://picsum.photos/seed/equipoB/600/260" class="card-img-top" alt="Equipo Moderación">
                                <div class="card-body">
                                    <h5 class="card-title">Moderación</h5>
                                    <p class="card-text text-body-secondary">Vigila el contenido y aplica las normas.</p>
                                    <small>Capacidad: 4 de 12</small>
                                    <div class="progress mb-3"><div class="progress-bar bg-warning w-25" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"></div></div>
                                    <div class="d-flex mb-3">
                                        <img src="https://i.pravatar.cc/40?img=45" class="rounded-circle border border-2 border-white" width="40" height="40" alt="Miembro">
                                        <img src="https://i.pravatar.cc/40?img=52" class="rounded-circle border border-2 border-white ms-1" width="40" height="40" alt="Miembro">
                                        <span class="badge rounded-pill text-bg-secondary align-self-center ms-2">+2</span>
                                    </div>
                                    <button class="btn btn-sm btn-outline-success" data-bs-toggle="collapse" data-bs-target="#miembrosB">Ver miembros</button>
                                    <div class="collapse mt-3" id="miembrosB">
                                        <ul class="list-group">
                                            <li class="list-group-item d-flex justify-content-between align-items-center">Julián Torres <button class="btn btn-sm btn-outline-danger"><i class="bi bi-x-lg"></i></button></li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center">Laura Pérez <button class="btn btn-sm btn-outline-danger"><i class="bi bi-x-lg"></i></button></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-between"><button class="btn btn-sm btn-outline-primary"><i class="bi bi-person-plus"></i> Añadir miembro</button><button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i> Eliminar</button></div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal grupo -->
                    <div class="modal fade" id="modalGrupo" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header bg-success text-white"><h5 class="modal-title">Crear grupo</h5><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div>
                                <div class="modal-body">
                                    <div class="mb-3"><label class="form-label">Nombre del grupo</label><input type="text" class="form-control"></div>
                                    <div class="mb-3"><label class="form-label">Descripción</label><textarea class="form-control" rows="2"></textarea></div>
                                    <div class="mb-3"><label class="form-label">Capacidad máxima</label><input type="number" class="form-control" min="1" value="10"></div>
                                    <div><label class="form-label">Imagen del grupo</label><input type="file" class="form-control" accept="image/*"></div>
                                </div>
                                <div class="modal-footer"><button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button><button class="btn btn-success">Crear grupo</button></div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- ============ 4. IAs ============ -->
                <section class="tab-pane fade" id="ias" role="tabpanel">
                    <div class="card text-bg-dark border-0 shadow mb-4 overflow-hidden">
                        <div class="ratio ratio-21x9">
                            <img src="https://picsum.photos/seed/inteligencia/1200/400" class="object-fit-cover opacity-50" alt="Inteligencias artificiales">
                        </div>
                        <div class="card-img-overlay d-flex flex-column justify-content-end">
                            <h2 class="card-title"><i class="bi bi-robot text-primary me-2"></i>Gestionar IAs</h2>
                            <p class="card-text">Activa modelos, ajusta su comportamiento y vigila su rendimiento.</p>
                        </div>
                    </div>

                    <div class="text-end mb-3">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalIA"><i class="bi bi-cpu me-1"></i>Registrar IA</button>
                    </div>

                    <div class="row g-4">
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm border-primary">
                                <img src="https://picsum.photos/seed/ia1/500/240" class="card-img-top" alt="Asistente de soporte">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <h5 class="card-title">Asistente de soporte</h5>
                                        <span class="badge text-bg-success">En línea</span>
                                    </div>
                                    <p class="text-body-secondary small">Responde preguntas frecuentes de los usuarios.</p>
                                    <small>Precisión</small>
                                    <div class="progress mb-2"><div class="progress-bar bg-primary w-75" role="progressbar" aria-valuenow="92" aria-valuemin="0" aria-valuemax="100">92%</div></div>
                                    <small>Uso de recursos</small>
                                    <div class="progress mb-3"><div class="progress-bar bg-warning w-50" role="progressbar" aria-valuenow="58" aria-valuemin="0" aria-valuemax="100">58%</div></div>
                                    <div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="ia1" checked><label class="form-check-label" for="ia1">Activada</label></div>
                                </div>
                                <div class="card-footer"><button class="btn btn-sm btn-outline-primary w-100" data-bs-toggle="modal" data-bs-target="#modalIA"><i class="bi bi-sliders me-1"></i>Configurar</button></div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm border-primary">
                                <img src="https://picsum.photos/seed/ia2/500/240" class="card-img-top" alt="Moderador automático">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <h5 class="card-title">Moderador automático</h5>
                                        <span class="badge text-bg-success">En línea</span>
                                    </div>
                                    <p class="text-body-secondary small">Detecta contenido ofensivo y lo envía a reportes.</p>
                                    <small>Precisión</small>
                                    <div class="progress mb-2"><div class="progress-bar bg-primary w-75" role="progressbar" aria-valuenow="87" aria-valuemin="0" aria-valuemax="100">87%</div></div>
                                    <small>Uso de recursos</small>
                                    <div class="progress mb-3"><div class="progress-bar bg-danger w-75" role="progressbar" aria-valuenow="81" aria-valuemin="0" aria-valuemax="100">81%</div></div>
                                    <div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="ia2" checked><label class="form-check-label" for="ia2">Activada</label></div>
                                </div>
                                <div class="card-footer"><button class="btn btn-sm btn-outline-primary w-100" data-bs-toggle="modal" data-bs-target="#modalIA"><i class="bi bi-sliders me-1"></i>Configurar</button></div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-4">
                            <div class="card h-100 shadow-sm border-secondary">
                                <img src="https://picsum.photos/seed/ia3/500/240" class="card-img-top opacity-50" alt="Generador de resúmenes">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <h5 class="card-title">Generador de resúmenes</h5>
                                        <span class="badge text-bg-secondary">Apagada</span>
                                    </div>
                                    <p class="text-body-secondary small">Resume reportes largos para agilizar su revisión.</p>
                                    <small>Precisión</small>
                                    <div class="progress mb-2"><div class="progress-bar bg-primary w-50" role="progressbar" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100">74%</div></div>
                                    <small>Uso de recursos</small>
                                    <div class="progress mb-3"><div class="progress-bar bg-success w-25" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div></div>
                                    <div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="ia3"><label class="form-check-label" for="ia3">Activada</label></div>
                                </div>
                                <div class="card-footer"><button class="btn btn-sm btn-outline-primary w-100" data-bs-toggle="modal" data-bs-target="#modalIA"><i class="bi bi-sliders me-1"></i>Configurar</button></div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal IA -->
                    <div class="modal fade" id="modalIA" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header bg-primary text-white"><h5 class="modal-title">Configuración de la IA</h5><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div>
                                <div class="modal-body">
                                    <div class="mb-3"><label class="form-label">Nombre</label><input type="text" class="form-control"></div>
                                    <div class="mb-3"><label class="form-label">Modelo</label><select class="form-select"><option>Modelo de texto</option><option>Modelo de moderación</option><option>Modelo de imágenes</option></select></div>
                                    <div class="mb-3"><label class="form-label">Nivel de creatividad</label><input type="range" class="form-range" min="0" max="10" value="5"></div>
                                    <div class="mb-3"><label class="form-label">Instrucciones</label><textarea class="form-control" rows="3"></textarea></div>
                                    <div><label class="form-label">Imagen del avatar</label><input type="file" class="form-control" accept="image/*"></div>
                                </div>
                                <div class="modal-footer"><button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button><button class="btn btn-primary">Guardar cambios</button></div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </main>
    </div>
</div>

<footer class="bg-dark text-white-50 text-center py-3 mt-4">
    <small>Panel de administración &copy; 2026</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
