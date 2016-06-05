
package utilitarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Conexao {
    
    public static Connection abrirConexao(){
    
        Connection con = null;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String url = "";
            
            url = "jdbc:mysql://127.0.0.1/pedidos?user=root&password=1234";
            
            con = (Connection) DriverManager.getConnection(url);
        
        }catch(SQLException e){
        
            e.getMessage();
            System.out.println("Erro de conexão: " + e.getMessage());
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Erro de conexão: " + ex.getMessage());
        }
        
        return con;
    
    }
    
    public static void fecharConexao(Connection con){
    
        try{
        
            con.close();
            
        }catch(SQLException e){
        
            System.out.println("Erro de conexão: " + e.getMessage());
            
        }
        
    }
    
}