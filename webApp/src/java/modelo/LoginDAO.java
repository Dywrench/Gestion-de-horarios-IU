package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    public Usuario Login_datos(String usuario, String clave) {
        Usuario datos = null;
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Conexion cn = new Conexion();
            con = cn.crearConexion();

            String sql = "SELECT * FROM datos WHERE usuario = ? AND clave = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario);
            stmt.setString(2, clave);
            rs = stmt.executeQuery();

            if (rs.next()) {
                datos = new Usuario();
                datos.setUsuario(rs.getString("usuario"));
                datos.setClave(rs.getString("clave"));
                // si tienes id_perfil o nombre/apellido, también puedes asignarlos
            }

        } catch (SQLException e) {
            System.out.println("❌ Error en LoginDAO.Login_datos(): " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return datos;
    }
}
