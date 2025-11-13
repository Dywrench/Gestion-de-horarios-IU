<%@page import="modelo.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Horario</title>
<style>
body { font-family: Arial; background-color: #f3f4f6; margin:0; padding:40px; }
.container { background:#fff; max-width:600px; margin:0 auto; padding:25px 40px; border-radius:12px; box-shadow:0 4px 10px rgba(0,0,0,0.1); }
h2 { text-align:center; color:#92400e; margin-bottom:20px; }
table { width:100%; border-collapse:collapse; margin-top:15px; }
td { padding:10px; }
select, input[type="time"] { width:100%; padding:8px; border:1px solid #ccc; border-radius:8px; }
input[type="submit"], input[type="button"] { padding:10px 20px; border:none; border-radius:8px; color:white; cursor:pointer; margin:5px; }
input[type="submit"] { background:#f59e0b; } 
input[type="button"] { background:#6b7280; }
input[type="submit"]:hover { background:#b45309; } 
input[type="button"]:hover { background:#4b5563; }
.error { color:red; text-align:center; margin-bottom:15px; }
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
    <input type="hidden" name="accion" value="actualizar"/>
    <input type="hidden" name="id" value="<%=h.getId()%>"/>
    <table>
        <tr>
            <td>Día:</td>
            <td>
                <select name="dia" required>
                    <option value="">Seleccione un día</option>
                    <option value="Lunes" <%= "Lunes".equals(h.getDia()) ? "selected" : "" %>>Lunes</option>
                    <option value="Martes" <%= "Martes".equals(h.getDia()) ? "selected" : "" %>>Martes</option>
                    <option value="Miércoles" <%= "Miércoles".equals(h.getDia()) ? "selected" : "" %>>Miércoles</option>
                    <option value="Jueves" <%= "Jueves".equals(h.getDia()) ? "selected" : "" %>>Jueves</option>
                    <option value="Viernes" <%= "Viernes".equals(h.getDia()) ? "selected" : "" %>>Viernes</option>
                </select>
            </td>
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
            <td>
                <select name="materia" required>
                    <option value="">Seleccione una materia</option>
                    <option value="Matemáticas" <%= "Matemáticas".equals(h.getMateria()) ? "selected" : "" %>>Matemáticas</option>
                    <option value="Programación" <%= "Programación".equals(h.getMateria()) ? "selected" : "" %>>Programación</option>
                    <option value="Bases de Datos" <%= "Bases de Datos".equals(h.getMateria()) ? "selected" : "" %>>Bases de Datos</option>
                    <option value="Ingeniería de Software" <%= "Ingeniería de Software".equals(h.getMateria()) ? "selected" : "" %>>Ingeniería de Software</option>
                    <option value="Sistemas Operativos" <%= "Sistemas Operativos".equals(h.getMateria()) ? "selected" : "" %>>Sistemas Operativos</option>
                    <option value="Redes" <%= "Redes".equals(h.getMateria()) ? "selected" : "" %>>Redes</option>
                    <option value="Ética Profesional" <%= "Ética Profesional".equals(h.getMateria()) ? "selected" : "" %>>Ética Profesional</option>
                </select>
            </td>
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
