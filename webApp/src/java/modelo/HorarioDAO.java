package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HorarioDAO {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    // ✅ Registrar horario
  public boolean registrarHorario(Horario h) {
    String sql = "INSERT INTO horario (dia, hora_inicio, hora_fin, materia, estudiante_id) VALUES (?, ?, ?, ?, ?)";
    try {
        Conexion cn = new Conexion();
        con = cn.crearConexion();
        ps = con.prepareStatement(sql);
        ps.setString(1, h.getDia());
        ps.setString(2, h.getHoraInicio());
        ps.setString(3, h.getHoraFin());
        ps.setString(4, h.getMateria());
        ps.setInt(5, h.getId()); // <-- asignar el id del estudiante
        ps.executeUpdate();
        return true;
    } catch (SQLException e) {
        System.out.println("❌ Error al registrar horario: " + e.getMessage());
        return false;
    } finally {
        cerrarRecursos();
    }
}

    // ✅ Listar todos los horarios
    public List<Horario> listarTodos() {
        List<Horario> lista = new ArrayList<>();
        String sql = "SELECT * FROM horario";

        try {
            Conexion cn = new Conexion();
            con = cn.crearConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Horario h = new Horario();
                h.setId(rs.getInt("id"));
                h.setDia(rs.getString("dia"));
                h.setHoraInicio(rs.getString("hora_inicio"));
                h.setHoraFin(rs.getString("hora_fin"));
                h.setMateria(rs.getString("materia"));
                lista.add(h);
            }
        } catch (SQLException e) {
            System.out.println("❌ Error al listar horarios: " + e.getMessage());
        } finally {
            cerrarRecursos();
        }

        return lista;
    }

    // ✅ Obtener un horario por ID
  public Horario obtenerPorId(int id) {
    Conexion cn = new Conexion();   // se crea el objeto de conexión
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Horario h = null;

    String sql = "SELECT * FROM horario WHERE id = ?";

    try {
        con = cn.crearConexion();  // aquí llamas al método de tu clase Conexion
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
            h = new Horario();
            h.setId(rs.getInt("id"));
            h.setDia(rs.getString("dia"));
            h.setHoraInicio(rs.getString("hora_inicio"));
            h.setHoraFin(rs.getString("hora_fin"));
            h.setMateria(rs.getString("materia"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return h;
}


    // ✅ Actualizar horario existente
    public boolean actualizar(Horario h) {
        String sql = "UPDATE horario SET dia = ?, hora_inicio = ?, hora_fin = ?, materia = ? WHERE id = ?";
        try {
            Conexion cn = new Conexion();
            con = cn.crearConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, h.getDia());
            ps.setString(2, h.getHoraInicio());
            ps.setString(3, h.getHoraFin());
            ps.setString(4, h.getMateria());
            ps.setInt(5, h.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Error al actualizar horario: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos();
        }
    }

    public boolean eliminar(int id) {
        Conexion cn = new Conexion();
        Connection con;
        PreparedStatement ps;

        try {
            con = cn.crearConexion();
            String sql = "DELETE FROM horario WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int filas = ps.executeUpdate();
            con.close();

            return filas > 0; // Devuelve true si se eliminó al menos un registro
        } catch (SQLException e) {
            System.out.println("Error al eliminar horario: " + e.getMessage());
            return false;
        }
    }



    private void cerrarRecursos() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
