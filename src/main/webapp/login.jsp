<%@include file="lib/header.jsp"%>

<div class="container mt-5">
    
    <div class="row justify-content-center">
        <div class \="col-md-6">
            
            <h1 class="text-center mb-4">LOGIN</h1>
            
            <form action="index.jsp" method="GET">
                
                <div class="form-floating mb-3">
                    <input 
                        type="email" 
                        class="form-control" 
                        id="floatingEmail"
                        name="email_login"
                        placeholder="example@gmail.com">
                    <label for="floatingEmail">Institutional Email</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingIdentificationDocument"
                        name="identificationDocument_login"
                        placeholder="123456789">
                    <label for="floatingIdentificationDocument">Identification Document</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingPassword"
                        name="password_login"
                        placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>
                
                <div class="form-floating mb-3">
                    <select class="form-select" id="tipoRol" name="rol_login">
                        <option selected disabled>Choose a role</option>
                        <option value="estudiante">Estudiante</option>
                        <option value="profesor">Profesor</option>
                    </select>

                    <label for="tipoRol">Role</label>
                </div>
                
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
                
            </form>
            
            <div class="d-flex justify-content-between align-items-center mt-3">

                <div class="d-flex align-items-center">
                    <small class="text-muted">Ingresa como</small>
                    <a href="adminUsuario.jsp" class="btn btn-warning btn-sm ms-2">Administrador</a>
                </div>

                <div class="d-flex align-items-center">
                    <small class="text-muted">¿No tienes cuenta?</small>
                    <a href="registroUsuario.jsp" class="btn btn-secondary btn-sm ms-2">Registrate aqui</a>
                </div>
            </div>
          
        </div>
          
    </div>
    
</div>

<%@include file="lib/footer.jsp" %>