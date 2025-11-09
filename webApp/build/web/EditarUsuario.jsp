<%-- 
    Document   : EditarUsuario
    Created on : 2/10/2025, 4:20:43 p. m.
    Author     : Usuario
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Editar Usuario</title>
 </head>
 <body>

 <%
    // Obtener el usuario por su ID
    UsuarioDAO udao = new UsuarioDAO();
    int id = Integer.parseInt(request.getParameter("id"));
    Usuario a = udao.listarUsuarios_Id(id);
 %>

 <h2>Editar Usuario</h2>
 <form id="form1" name="form1" method="post" action="editarUsuario">
   <table border="1" cellpadding="6">
     <tr>
       <td>Identificación</td>
       <td>
         <input type="hidden" name="cidd" value="<%=id%>"/>
         <input type="text" name="cid" id="cid" value="<%=a.getIdentificacion()%>" required/>
       </td>
     </tr>
     <tr>
       <td>Nombres</td>
       <td><input name="cnombre" type="text" id="cnombre" size="40" value="<%=a.getNombre()%>" required/></td>
     </tr>
     <tr>
       <td>Apellidos</td>
       <td><input name="capellido" type="text" id="capellido" size="40" value="<%=a.getApellido()%>" required/></td>
     </tr>
     <tr>
       <td>E-mail</td>
       <td><input name="cmail" type="email" id="cmail" size="60" value="<%=a.getEmail()%>" required/></td>
     </tr>
     <tr>
       <td>Usuario</td>
       <td><input type="text" name="cusuario" id="cusuario" value="<%=a.getUsuario()%>" required/></td>
     </tr>
     <tr>
       <td>Clave</td>
       <td><input type="password" name="cclave" id="cclave" value="<%=a.getClave()%>" required/></td>
     </tr>
     <tr>
       <td>Perfil</td>
       <td><input type="text" name="cperfil" id="cperfil" value="<%=a.getIdperfil()%>" required/></td>
     </tr>
     <tr>
       <td colspan="2" style="text-align:center;">
         <input type="submit" value="Actualizar"/>
         <input type="button" value="Cancelar" onclick="window.location='listaUsuarios.jsp'"/>
       </td>
     </tr>
   </table>
 </form>

 </body>
</html>
