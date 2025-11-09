<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Recuperar la sesión
    HttpSession sesion_cli = request.getSession(false);
    String nUsuario = null;

    if (sesion_cli != null) {
        nUsuario = (String) sesion_cli.getAttribute("nUsuario");
    }

    // Si no hay sesión activa, redirigir al login
    if (nUsuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inicio - Panel de Control</title>
    <style>
     body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: #f4f6f8;
    text-align: center;
    margin: 0;
    padding: 0;
}

.container {
    margin-top: 40px; /* menos margen, para que se vea centrado */
}

h1 {
    color: #007bff;
    font-size: 32px;
    margin-bottom: 10px;
}

p {
    font-size: 18px;
    color: #333;
}

.user {
    font-weight: bold;
    color: #007bff;
}

img {
    margin-top: 20px;
    width: 150px;
    opacity: 0.9;
}

/* Elimina el footer fijo */
footer {
    margin-top: 30px;
    color: #777;
    font-size: 14px;
}

    </style>
</head>
<body>

    <div class="container">
        <h1>Bienvenido al Panel de Control</h1>
        <p>Has iniciado sesión como: <span class="user"><%= nUsuario %></span></p>
        <p>Selecciona una opción del menú para comenzar.</p>
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Usuario">
    </div>

    <footer>
        © 2025 - Sistema de Control de Acceso | Programación Web JSP
    </footer>

</body>
</html>
