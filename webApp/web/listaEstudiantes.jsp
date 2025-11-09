<%-- 
    Document   : listaEstudiantes
    Created on : 2/10/2025
    Author     : Usuario
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Estudiantes</title>
</head>
<body>
    <h2>Listado de Estudiantes con Código</h2>

    <table border="1" cellpadding="6">
        <tr>
            <th>Código</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>E-mail</th>
            <th>Usuario</th>
            <th>Perfil</th>
        </tr>

        <%
            UsuarioDAO udao = new UsuarioDAO();
            List<Usuario> lista = udao.listadoUsuarios();

            for (Usuario est : lista) {

                // Mostrar solo los que tienen código (no nulo y no vacío)
                if (est.getIdentificacion() != null && !est.getIdentificacion().isEmpty()) {
        %>

        <tr>
            <td><%= est.getIdentificacion() %></td>
            <td><%= est.getNombre() %></td>
            <td><%= est.getApellido() %></td>
            <td><%= est.getEmail() %></td>
            <td><%= est.getUsuario() %></td>
            <td><%= est.getIdperfil() %></td>
        </tr>

        <%
                }
            }
        %>

    </table>
</body>
</html>
