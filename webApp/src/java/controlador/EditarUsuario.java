/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 * Servlet para actualizar los datos de un usuario existente
 * @author Usuario
 */
@WebServlet(name = "EditarUsuario", urlPatterns = {"/editarUsuario"})
public class EditarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("cidd"));
            String identificacion = new String(request.getParameter("cid").getBytes("ISO-8859-1"), "UTF-8");
            String nombre = new String(request.getParameter("cnombre").getBytes("ISO-8859-1"), "UTF-8");
            String apellido = new String(request.getParameter("capellido").getBytes("ISO-8859-1"), "UTF-8");
            String email = new String(request.getParameter("cmail").getBytes("ISO-8859-1"), "UTF-8");
            String usuario = new String(request.getParameter("cusuario").getBytes("ISO-8859-1"), "UTF-8");
            String clave = new String(request.getParameter("cclave").getBytes("ISO-8859-1"), "UTF-8");
            int idperfil = Integer.parseInt(request.getParameter("cperfil"));

            Usuario a = new Usuario();
            a.setIddato(id);
            a.setIdentificacion(identificacion);
            a.setNombre(nombre);
            a.setApellido(apellido);
            a.setEmail(email);
            a.setUsuario(usuario);
            a.setClave(clave);
            a.setIdperfil(idperfil);

            UsuarioDAO udao = new UsuarioDAO();
            int status = udao.actualizarUsuarios(a);

            if (status > 0) {
                response.sendRedirect("listaUsuarios.jsp");
            } else {
                response.getWriter().println("<h3>Error: No se pudo actualizar el usuario.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error al procesar la solicitud: " + e.getMessage() + "</h3>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet que actualiza los datos de un usuario";
    }
}
