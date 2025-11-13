<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Usuario</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            width: 400px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 12px 25px;
            margin: 10px 5px;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"] {
            background-color: #007bff;
        }

        input[type="reset"] {
            background-color: #6c757d;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="reset"]:hover {
            background-color: #5a6268;
        }

        .btn-group {
            text-align: center;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h2>Registro de Usuario</h2>

    <form method="post" action="controladorUsuario">
        <div class="form-group">
            <label for="cidentificacion">Identificación</label>
            <input type="text" id="cidentificacion" name="cidentificacion" placeholder="Ingrese su identificación" required>
        </div>

        <div class="form-group">
            <label for="cnombre">Nombre</label>
            <input type="text" id="cnombre" name="cnombre" placeholder="Ingrese su nombre" required>
        </div>

        <div class="form-group">
            <label for="capellido">Apellido</label>
            <input type="text" id="capellido" name="capellido" placeholder="Ingrese su apellido" required>
        </div>

        <div class="form-group">
            <label for="cmail">Email</label>
            <input type="email" id="cmail" name="cmail" placeholder="correo@ejemplo.com" required>
        </div>

        <div class="form-group">
            <label for="ctelefono">Teléfono</label>
            <input type="text" id="ctelefono" name="ctelefono" placeholder="Ej: 3001234567" required>
        </div>

        <div class="form-group">
            <label for="cusuario">Usuario</label>
            <input type="text" id="cusuario" name="cusuario" placeholder="Nombre de usuario" required>
        </div>

        <div class="form-group">
            <label for="cclave">Clave</label>
            <input type="password" id="cclave" name="cclave" placeholder="Contraseña segura" required>
        </div>

        <div class="form-group">
            <label for="cidperfil">Perfil (ID)</label>
            <input type="number" id="cidperfil" name="cidperfil" placeholder="1=Admin, 2=Usuario" required>
        </div>

        <div class="btn-group">
            <input type="submit" value="Registrar">
            <input type="reset" value="Limpiar">
        </div>
    </form>

</body>
</html>
