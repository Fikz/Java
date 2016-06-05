
package control;
import bean.ClienteBean;
import model.ClienteModel;

public class ClienteControl {
    ClienteModel clModel = new ClienteModel();
    
   
    
    public boolean  cadastrar(ClienteBean clBean){
        return clModel.cadastrar(clBean);
    }
    
    public boolean excluir(ClienteBean clBean){
        return clModel.excluir(clBean);
    }
}
