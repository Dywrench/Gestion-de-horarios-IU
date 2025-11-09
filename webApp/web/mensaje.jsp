<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado</title>
</head>
<body>
    <h2><%= request.getParameter("msg") != null ? request.getParameter("msg") : "Operación completada" %></h2>
    <p><a href="index.jsp">Volver al menú principal</a></p>
</body>
</html>
