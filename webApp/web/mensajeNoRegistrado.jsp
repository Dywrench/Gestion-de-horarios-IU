<%-- 
    Document   : mensajeNoRegistrado
    Created on : 12/11/2025, 5:40:44 p. m.
    Author     : Alejandra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Usuario no encontrado</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #0d47a1, #1976d2, #42a5f5);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 500px;
        }

        h2 {
            font-size: 1.8em;
            margin-bottom: 15px;
            color: #e3f2fd;
        }

        h3 {
            font-weight: normal;
            color: #bbdefb;
            margin-bottom: 25px;
        }

        a {
            text-decoration: none;
            color: #0d47a1;
            background-color: #bbdefb;
            padding: 10px 20px;
            border-radius: 8px;
            transition: 0.3s;
            font-weight: bold;
        }

        a:hover {
            background-color: #90caf9;
            color: #0d47a1;
        }

        footer {
            margin-top: 20px;
            font-size: 0.9em;
            color: #e3f2fd;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><%= request.getParameter("msg") != null ? request.getParameter("msg") : "Usuario o contraseña incorrectos" %></h2>
        <h3>Intenta nuevamente o contacta a un administrador.</h3>
        <p><a href="index.jsp">Volver al menú principal</a></p>
    </div>
    <footer>© 2025 Sistema de Gestion Horario</footer>
</body>
</html>
