package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public static String usuario = "root";
    public static String clave = ""; // tu contraseña de MySQL (si tienes)
    public static String servidor = "localhost:3306";
    public static String BD = "tienda";

    public Connection crearConexion() {
        Connection con = null;

        try {
            // Registrar driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Cadena de conexión completa
            String URL = "jdbc:mysql://" + servidor + "/" + BD + "?useSSL=false&serverTimezone=UTC";

            con = DriverManager.getConnection(URL, usuario, clave);
            System.out.println("✅ Conexión exitosa a la base de datos " + BD);

        } catch (ClassNotFoundException ex) {
            System.out.println("❌ No se encontró el driver de MySQL.");
            ex.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Error al conectar con la base de datos.");
            System.out.println("Mensaje de error: " + e.getMessage());
            System.out.println("Código SQL: " + e.getSQLState());
            System.out.println("Error code: " + e.getErrorCode());
            e.printStackTrace();
        }

        if (con == null) {
            System.out.println("⚠️ La conexión es NULL — revisar parámetros o base de datos.");
        }

        return con;
    }
}
