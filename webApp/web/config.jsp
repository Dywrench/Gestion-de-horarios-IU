<%-- configuraciones.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.UsuarioDAO, modelo.Usuario, javax.servlet.http.HttpSession"%>

<%
    HttpSession sesion = request.getSession(false);
    String nUsuario = (sesion != null) ? (String) sesion.getAttribute("nUsuario") : null;
    
    if (nUsuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    // Obtener datos del usuario actual
    UsuarioDAO udao = new UsuarioDAO();
    Usuario usuario = udao.obtenerUsuarioPorUsername(nUsuario);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Configuraciones - Mi Perfil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 10px;
            background-color: #f5f5f5;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        h2 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        td:first-child {
            width: 40%;
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[readonly] {
            background-color: #f0f0f0;
            color: #666;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"], input[type="button"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 5px;
        }
        input[type="button"] {
            background-color: #6c757d;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        input[type="button"]:hover {
            background-color: #545b62;
        }
        .info-message {
            background-color: #e7f3ff;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Configuración de Mi Perfil</h2>
        
        <div class="info-message">
            <strong>Información:</strong> Actualiza tus datos personales. Los campos en gris no se pueden modificar.
        </div>
        
        <form action="ActualizarPerfil" method="post">
            <table>
                <tr>
                    <td>Identificación:</td>
                    <td>
                        <input type="text" name="identificacion" value="<%= usuario.getIdentificacion() != null ? usuario.getIdentificacion() : "" %>" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Nombres:</td>
                    <td>
                        <input type="text" name="nombre" value="<%= usuario.getNombre() != null ? usuario.getNombre() : "" %>" required>
                    </td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td>
                        <input type="text" name="apellido" value="<%= usuario.getApellido() != null ? usuario.getApellido() : "" %>" required>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <input type="email" name="email" value="<%= usuario.getEmail() != null ? usuario.getEmail() : "" %>" required>
                    </td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <input type="text" name="usuario" value="<%= usuario.getUsuario() != null ? usuario.getUsuario() : "" %>" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Perfil ID:</td>
                    <td>
                        <input type="text" name="idperfil" value="<%= usuario.getIdperfil() %>" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Nueva Contraseña:</td>
                    <td>
                        <input type="password" name="nuevaClave" placeholder="Dejar en blanco para no cambiar">
                    </td>
                </tr>
                <tr>
                    <td>Confirmar Contraseña:</td>
                    <td>
                        <input type="password" name="confirmarClave" placeholder="Repetir nueva contraseña">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="btn-container">
                        <input type="submit" value="Actualizar Perfil">
                        <input type="button" value="Cancelar" onclick="history.back()">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>