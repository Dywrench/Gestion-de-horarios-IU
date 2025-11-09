package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.UsuarioDAO;

@WebServlet(name = "ControladorUsuario", urlPatterns = {"/controladorUsuario"})
public class ControladorUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Configurar codificación UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Capturar parámetros del formulario
        String identificacion = request.getParameter("cidentificacion");
        String nombre = request.getParameter("cnombre");
        String apellido = request.getParameter("capellido");
        String email = request.getParameter("cmail");
        String usuario = request.getParameter("cusuario");
        String clave = request.getParameter("cclave");
        int idperfil = Integer.parseInt(request.getParameter("cidperfil"));

        // Crear objeto Usuario
        Usuario u = new Usuario();
        u.setIdentificacion(identificacion);
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setEmail(email);
        u.setUsuario(usuario);
        u.setClave(clave);
        u.setIdperfil(idperfil);

        // Enviar al DAO
        UsuarioDAO udao = new UsuarioDAO();
        int status = udao.agregarUsuario(u);

        // Evaluar resultado
        if (status > 0) {
            // Éxito → redirige a lista o mensaje
            response.sendRedirect("mensaje.jsp?msg=Usuario registrado correctamente");
        } else {
            // Error → redirige a mensaje de error
            response.sendRedirect("mensaje.jsp?msg=Error al registrar el usuario");
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador para registrar usuarios";
    }
}
