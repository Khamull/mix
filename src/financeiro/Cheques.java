package financeiro;

import cadastro.Cliente;

public class Cheques {
	
	public int chequeID;
	public Receber receber = new Receber();
	public Cliente cliente = new Cliente();
	public float valor;
	public String numero;
	public String vencimento;
	public String observacoes;
	
	
	//Cadastra um um cheque que voltou
	public String cadastraCheque() {
		String cadastra = "INSERT INTO cheques (receberID, clienteID, valorCheque, numeroCheque, vencimentoCheque, observacoes) ";
		cadastra += "VALUES ('"+receber.receberID+"', '"+cliente.clienteID+"', '"+valor+"', '"+numero+"', '"+vencimento+"', '"+observacoes+"')";
		
		return cadastra;
	}
	
	
	//Seleciona todos os cheques que voltaram
	public String listaCheques() {
		String busca = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, cliente.clienteTelefone, ";
		busca += "cheques.* ";
		busca += "FROM cheques ";
		busca += "INNER JOIN cliente ON cliente.clienteID = cheques.clienteID ";
		busca += "ORDER BY cheques.chequeID DESC";
		
		return busca;
	}
	
	
	//Busca cheque por número
	public String buscaCheques(String numeroCheque) {
		String busca = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, cliente.clienteTelefone, ";
		busca += "cheques.* ";
		busca += "FROM cheques ";
		busca += "INNER JOIN cliente ON cliente.clienteID = cheques.clienteID ";
		busca += "WHERE numeroCheque = '"+numeroCheque+"'";
		
		return busca;
	}
	
	
	//Busca informações do cheque que voltou de acordo com um receberID
	public String chequePorReceberID() {
		String busca = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, cliente.clienteTelefone, ";
		busca += "cheques.* ";
		busca += "FROM cheques ";
		busca += "INNER JOIN cliente ON cliente.clienteID = cheques.clienteID ";
		busca += "WHERE cheques.receberID = '"+receber.receberID+"'";
		
		return busca;
	}
	
	//Exclui regitro de cheque Devolvido
	public String excluiCheque() {
		return "DELETE FROM cheques WHERE chequeID = '"+chequeID+"'";
	}
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Cheque Devolvido ao Contas a Receber com Sucesso!";
			
		case 2:
			return "Registro Excluido com Sucesso";
			
		case 3:
			return "";
			
		case 4:
			return "";
		
		case 5:
			return "";

		default:
			return "";
		}
	}

}
