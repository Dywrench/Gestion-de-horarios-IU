<%-- 
    Document   : listaUsuarios
    Created on : 2/10/2025, 4:20:55 p. m.
    Author     : Usuario
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
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

        table {
            width: 95%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #1976d2;
            color: #fff;
            text-transform: uppercase;
            font-size: 0.9em;
            padding: 12px;
            letter-spacing: 0.5px;
        }

        td {
            text-align: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #e3f2fd;
        }

        a {
            text-decoration: none;
            font-weight: 600;
            color: #1565c0;
            transition: 0.3s;
        }

        a:hover {
            color: #0d47a1;
        }

        .acciones a {
            margin: 0 6px;
            padding: 6px 12px;
            border-radius: 6px;
            color: #fff;
        }

        .acciones a:first-child {
            background-color: #42a5f5;
        }

        .acciones a:first-child:hover {
            background-color: #1e88e5;
        }

        .acciones a:last-child {
            background-color: #ef5350;
        }

        .acciones a:last-child:hover {
            background-color: #d32f2f;
        }

        .volver {
            display: block;
            width: fit-content;
            margin: 30px auto;
            text-decoration: none;
            background-color: #1565c0;
            color: white;
            padding: 10px 25px;
            border-radius: 8px;
            transition: 0.3s;
            font-weight: bold;
        }

        .volver:hover {
            background-color: #0d47a1;
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
    <h2>Listado de Datos de Usuarios</h2>

    <table>
        <tr>
            <th>Identificación</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>E-mail</th>
            <th>Usuario</th>
            <th>Contraseña</th>
            <th>Perfil</th>
            <th>Acción</th>
        </tr>
        <%
            UsuarioDAO udao = new UsuarioDAO();
            List<Usuario> lista = udao.listadoUsuarios();
            for(Usuario a : lista){
        %>
        <tr>
            <td><%= a.getIdentificacion() %></td>
            <td><%= a.getNombre() %></td>
            <td><%= a.getApellido() %></td>
            <td><%= a.getEmail() %></td>
            <td><%= a.getUsuario() %></td>
            <td><%= a.getClave() %></td>
            <td><%= a.getIdperfil() %></td>
            <td class="acciones">
                <a href="EditarUsuario.jsp?id=<%= a.getIddato() %>">Editar</a>
                <a href="eliminarUsuario.jsp?iddato=<%= a.getIddato() %>">Eliminar</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>


    <footer>© 2025 Sistema de Gestión de Usuarios</footer>
</body>
</html>
