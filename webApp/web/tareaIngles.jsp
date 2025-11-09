<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tarea de Inglés</title>

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
            let r = document.getElementById("respuesta").value.trim().toLowerCase();
            let out = document.getElementById("resultado");

            if (r === "cat") {
                out.style.color = "green";
                out.innerHTML = "✅ Correct! “Gato” in English is “cat”.";
            } else {
                out.style.color = "red";
                out.innerHTML = "❌ Incorrect. La traducción correcta es “cat”.";
            }
        }
    </script>
</head>

<body>
<div class="card">
    <h1>Tarea de Inglés</h1>
    <p class="subtitulo">Traduce la siguiente palabra</p>

    <div class="pregunta">
        ¿Cómo se dice <strong>“gato”</strong> en inglés?
    </div>

    <input type="text" id="respuesta" placeholder="Escribe la traducción">
    <button onclick="verificar()">Enviar Respuesta</button>
    <div id="resultado" class="resultado"></div>
</div>
</body>
</html>
