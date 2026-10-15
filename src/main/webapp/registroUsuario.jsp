<%@include file="lib/header.jsp" %>
<div class="container mt-5 mb-5">

    <div class="row justify-content-center">
        <div class="col-md-6">

            <h1 class="text-center fw-bold mb-3">REGISTRO DE USUARIO</h1>
            
            <% 
                String error = request.getParameter("error");
                if ("duplicado".equals(error)) {
            %>
                <div class="alert alert-danger alert-dismissible fade show text-center py-2 mb-3" role="alert">
                    <small><i class="bi bi-exclamation-triangle-fill me-1"></i> El correo institucional o el documento ya están registrados.</small>
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% 
                } else if ("passwordsNoCoinciden".equals(error)) {
            %>
                <div class="alert alert-danger alert-dismissible fade show text-center py-2 mb-3" role="alert">
                    <small><i class="bi bi-exclamation-triangle-fill me-1"></i> Las contraseñas no coinciden. Por favor, verifícalas.</small>
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% 
                }
            %>

            <form action="ServletUsuarios" method="POST">
                <input type="hidden" name="accion" value="registrar">

                <div class="form-floating mb-3">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingName" 
                        name="nombre"
                        placeholder="Anon" required>
                    <label for="floatingName">Nombre</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="email" 
                        class="form-control" 
                        id="floatingEmail"
                        name="correo"
                        placeholder="example@gmail.com" required>
                    <label for="floatingEmail">Correo Institucional</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingIdentificationDocument" 
                        name="documento"
                        placeholder="123456789" required>
                    <label for="floatingIdentificationDocument">Documento de identificación</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingPassword" 
                        name="contraseña"
                        placeholder="Password" required>
                    <label for="floatingPassword">Contraseña</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingConfirmPassword" 
                        name="confirmarContraseña"
                        placeholder="Password" required>
                    <label for="floatingConfirmPassword">Confirmar Contraseña</label>
                </div>

                <div class="form-floating mb-3">
                    <select class="form-select" id="tipoRol" name="tipoRol" required>
                        <option selected disabled>Escoge un rol</option>
                        <option value="estudiante">Estudiante</option>
                        <option value="profesor">Profesor</option>
                        <option value="administrador">Administrador</option>
                    </select>
                    <label for="tipoRol">Rol</label>
                </div>

                <div class="d-flex flex-wrap gap-2 justify-content-between align-items-center mt-4">
                    <a href="ServletUsuarios?accion=panelAdmin&tab=usuarios" class="btn btn-secondary rounded-pill px-4 text-decoration-none">Cancelar</a>
                    <button type="submit" class="btn btn-primary rounded-pill px-4 fw-bold">Registrar Usuario</button>
                </div>

            </form>

        </div>
    </div>
  
</div>

<%@include file="lib/footer.jsp" %>