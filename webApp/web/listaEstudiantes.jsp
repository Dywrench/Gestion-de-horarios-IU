<%-- 
    Document   : listaEstudiantes
    Created on : 2/10/2025
    Author     : Alejandra
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Estudiantes</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 40px;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #1565c0;
            margin-bottom: 30px;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        th {
            background-color: #1976d2;
            color: white;
            text-transform: uppercase;
            padding: 12px;
            letter-spacing: 0.5px;
        }

        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #e3f2fd;
        }

        a.volver {
            display: inline-block;
            margin: 30px auto 0;
            text-decoration: none;
            background-color: #1565c0;
            color: white;
            padding: 10px 25px;
            border-radius: 8px;
            transition: 0.3s;
            font-weight: bold;
        }

        a.volver:hover {
            background-color: #0d47a1;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            color: #666;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <h2>Listado de Estudiantes con Código</h2>

    <table>
        <tr>
            <th>Código</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>E-mail</th>
            <th>Usuario</th>
        </tr>

        <%
            UsuarioDAO udao = new UsuarioDAO();
            List<Usuario> lista = udao.listadoUsuarios();

            for (Usuario est : lista) {
                // Mostrar solo los que tienen código y cuyo idperfil sea 3
                if (est.getIdentificacion() != null && 
                    !est.getIdentificacion().isEmpty() && 
                    est.getIdperfil() == 3) {
        %>

        <tr>
            <td><%= est.getIdentificacion() %></td>
            <td><%= est.getNombre() %></td>
            <td><%= est.getApellido() %></td>
            <td><%= est.getEmail() %></td>
            <td><%= est.getUsuario() %></td>
        </tr>

        <%
                }
            }
        %>
    </table>

    <div style="text-align: center;">
    </div>

    <footer>© 2025 Sistema de Gestión de Estudiantes</footer>
</body>
</html>
