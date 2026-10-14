<link href="./styles/style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-sm-10 col-md-5 col-lg-4">
            <h1 class="text-center fw-bold mb-3">INICIO DE SESIÓN</h1>
            <% 
                String error = request.getParameter("error");
                if ("credenciales".equals(error)) {
            %>
                <div class="alert alert-danger alert-dismissible fade show text-center py-2 mb-3" role="alert">
                    <small><i class="bi bi-exclamation-triangle-fill me-1"></i> Correo, documento o contraseña incorrectos.</small>
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% 
                }
            %>
            <form action="ServletUsuarios" method="POST">
                <input type="hidden" name="accion" value="login">
                
                <div class="form-floating mb-2">
                    <input 
                        type="email" 
                        class="form-control" 
                        id="floatingEmail"
                        name="correo"
                        placeholder="example@gmail.com" required>
                    <label for="floatingEmail">Correo Institucional</label>
                </div>
                
                <div class="form-floating mb-2">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingIdentificationDocument"
                        name="documento"
                        placeholder="123456789">
                    <label for="floatingIdentificationDocument">Documento de identificación</label>
                </div>
                
                <div class="form-floating mb-2">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingPassword"
                        name="contraseña"
                        placeholder="Password" required>
                    <label for="floatingPassword">Contraseña</label>
                </div>
                        
                <div class="d-grid mb-3">
                    <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                </div>
                
            </form>
            <div class="d-flex justify-content-between align-items-center">
                    <a href="index.jsp" class="btn btn-outline-danger btn-sm rounded-pill px-3">Salir</a>
            </div>   
        </div>        
    </div>    
</div>

<%@include file="lib/footer.jsp" %>