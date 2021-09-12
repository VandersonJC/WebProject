
package BD;
import java.sql.*;

public class Conect {
    
    public static Connection conexao(){
    
        Connection con = null;
                
        try {
        
            
            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/cadastro_projetos";
            String user = "root";
            String pass = "";
        
            Class.forName(driver);
            con  =  DriverManager.getConnection(url, user, pass);
            
            
        }catch (Exception e) {
        
            e.printStackTrace();
            
        }
        
        
        return con;
        
    
    
    }
    
    
    
    
}
