<%@page import="java.util.List"%>
<%@page import="modelo.Horario"%>
<%@page import="modelo.HorarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Editar Horario</title>
  <style>
    body { 
        font-family: Arial, sans-serif; 
        background-color: #f3f4f6; 
        margin: 0; 
        padding: 40px; 
    }
    .container { 
        background: #fff; 
        max-width: 900px; 
        margin: 0 auto; 
        padding: 25px 40px; 
        border-radius: 12px; 
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
    }
    h2 { 
        text-align: center; 
        color: #065f46; 
    }
    table { 
        width: 100%; 
        border-collapse: collapse; 
        margin-top: 15px; 
    }
    th, td { 
        padding: 10px; 
        border-bottom: 1px solid #e5e7eb; 
        text-align: center; 
    }
    th { 
        background-color: #10b981; 
        color: white; 
    }
    tr:nth-child(even) { 
        background: #f9fafb; 
    }
  </style>
</head>
<body>

<%
    // Verificar sesión
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("nUsuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String nUsuario = (String) sesion.getAttribute("nUsuario");

    // Obtener el rol del usuario
    UsuarioDAO udao = new UsuarioDAO();
  Usuario usuario = udao.obtenerUsuarioPorUsername(nUsuario);
  int idPerfil = (usuario != null) ? usuario.getIdperfil() : 3; // Por defecto estudiante



    // Cargar horarios
    HorarioDAO hdao = new HorarioDAO();
    List<Horario> lista = hdao.listarTodos();
%>

<div class="container">
  <h2>Horario General</h2>

  <table>
    <tr>
      <th>ID</th>
      <th>Día</th>
      <th>Hora Inicio</th>
      <th>Hora Fin</th>
      <th>Materia</th>
      <% if (idPerfil == 1 || idPerfil == 2) { %> 
        <th>Acciones</th>
      <% } %>
    </tr>

    <% for (Horario h : lista) { %>
      <tr>
        <td><%= h.getId() %></td>
        <td><%= h.getDia() %></td>
        <td><%= h.getHoraInicio() %></td>
        <td><%= h.getHoraFin() %></td>
        <td><%= h.getMateria() %></td>

        <% if (idPerfil == 1 || idPerfil == 2) { %> 
          <td>
            <a href="HorarioServlet?accion=editar&id=<%= h.getId() %>">Editar</a> |
            <a href="HorarioServlet?accion=eliminar&id=<%= h.getId() %>" 
               onclick="return confirm('¿Estás seguro de que deseas eliminar este horario?');">
               Eliminar
            </a>
          </td>
        <% } %>
      </tr>
    <% } %>
  </table>

</div>

</body>
</html>
