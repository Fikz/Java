
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utilitarios.Conexao;
import bean.ClienteBean;
import java.sql.ResultSet;
import javax.swing.JOptionPane;


public class ClienteModel{
    
    
    public Connection con = Conexao.abrirConexao();
    
    public boolean excluir(ClienteBean clBean){
        Connection con = null;
        con = Conexao.abrirConexao();
        try{
            
            String sql = "DELETE FROM TBL_CLIENTE WHERE COD_CLIENTE = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, clBean.getCod());
            
            ps.executeUpdate();
            
            
            return true;
        }catch(SQLException e){
        
            return false;
        }finally{
        
            Conexao.fecharConexao(con);
        }
    }
    
    public boolean cadastrar(ClienteBean clBean){
        
        Connection con = null;
        con = Conexao.abrirConexao();
        String nome = clBean.getNome();
        
        //PROCESSAMENTO
        String sql = "INSERT INTO tbl_cliente(nome_cliente) VALUES (?)";
        
        try{
        
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, nome);

            
            ps.executeUpdate();
            
            return true;
            
            
        }catch(SQLException e){

            return false;
            
        }finally{
        
            Conexao.fecharConexao(con);
        }
        
    }
    
     public ResultSet selecionarProduto(){
        Connection con = null;

        con = Conexao.abrirConexao();
        ResultSet rs = null;
        
        try{
            String sql = "SELECT * FROM tbl_cliente";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
        }catch(SQLException e){
            System.out.println("Erro: "+ e.getMessage());
            JOptionPane.showMessageDialog(null,"Erro ao selecionar","Erro",JOptionPane.ERROR_MESSAGE);
            return null;
        }
        return rs;
    }
}
