import java.sql.Connection;
import java.sql.SQLException;
import com.mysql.cj.jdbc.MysqlDataSource;

public class ConexaoBanco {

    private Connection conexao = null;
    private final String BANCO = "ifsp";   
    private final String LOGIN = "root";  
    private final String SENHA = "123456";     
    private final String HOST = "192.168.0.115"; 
    public Connection getConnection() {

        try {
            MysqlDataSource ds = new MysqlDataSource();
            ds.setServerName(HOST);
            ds.setDatabaseName(BANCO);
            ds.setUser(LOGIN);
            ds.setPassword(SENHA);
            ds.setServerTimezone("UTC");

            ds.setConnectTimeout(2000);

            conexao = ds.getConnection();
            System.out.println("CONECTADO AO BANCO DE DADOS.");
        }
        catch (SQLException sqlerror) {
            System.out.println("FALHA NA CONEXÃO: " + sqlerror.getMessage());
        }       

        return conexao;
    }
    
}