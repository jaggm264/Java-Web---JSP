<%@include file="lib/header.jsp" %>

<div class="container-fluid py-4 pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-success text-white py-3 rounded-top-4 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-pencil-square me-2"></i>Editar / Eliminar Grupo</h5>
                    <span class="badge bg-light text-dark px-3 py-2 rounded-pill">ID: 1</span>
                </div>
                <div class="card-body p-4">
                    <form action="GrupoServlet" method="POST">
                        <input type="hidden" name="idGrupo" value="1">
                        
                        <div class="mb-3">
                            <label for="nombreGrupo" class="form-label fw-semibold">Nombre del Grupo</label>
                            <input type="text" class="form-control" id="nombreGrupo" name="nombreGrupo" value="Equipo 1" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nombreDocente" class="form-label fw-semibold">Docente Encargado</label>
                            <input type="text" class="form-control" id="nombreDocente" name="nombreDocente" value="Prof. Carlos Gómez" required>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label for="integrante1" class="form-label fw-semibold">Integrante 1</label>
                                <input type="text" class="form-control" id="integrante1" name="integrante1" value="Por definir">
                            </div>
                            <div class="col-md-6">
                                <label for="integrante2" class="form-label fw-semibold">Integrante 2</label>
                                <input type="text" class="form-control" id="integrante2" name="integrante2" value="Por definir">
                            </div>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label for="integrante3" class="form-label fw-semibold">Integrante 3</label>
                                <input type="text" class="form-control" id="integrante3" name="integrante3" value="Por definir">
                            </div>
                            <div class="col-md-6">
                                <label for="integrante4" class="form-label fw-semibold">Integrante 4</label>
                                <input type="text" class="form-control" id="integrante4" name="integrante4" value="Por definir">
                            </div>
                        </div>

                        <div class="d-grid mb-3 mt-4">
                            <button type="submit" name="accion" value="actualizar" class="btn btn-success rounded-pill py-2 fw-bold shadow-sm">
                                Actualizar Grupo
                            </button>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <button type="submit" name="accion" value="eliminar" class="btn btn-danger rounded-pill px-4 text-nowrap w-auto" style="width: auto !important; background-color: #dc3545 !important; border-color: #dc3545 !important;" onclick="return confirm('¿Estás seguro de que deseas eliminar este grupo?');">
                                <i class="bi bi-trash me-1"></i>Eliminar Grupo
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