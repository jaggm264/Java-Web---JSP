<link href="./styles/style.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
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
                        placeholder="Anon">
                    <label for="floatingName">Nombre</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="email" 
                        class="form-control" 
                        id="floatingEmail"
                        placeholder="example@gmail.com">
                    <label for="floatingEmail">Correo Institucional</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingIdentificationDocument" 
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