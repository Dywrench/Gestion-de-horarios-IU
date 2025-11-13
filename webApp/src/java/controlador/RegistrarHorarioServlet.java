package controlador;

import modelo.Horario;
import modelo.HorarioDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegistrarHorarioServlet")
public class RegistrarHorarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener los parámetros del formulario
        String dia = request.getParameter("dia");
        String horaInicio = request.getParameter("hora_inicio");
        String horaFin = request.getParameter("hora_fin");
        String materia = request.getParameter("materia");

        // Crear objeto Horario con los datos recibidos
        Horario h = new Horario();
        h.setDia(dia);
        h.setHoraInicio(horaInicio);
        h.setHoraFin(horaFin);
        h.setMateria(materia);

        // Llamar al DAO para registrar el horario
        HorarioDAO dao = new HorarioDAO();
        boolean registrado = dao.registrarHorario(h);

        if (registrado) {
            // Redirigir a mostrar horario con mensaje de éxito
            request.setAttribute("mensaje", "✅ Horario registrado correctamente.");
            request.getRequestDispatcher("mostrarHorario.jsp").forward(request, response);
        } else {
            // Mostrar error
            request.setAttribute("mensaje", "❌ Error al registrar el horario.");
            request.getRequestDispatcher("registrarHorario.jsp").forward(request, response);
        }
    }
}