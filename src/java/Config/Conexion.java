package Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    
    public Conexion() {
        try {
            // Cargar el driver JDBC de MySQL
            Class.forName("com.mysql.jdbc.Driver");
            
            // Conectar a la base de datos "registro" sin contraseña
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro", "root", "");
            
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
    }
    
    // Método para obtener la conexión
    public Connection getConnection() {
        return con;
    }
}
