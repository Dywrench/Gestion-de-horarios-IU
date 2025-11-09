// ActualizarPerfil.java
package controlador;
import modelo.Usuario;
import modelo.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ActualizarPerfil")
public class ActualizarPerfil extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession(false);
        String nUsuario = (sesion != null) ? (String) sesion.getAttribute("nUsuario") : null;
        
        if (nUsuario == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        try {
            // Obtener parámetros del formulario
            String identificacion = request.getParameter("identificacion");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            String nuevaClave = request.getParameter("nuevaClave");
            String confirmarClave = request.getParameter("confirmarClave");
            
            // Validar contraseñas si se están cambiando
            if (nuevaClave != null && !nuevaClave.trim().isEmpty()) {
                if (!nuevaClave.equals(confirmarClave)) {
                    response.sendRedirect("config.jsp?error=Las contraseñas no coinciden");
                    return;
                }
            }
            
            // Obtener usuario actual
            UsuarioDAO udao = new UsuarioDAO();
            Usuario usuarioActual = udao.obtenerUsuarioPorUsername(nUsuario);
            
            // Actualizar datos
            usuarioActual.setNombre(nombre);
            usuarioActual.setApellido(apellido);
            usuarioActual.setEmail(email);
            
            // Actualizar contraseña solo si se proporcionó una nueva
            if (nuevaClave != null && !nuevaClave.trim().isEmpty()) {
                usuarioActual.setClave(nuevaClave);
            }
            
            // Ejecutar actualización
            int resultado = udao.actualizarUsuarios(usuarioActual);
            
            if (resultado > 0) {
                response.sendRedirect("config.jsp?success=Los datos se actualizaron correctamente");
            } else {
                response.sendRedirect("config.jsp?error=Error al actualizar el perfil");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("config.jsp?error=Error del sistema: " + e.getMessage());
        }
    }
}