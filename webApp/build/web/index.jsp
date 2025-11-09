<%-- 
    Document   : index
    Created on : 22/10/2025
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Inicio de Sesión - Control de Acceso</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .mensaje-error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h1>Iniciar Sesión</h1>

        <form id="form1" name="form1" method="post" action="ctrolValidar">
            <table border="0">
                <tr>
                    <td>Usuario</td>
                    <td>
                        <input type="text" name="cusuario" id="cusuario" required />
                    </td>
                </tr>
                <tr>
                    <td>Contraseña</td>
                    <td>
                        <input type="password" name="cclave" id="cclave" required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <input name="accion" value="Ingresar" type="submit" id="button" />
                    </td>
                </tr>
            </table>
        </form>

        <%-- Mostrar mensaje de error si llega un parámetro ?error=1 --%>
        <%
            String error = request.getParameter("error");
            if ("1".equals(error)) {
        %>
            <p class="mensaje-error">Usuario o contraseña incorrectos.</p>
        <% } %>
    </div>

</body>
</html>
