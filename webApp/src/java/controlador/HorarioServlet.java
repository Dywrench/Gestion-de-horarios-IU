package controlador;

import modelo.HorarioDAO;
import modelo.Horario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HorarioServlet")
public class HorarioServlet extends HttpServlet {

    private HorarioDAO dao = new HorarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "nuevo":
                request.getRequestDispatcher("registrarHorario.jsp").forward(request, response);
                break;

            case "editar":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Horario h = dao.obtenerPorId(id);
                    if (h == null) {
                        response.sendRedirect("HorarioServlet?accion=listar");
                        return;
                    }
                    request.setAttribute("horario", h);
                    request.getRequestDispatcher("editarHorario.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    response.sendRedirect("HorarioServlet?accion=listar");
                }
                break;

            case "eliminar":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    dao.eliminar(id);
                } catch (NumberFormatException e) {
                    System.out.println("ID inválido para eliminar horario.");
                }
                response.sendRedirect("HorarioServlet?accion=listar");
                break;

            default: // listar
                List<Horario> lista = dao.listarTodos();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("mostrarHorario.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String dia = request.getParameter("dia");
        String horaInicio = request.getParameter("horaInicio");
        String horaFin = request.getParameter("horaFin");
        String materia = request.getParameter("materia");

        Horario h = new Horario();
        h.setDia(dia);
        h.setHoraInicio(horaInicio);
        h.setHoraFin(horaFin);
        h.setMateria(materia);

        boolean exito;
        if (id == null || id.isEmpty()) {
            // Registrar nuevo horario
            exito = dao.registrarHorario(h);
        } else {
            // Actualizar horario existente
            try {
                h.setId(Integer.parseInt(id));
                exito = dao.actualizar(h);
            } catch (NumberFormatException e) {
                exito = false;
            }
        }

        if (exito) {
            response.sendRedirect("HorarioServlet?accion=listar");
        } else {
            request.setAttribute("mensajeError", "No se pudo guardar el horario.");
            if (id == null || id.isEmpty()) {
                request.getRequestDispatcher("registrarHorario.jsp").forward(request, response);
            } else {
                request.setAttribute("horario", h);
                request.getRequestDispatcher("editarHorario.jsp").forward(request, response);
            }
        }
    }
}
