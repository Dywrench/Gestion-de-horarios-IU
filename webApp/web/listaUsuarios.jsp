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
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Usuarios</title>
</head>
<body>
    <h2>Listado de Datos de usuarios</h2>
    <table border="1" cellpadding="6">
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
            <td>
                <a href="EditarUsuario.jsp?id=<%= a.getIddato() %>">Editar</a> |
                <a href="eliminarUsuario.jsp?iddato=<%= a.getIddato() %>">Eliminar</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
