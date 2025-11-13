<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="modelo.Conexion" %>

<%
    //  Evitar que las páginas se guarden en caché
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Recuperar la sesión del usuario
    HttpSession sesion_cli = request.getSession(false);
    String nUsuario = (String) (sesion_cli != null ? sesion_cli.getAttribute("nUsuario") : null);

    // Si no hay sesión activa → redirigir al login

    if (nUsuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Variables del usuario
    Connection con = null;
    Statement sentencia = null;
    ResultSet resultado = null;
    String nombre = "";
    String apellido = "";

    try {
        Conexion cn = new Conexion();
        con = cn.crearConexion();
        sentencia = con.createStatement();
        resultado = sentencia.executeQuery("SELECT * FROM datos WHERE usuario='" + nUsuario + "'");
        if (resultado.next()) {
            nombre = resultado.getString("nombre");
            apellido = resultado.getString("apellido");
        }
        resultado.close();
        sentencia.close();
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error cargando usuario: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel de Control</title>
    <style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background-color: #f4f6f8;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        height: 100vh;
        overflow: hidden;
    }

    /* Header */
    #header {
        width: 98%;
        height: 60px;
        background-color: #007bff;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
        flex-shrink: 0;
    }

    #header strong {
        font-size: 18px;
    }

    .usuario {
        font-weight: bold;
        color: #ffd700;
    }

    .cerrar {
        color: white;
        text-decoration: underline;
        margin-left: 15px;
    }

    .cerrar:hover {
        color: #ffb300;
    }

    /* Layout principal */
    #main-container {
        display: flex;
        flex: 1;
        overflow: hidden;
    }

    /* Menú lateral */
    #menu {
        width: 250px;
        background-color: #fff;
        border-right: 1px solid #ccc;
        overflow-y: auto;
        flex-shrink: 0;
    }

    /* Contenido principal */
    #contenido {
        flex: 1;
        background-color: #f4f6f8;
        padding: 20px;
        overflow: auto;
    }

    /* Estilos de la tabla del menú */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        background-color: #007bff;
        color: white;
        padding: 10px;
        font-size: 16px;
    }

    td {
        text-align: center;
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    td a {
        text-decoration: none;
        color: #007bff;
        display: block;
        width: 100%;
    }

    td a:hover {
        background-color: #e0ebff;
    }

    /* Iframe */
    iframe {
        width: 100%;
        height: 100%;
        border: none;
        background-color: white;
    }
</style>
</head>
<body>

    <div id="header">
        <div><strong>Panel de Control</strong></div>
        <div>
            Bienvenido, <span class="usuario"><%= nombre %> <%= apellido %></span> |
            <a href="CerrarSesion" class="cerrar">Cerrar sesión</a>
        </div>
    </div>

    <!-- Aquí se agrega el contenedor principal -->
    <div id="main-container">
        <div id="menu">
            <table>
                <tr><th>Menú</th></tr>
                <%
                    try {
                        Conexion cn1 = new Conexion();
                        con = cn1.crearConexion();
                        sentencia = con.createStatement();

                        String query = "SELECT actividades.nom_actividad AS actividad, " +
                                       "actividades.enlace AS enlace,actividades.id_actividad AS idAct " +
                                       "FROM datos, actividades, gesActividad, perfiles " +
                                       "WHERE gesActividad.id_actividad = actividades.id_actividad " +
                                       "AND gesActividad.id_perfil = perfiles.id_perfil " +
                                       "AND datos.id_perfil = perfiles.id_perfil " +
                                       "AND datos.usuario = '" + nUsuario + "'";

                        resultado = sentencia.executeQuery(query);

                        boolean hayActividades = false;

                        while (resultado.next()) {
                            hayActividades = true;
                %>
                            <tr>
                                <td><a href="<%=resultado.getString("enlace")%>?id=<%=resultado.getInt("idAct")%>"
                                     target="marco"> <%=resultado.getString("actividad")%></a>
                                </td>
                            </tr>

                <%
                        }

                        if (!hayActividades) {
                %>
                            <tr><td>No hay actividades asignadas.</td></tr>
                <%
                        }

                        resultado.close();
                        sentencia.close();
                        con.close();
                    } catch (Exception e) {
                        out.println("<tr><td style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </table>
        </div>
        <div id="contenido">
            <iframe name="marco" src="front.jsp"></iframe>
        </div>
    </div> <!-- Cierre de main-container -->
        
</body>
</html>
 