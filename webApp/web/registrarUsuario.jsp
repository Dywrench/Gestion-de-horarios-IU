<%-- 
    Document   : registrarUsuario
    Created on : 22/10/2025
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registrar Usuario</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        h2 {
            color: #333;
            margin-top: 30px;
        }
        form {
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 400px;
        }
        table {
            width: 100%;
        }
        td {
            padding: 8px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 95%;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            margin: 10px 5px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
        input[type="submit"] {
            background-color: #007bff;
        }
        input[type="reset"] {
            background-color: #6c757d;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        input[type="reset"]:hover {
            background-color: #5a6268;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Formulario de Registro de Usuario</h2>

    <form id="form1" name="form1" method="post" action="controladorUsuario">
        <table>
            <tr>
                <td>Identificación:</td>
                <td><input type="text" name="cidentificacion" required></td>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td><input type="text" name="cnombre" required></td>
            </tr>
            <tr>
                <td>Apellido:</td>
                <td><input type="text" name="capellido" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="cmail" required></td>
            </tr>
            <tr>
                <td>Teléfono:</td>
                <td><input type="text" name="ctelefono" required></td>
            </tr>
            <tr>
                <td>Usuario:</td>
                <td><input type="text" name="cusuario" required></td>
            </tr>
            <tr>
                <td>Clave:</td>
                <td><input type="password" name="cclave" required></td>
            </tr>
            <tr>
                <td>Perfil (ID):</td>
                <td><input type="number" name="cidperfil" required></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" value="Registrar">
                    <input type="reset" value="Limpiar">
                </td>
            </tr>
        </table>
    </form>

    <p><a href="index.jsp">← Volver al menú principal</a></p>
</body>
</html>
