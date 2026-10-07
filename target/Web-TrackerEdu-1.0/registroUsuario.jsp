<%@include file="lib/header.jsp"%>

<div class="container mt-5">

    <div class="row justify-content-center">
        <div class="col-md-6">

            <h1 class="text-center fw-bold mb-3">REGISTRO DE USUARIO</h1>

            <form action="login.jsp" action="servletUsuarios.java" method="POST">

                <div class="form-floating mb-3">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingName" 
                        value="nombreRegistro"
                        placeholder="Anon">
                    <label for="floatingName">Nombre</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="email" 
                        class="form-control" 
                        id="floatingEmail" 
                        value="correoInstitucional"
                        placeholder="example@gmail.com">
                    <label for="floatingEmail">Correo Institucional</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingIdentificationDocument" 
                        value="documentoIdentificacion"
                        placeholder="123456789">
                    <label for="floatingIdentificationDocument">Documento de identificación</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingPassword" 
                        placeholder="Password">
                    <label for="floatingPassword">Contraseña</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingConfirmPassword" 
                        placeholder="Password">
                    <label for="floatingConfirmPassword">Confirmar Contraseña</label>
                </div>

                <div class="form-floating mb-3">
                    <select class="form-select" id="tipoRol">
                        <option selected disabled>Escoge un rol</option>
                        <option value="estudiante">Estudiante</option>
                        <option value="profesor">Profesor</option>
                    </select>

                    <label for="tipoRol">Rol</label>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Registrarse</button>
                </div>

            </form>
            
            <div class="mt-2">
                <a href="login.jsp" class="btn btn-outline-danger btn-sm text-left rounded-pill px-3">Salir</a>
            </div>

        </div>
    </div>
  
</div>

<%@include file="lib/footer.jsp" %>