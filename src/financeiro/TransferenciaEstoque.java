package financeiro;

import cadastro.Empresa;
import cadastro.Usuario;

public class TransferenciaEstoque {
	
	public int transferenciaID;
	public Usuario usuario = new Usuario();
	public Empresa empresa = new Empresa();
	public int origemID; //Empresa origem, de onde sairá a quantidade do estoque
	public int destinoID; //Empresa destino, para onde irá o estoque que foi retirado da origem
	public float quantidade;
	
	//Salva Transferencia
	public String salvaTransferencia() {
		String salvar = "INSERT INTO transferenciaestoque ";
		salvar += "(usuarioID, empresaID, origemID, destinoID, quantidade) ";
		salvar += "VALUES ";
		salvar += "('"+usuario.usuarioID+"','"+empresa.empresaID+"','"+origemID+"','"+destinoID+"','"+quantidade+"')";
		
		return salvar;
	}

}
