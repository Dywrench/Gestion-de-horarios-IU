<%-- 
    Document   : eliminarUsuario
    Created on : 23/10/2025
    Author     : Usuario
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Usuario</title>
</head>
<body>

<%
    // Obtener el parámetro desde la URL
    String idParam = request.getParameter("iddato");
    int id = 0;

    if (idParam == null || idParam.trim().isEmpty()) {
%>
        <h2>Error: No se recibió el parámetro 'iddato'</h2>
        <a href="listaUsuarios.jsp">Volver al listado</a>
<%
    } else {
        try {
            id = Integer.parseInt(idParam);

            UsuarioDAO udao = new UsuarioDAO();
            Usuario u = udao.listarUsuarios_Id(id);

            if (u.getIddato() == 0) {
%>
                <h2>Usuario no encontrado</h2>
                <a href="listaUsuarios.jsp">Volver al listado</a>
<%
            } else {
%>

                <h2>¿Seguro que deseas eliminar este usuario?</h2>
                <table border="1" cellpadding="6">
                    <tr><th>ID</th><td><%= u.getIddato() %></td></tr>
                    <tr><th>Identificación</th><td><%= u.getIdentificacion() %></td></tr>
                    <tr><th>Nombre</th><td><%= u.getNombre() %> <%= u.getApellido() %></td></tr>
                    <tr><th>Email</th><td><%= u.getEmail() %></td></tr>
                    <tr><th>Usuario</th><td><%= u.getUsuario() %></td></tr>
                    <tr><th>Perfil</th><td><%= u.getIdperfil() %></td></tr>
                </table>

                <br>

                <form action="EliminarUsuario" method="post">
                    <!-- Enviamos el iddato al servlet -->
                    <input type="hidden" name="id" value="<%= u.getIddato() %>"/>
                    <input type="submit" value="Eliminar" 
                        onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');"/>
                    <input type="button" value="Cancelar" onclick="window.location='listaUsuarios.jsp'"/>
                </form>
<%
            }
        } catch (NumberFormatException ex) {
%>
            <h2>Error: el parámetro 'iddato' no es válido.</h2>
            <a href="listaUsuarios.jsp">Volver al listado</a>
<%
        }
    }
%>

</body>
</html>
