<%@include file="lib/header.jsp" %>

<div class="container my-5">

    <div class="text-center mb-5">
        <h1 class="fw-bold">Bienvenid@ estudiante</h1>
        <p class="fs-5 text-secondary">Querido estudiante, pertenece al grupo:</p>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow-sm p-4">
                
                <h5 class="fw-bold text-center mb-4 text-secondary">IAs para guiar tu metodo de estudio</h5>

                <div class="d-flex flex-column gap-3 align-items-center my-3">

                    <div class="d-flex justify-content-between align-items-center w-75">
                        <span class="fw-bold fs-5">Gemini:</span>
                        <a href="#" class="btn btn-dark text-warning fw-bold px-4">USAR</a>
                    </div>

                    <div class="d-flex justify-content-between align-items-center w-75">
                        <span class="fw-bold fs-5">ChatGPT:</span>
                        <a href="#" class="btn btn-dark text-warning fw-bold px-4">USAR</a>
                    </div>

                    <div class="d-flex justify-content-between align-items-center w-75">
                        <span class="fw-bold fs-5">Claude:</span>
                        <a href="#" class="btn btn-dark text-warning fw-bold px-4">USAR</a>
                    </div>

                    <div class="d-flex justify-content-between align-items-center w-75">
                        <span class="fw-bold fs-5">Deepseek:</span>
                        <a href="#" class="btn btn-dark text-warning fw-bold px-4">USAR</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    <div>
        <p class="text-center fw-bold fs-5 mb-0 text-dark mt-3">Recuerda usar las IAs de manera adecuada!</p>
    </div>

    <div class="d-flex justify-content-between align-items-center mt-5">
        <div>
            <a href="login.jsp" class="btn btn-outline-danger fw-bold px-4">SALIR</a>
        </div>
    </div>

</div>

<%@include file="lib/footer.jsp" %>