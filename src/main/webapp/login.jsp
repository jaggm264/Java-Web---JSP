<%@include file="lib/header.jsp"%>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-sm-10 col-md-5 col-lg-4">
            <h1 class="text-center fw-bold mb-3">INICIO DE SESIÓN</h1>
            <form action="index.jsp" method="GET">
                
                <div class="form-floating mb-2">
                    <input 
                        type="email" 
                        class="form-control" 
                        id="floatingEmail"
                        name="email_login"
                        placeholder="example@gmail.com">
                    <label for="floatingEmail">Correo Institucional</label>
                </div>
                
                <div class="form-floating mb-2">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingIdentificationDocument"
                        name="identificationDocument_login"
                        placeholder="123456789">
                    <label for="floatingIdentificationDocument">Documento de identificación</label>
                </div>
                
                <div class="form-floating mb-2">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingPassword"
                        name="password_login"
                        placeholder="Password">
                    <label for="floatingPassword">Contraseña</label>
                </div>
                        
                <div class="d-grid mb-3">
                    <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                </div>
                
            </form>
            <div class="d-flex justify-content-between align-items-center">
                    <a href="index.jsp" class="btn btn-outline-danger btn-sm rounded-pill px-3">Salir</a>
                <div class="text-end mb-2">
                    <small class="text-muted">¿No tienes cuenta?</small>
                    <a href="registroUsuario.jsp" class="btn btn-secondary btn-sm ms-2">Registrate aqui</a>
                </div>
            </div>   
        </div>        
    </div>    
</div>
<%@include file="lib/footer.jsp" %>