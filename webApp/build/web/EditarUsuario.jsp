<%-- 
    Document   : EditarUsuario
    Created on : 2/10/2025, 4:20:43 p. m.
    Author     : Usuario
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #1565c0;
            margin-bottom: 30px;
        }

        form {
            width: 70%;
            max-width: 700px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            vertical-align: middle;
        }

        td:first-child {
            font-weight: bold;
            color: #1565c0;
            width: 30%;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 95%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #1565c0;
            outline: none;
        }

        .botones {
            text-align: center;
            padding-top: 20px;
        }

        input[type="submit"],
        input[type="button"] {
            background-color: #1565c0;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            margin: 0 10px;
            transition: background-color 0.3s;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #0d47a1;
        }

        input[type="button"] {
            background-color: #e53935;
        }

        input[type="button"]:hover {
            background-color: #c62828;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            color: #777;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<%
    // Obtener el usuario por su ID
    UsuarioDAO udao = new UsuarioDAO();
    int id = Integer.parseInt(request.getParameter("id"));
    Usuario a = udao.listarUsuarios_Id(id);
%>

<h2>Editar Usuario</h2>

<form id="form1" name="form1" method="post" action="editarUsuario">
    <table>
        <tr>
            <td>Identificación</td>
            <td>
                <input type="hidden" name="cidd" value="<%=id%>"/>
                <input type="text" name="cid" id="cid" value="<%=a.getIdentificacion()%>" required/>
            </td>
        </tr>
        <tr>
            <td>Nombres</td>
            <td><input name="cnombre" type="text" id="cnombre" value="<%=a.getNombre()%>" required/></td>
        </tr>
        <tr>
            <td>Apellidos</td>
            <td><input name="capellido" type="text" id="capellido" value="<%=a.getApellido()%>" required/></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td><input name="cmail" type="email" id="cmail" value="<%=a.getEmail()%>" required/></td>
        </tr>
        <tr>
            <td>Usuario</td>
            <td><input type="text" name="cusuario" id="cusuario" value="<%=a.getUsuario()%>" required/></td>
        </tr>
        <tr>
            <td>Clave</td>
            <td><input type="password" name="cclave" id="cclave" value="<%=a.getClave()%>" required/></td>
        </tr>
        <tr>
            <td>Perfil</td>
            <td><input type="text" name="cperfil" id="cperfil" value="<%=a.getIdperfil()%>" required/></td>
        </tr>
    </table>

    <div class="botones">
        <input type="submit" value="Actualizar"/>
        <input type="button" value="Cancelar" onclick="window.location='listaUsuarios.jsp'"/>
    </div>
</form>

<footer>© 2025 Sistema de Gestión de Usuarios</footer>

</body>
</html>
