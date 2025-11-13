<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>Registrar Horario</title>
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
      color: #1e3a8a;
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
    input[type="submit"], input[type="button"] {
      padding: 10px 20px;
      border: none;
      border-radius: 8px;
      color: white;
      cursor: pointer;
      font-weight: bold;
      margin: 5px;
    }
    input[type="submit"] {
      background-color: #2563eb;
    }
    input[type="button"] {
      background-color: #6b7280;
    }
    input[type="submit"]:hover {
      background-color: #1e40af;
    }
    input[type="button"]:hover {
      background-color: #4b5563;
    }
  </style>
 </head>
 <body>

 <div class="container">
   <h2>Registrar Horario</h2>

   <% if (request.getParameter("error") != null) { %>
     <p style="color:red; text-align:center;"><%= request.getParameter("error") %></p>
   <% } else if (request.getParameter("success") != null) { %>
     <p style="color:green; text-align:center;"><%= request.getParameter("success") %></p>
   <% } %>

   <form method="post" action="HorarioServlet">
     <input type="hidden" name="accion" value="insertar"/>
     <table>
       <tr><td>Día:</td><td><input type="text" name="dia" required/></td></tr>
       <tr><td>Hora Inicio:</td><td><input type="time" name="horaInicio" required/></td></tr>
       <tr><td>Hora Fin:</td><td><input type="time" name="horaFin" required/></td></tr>
       <tr><td>Materia:</td><td><input type="text" name="materia" required/></td></tr>
       <tr>
         <td colspan="2" style="text-align:center;">
           <input type="submit" value="Registrar"/>
           <input type="button" value="Cancelar" onclick="window.location='verHorarios.jsp'"/>
         </td>
       </tr>
     </table>
   </form>
 </div>

 </body>
</html>
