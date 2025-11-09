<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tarea de Ciencias</title>

    <style>
        body{margin:0;padding:0;background:#e6ecf5;font-family:"Segoe UI",Arial,sans-serif;}
        .card{max-width:600px;margin:60px auto;background:#fff;padding:30px;border-radius:12px;box-shadow:0 0 14px rgba(0,0,0,0.12);}
        h1{text-align:center;margin-bottom:10px;color:#333;}
        p.subtitulo{text-align:center;color:#555;margin-top:0;font-size:16px;}
        .pregunta{margin-top:30px;font-size:20px;color:#333;text-align:center;}
        input{width:300px;padding:10px;margin:20px auto;display:block;font-size:18px;text-align:center;border-radius:6px;border:1px solid #bbb;}
        button{background:#4a8ef2;color:#fff;font-size:18px;padding:12px 20px;border:none;border-radius:6px;cursor:pointer;margin:0 auto;display:block;}
        button:hover{background:#3b7cdc;}
        .resultado{text-align:center;margin-top:25px;font-size:18px;font-weight:bold;}
    </style>

    <script>
        function verificar() {
            let respuesta = document.getElementById("respuesta").value.trim().toLowerCase();
            let res = document.getElementById("resultado");

            if (respuesta === "fotosíntesis" || respuesta === "fotosintesis") {
                res.style.color = "green";
                res.innerHTML = "✅ ¡Correcto! Las plantas producen su alimento por fotosíntesis.";
            } else {
                res.style.color = "red";
                res.innerHTML = "❌ Incorrecto. Es la fotosíntesis.";
            }
        }
    </script>
</head>

<body>
<div class="card">
    <h1>Tarea de Ciencias Naturales</h1>
    <p class="subtitulo">Responde la siguiente pregunta</p>

    <div class="pregunta">
        ¿Cómo se llama el proceso mediante el cual las plantas producen su alimento?
    </div>

    <input type="text" id="respuesta" placeholder="Escribe tu respuesta">
    <button onclick="verificar()">Enviar Respuesta</button>

    <div id="resultado" class="resultado"></div>
</div>
</body>
</html>
