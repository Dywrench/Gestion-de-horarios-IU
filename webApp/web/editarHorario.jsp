<%@page import="modelo.Horario"%>
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
            max-width: 600px;
            margin: 0 auto;
            padding: 25px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #92400e;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        td {
            padding: 10px;
        }
        input[type="text"], input[type="time"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        input[type="submit"],
        input[type="button"] {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
            margin: 5px;
        }
        input[type="submit"] { background: #f59e0b; }
        input[type="button"] { background: #6b7280; }
        input[type="submit"]:hover { background: #b45309; }
        input[type="button"]:hover { background: #4b5563; }
        .error { color: red; text-align: center; margin-bottom: 15px; }
    </style>
</head>
<body>

<%
    // Verificar sesión
    HttpSession sesion = request.getSession(false);
    String nUsuario = (sesion != null) ? (String) sesion.getAttribute("nUsuario") : null;
    if (nUsuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Cargar usuario
    UsuarioDAO udao = new UsuarioDAO();
    Usuario usuario = udao.obtenerUsuarioPorUsername(nUsuario);
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Obtener horario desde el servlet
    Horario h = (Horario) request.getAttribute("horario");
    if (h == null) {
        response.sendRedirect("HorarioServlet?accion=listar");
        return;
    }

    // Mensaje de error (si viene desde el servlet)
    String mensajeError = (String) request.getAttribute("mensajeError");
%>

<div class="container">
    <h2>Editar Horario</h2>

    <% if (mensajeError != null) { %>
        <p class="error"><%= mensajeError %></p>
    <% } %>

    <form method="post" action="HorarioServlet">
        <input type="hidden" name="id" value="<%=h.getId()%>"/>
        <table>
            <tr>
                <td>Día:</td>
                <td><input type="text" name="dia" value="<%=h.getDia()%>" required/></td>
            </tr>
            <tr>
                <td>Hora Inicio:</td>
                <td><input type="time" name="horaInicio" value="<%=h.getHoraInicio()%>" required/></td>
            </tr>
            <tr>
                <td>Hora Fin:</td>
                <td><input type="time" name="horaFin" value="<%=h.getHoraFin()%>" required/></td>
            </tr>
            <tr>
                <td>Materia:</td>
                <td><input type="text" name="materia" value="<%=h.getMateria()%>" required/></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" value="Actualizar"/>
                    <input type="button" value="Cancelar" onclick="window.location='HorarioServlet?accion=listar'"/>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
