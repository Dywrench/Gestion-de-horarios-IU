<%@page import="modelo.Horario"%>
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
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #92400e;
        margin-top: 0;
        margin-bottom: 25px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        padding: 10px;
        vertical-align: middle;
    }

    input[type="text"],
    input[type="time"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box;
    }

    input[type="submit"],
    input[type="button"] {
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        color: white;
        cursor: pointer;
        margin: 10px 5px 0 5px;
        font-weight: bold;
    }

    input[type="submit"] {
        background: #f59e0b;
    }

    input[type="button"] {
        background: #6b7280;
    }

    input[type="submit"]:hover {
        background: #b45309;
    }

    input[type="button"]:hover {
        background: #4b5563;
    }

    .error {
        color: red;
        text-align: center;
        margin-bottom: 15px;
        font-weight: bold;
    }
</style>
</head>
<body>

<%
    Horario h = (Horario) request.getAttribute("horario");
    if (h == null) {
        response.sendRedirect("HorarioServlet?accion=listar");
        return;
    }
    String mensajeError = (String) request.getAttribute("mensajeError");
%>

<div class="container">
    <h2>Editar Horario</h2>

    <% if (mensajeError != null) { %>
        <p class="error"><%= mensajeError %></p>
    <% } %>

    <form method="post" action="HorarioServlet">
        <input type="hidden" name="id" value="<%= h.getId() %>"/>

        <table>
            <tr>
                <td><label for="dia">Día:</label></td>
                <td><input type="text" id="dia" name="dia" value="<%= h.getDia() %>" required/></td>
            </tr>
            <tr>
                <td><label for="horaInicio">Hora Inicio:</label></td>
                <td><input type="time" id="horaInicio" name="horaInicio" value="<%= h.getHoraInicio() %>" required/></td>
            </tr>
            <tr>
                <td><label for="horaFin">Hora Fin:</label></td>
                <td><input type="time" id="horaFin" name="horaFin" value="<%= h.getHoraFin() %>" required/></td>
            </tr>
            <tr>
                <td><label for="materia">Materia:</label></td>
                <td><input type="text" id="materia" name="materia" value="<%= h.getMateria() %>" required/></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="Actualizar"/>
                    <input type="button" value="Cancelar" onclick="window.location='HorarioServlet?accion=listar'"/>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
