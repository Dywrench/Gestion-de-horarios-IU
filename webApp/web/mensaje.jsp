<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 30px 40px;
            text-align: center;
            max-width: 400px;
            animation: fadeIn 0.6s ease-in-out;
        }
        h2 {
            margin-bottom: 20px;
        }
        .success {
            color: #1b8b3a;
        }
        .error {
            color: #c62828;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            transition: background 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>
    <div class="card">
        <%
            String msg = request.getParameter("msg");
            boolean esError = msg != null && msg.toLowerCase().contains("error");
        %>
        <h2 class="<%= esError ? "error" : "success" %>">
            <%= msg != null ? msg : "Operación completada" %>
        </h2>
        <button onclick="history.back()">Volver</button>
    </div>
</body>
</html>
