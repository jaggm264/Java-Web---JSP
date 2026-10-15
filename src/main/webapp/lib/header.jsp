<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%
    // Recuperamos el usuario logueado y su rol de la sesión
    Usuario usuarioNav = (Usuario) session.getAttribute("usuarioLogueado");
    String nombreNav = "Anon";
    String rolNav = "";
    
    if (usuarioNav != null) {
        if (usuarioNav.getNombre() != null) {
            nombreNav = usuarioNav.getNombre();
        }
        if (usuarioNav.getRol() != null) {
            rolNav = usuarioNav.getRol();
        }
    }
%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrackerEdu IA</title>
    
    <link href="./styles/style.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</head>
<body>
     
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-2 w-100">
    <div class="container-fluid px-4">

        <a class="navbar-brand d-flex align-items-center" href="index.jsp">
            <img src="./imagenes/TrackerEduIA.png" alt="Logo TrackerEdu" style="height: 45px; width: auto;" class="d-inline-block align-text-top">
        </a>

        <div class="d-flex align-items-center gap-3 ms-auto">

            <div class="d-flex align-items-center gap-2">
                <img src="./imagenes/icon-user.png" alt="Perfil" width="38" height="38" class="rounded-circle border border-2 border-secondary object-fit-cover">
                
                <!-- Nombre y Rol con diseño apilado y elegante -->
                <div class="d-none d-sm-flex flex-column text-start">
                    <span class="fw-semibold text-dark lh-sm" style="font-size: 0.95rem;"><%= nombreNav %></span>
                    <% if (!rolNav.isEmpty()) { %>
                        <span class="badge bg-primary bg-opacity-10 text-primary fw-medium rounded-pill mt-1" style="font-size: 0.7rem; width: fit-content;"><%= rolNav %></span>
                    <% } %>
                </div>
            </div>

            <div class="dropdown">
                <button class="btn btn-light rounded-circle p-0 d-flex align-items-center justify-content-center shadow-none border-0" 
                        type="button" 
                        id="menuTresPuntos" 
                        data-bs-toggle="dropdown" 
                        aria-expanded="false" 
                        style="width: 40px; height: 40px;">
                    <span class="fs-4 text-secondary lh-1">&#8942;</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end shadow border-0 rounded-3 mt-2" aria-labelledby="menuTresPuntos">
                    <li>
                        <div class="dropdown-header d-sm-none fw-bold text-dark pb-0">
                            <%= nombreNav %>
                        </div>
                        <% if (!rolNav.isEmpty()) { %>
                            <div class="dropdown-header d-sm-none pt-1">
                                <span class="badge bg-primary bg-opacity-10 text-primary rounded-pill"><%= rolNav %></span>
                            </div>
                        <% } %>
                    </li>
                    <li><hr class="dropdown-divider d-sm-none"></li>
                    <li>
                        <a class="dropdown-item text-danger d-flex align-items-center gap-2 py-2" href="index.jsp">
                            <span>Cerrar sesión</span>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</nav>