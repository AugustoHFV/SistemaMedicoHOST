ppackage Controladordatos;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class Conexion {
    Connection conexion;
    
    public Connection Conectar() {
        try {
            // 1. Buscar el archivo desde la raíz de los recursos (nota la diagonal invertida al inicio)
            InputStream fis = Conexion.class.getResourceAsStream("/db.properties");
            
            // Si el archivo no existe o está en la carpeta equivocada, detenemos todo y avisamos
            if (fis == null) {
                System.err.println("❌ ERROR: No se encontró el archivo db.properties. Asegúrate de ponerlo en 'src/main/resources'.");
                return null;
            }

            Properties p = new Properties();
            p.load(fis);

            String usuario = p.getProperty("usuario"); 
            String contrasena = p.getProperty("contrasena"); 
            String iphost = p.getProperty("iphost");
            String puerto = p.getProperty("puerto");
            String namedb = p.getProperty("namedb");

            // 2. Cargar el Driver de forma nativa para Jakarta EE (Payara)
            Class.forName("org.postgresql.Driver");

            // 3. Crear la conexión
            String url = "jdbc:postgresql://" + iphost + ":" + puerto + "/" + namedb;
            conexion = DriverManager.getConnection(url, usuario, contrasena);
            
            System.out.println("✅ ÉXITO: CONECTADO A POSTGRESQL (" + namedb + ")");

        } catch (Exception e) {
            System.err.println("❌ ERROR AL CONECTAR A LA BASE DE DATOS: " + e.getMessage());
            e.printStackTrace();
        }
        return conexion;
    }
}
