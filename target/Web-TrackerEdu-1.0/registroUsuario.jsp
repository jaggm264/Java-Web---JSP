<%@include file="lib/header.jsp"%>

<div class="container mt-5">

    <div class="row justify-content-center">
        <div class="col-md-6">

            <h1 class="text-center mb-4">USER REGISTER</h1>

            <form action="login.jsp" method="GET">

                <div class="form-floating mb-3">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingName" 
                        placeholder="Anon">
                    <label for="floatingName">Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="email" 
                        class="form-control" 
                        id="floatingEmail" 
                        placeholder="example@gmail.com">
                    <label for="floatingEmail">Institutional Email</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="text" 
                        class="form-control" 
                        id="floatingIdentificationDocument" 
                        placeholder="123456789">
                    <label for="floatingIdentificationDocument">Identification Document</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingPassword" 
                        placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="form-floating mb-3">
                    <input 
                        type="password" 
                        class="form-control" 
                        id="floatingConfirmPassword" 
                        placeholder="Password">
                    <label for="floatingConfirmPassword">Confirm Password</label>
                </div>

                <div class="form-floating mb-3">
                    <select class="form-select" id="tipoRol">
                        <option selected disabled>Choose a role</option>
                        <option value="estudiante">Estudiante</option>
                        <option value="profesor">Profesor</option>
                    </select>

                    <label for="tipoRol">Role</label>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>

            </form>
            
            <div class="mt-2">
                <a href="login.jsp" class="btn btn-outline-danger btn-sm">Exit</a>
            </div>

        </div>
    </div>
  
</div>

<%@include file="lib/footer.jsp" %>