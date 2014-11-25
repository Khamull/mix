package financeiro;

import cadastro.Empresa;

public class Transferencias {
	
	public int transferenciaID;
	public int bancoDe;
	public int bancoPara;
	public float valor;
	public String observacoes;
	public String data;
	public Empresa empresa = new Empresa();
	
	//Pesquisa dados da ultima Transferecia Realizada
	public String ultimaTransferencia() {
		return "SELECT * FROM transferencias ORDER BY transferenciaID DESC LIMIT 1";
	}
	
	//Pesquisa transferencia por ID
	public String transferenciaPorID() {
		String pesquisaTransf = "SELECT empresa.empresaID, empresa.unidade, transferencias.* ";
		pesquisaTransf += "FROM transferencias INNER JOIN empresa ON empresa.empresaID = transferencias.empresaID ";
		pesquisaTransf += "WHERE transferencias.transferenciaID = '"+transferenciaID+"'";
		
		return pesquisaTransf;
	}
	
	//Insere uma transferencia na tabela
	public String cadastraTransferencia() {
		String cadastro = "INSERT INTO transferencias ";
		cadastro += "(bancoDe, bancoPara, valor, observacoes, empresaID) ";
		cadastro += "VALUES ('"+bancoDe+"', '"+bancoPara+"', '"+valor+"', '"+observacoes+"', '"+empresa.empresaID+"')";
		
		return cadastro;
	}
	
	
	//Pesquisa as transferencias realizadas em um determinado periodo
	public String listaTranferenciasPorData(String dataInicio, String dataFim) {
		String busca = "SELECT * FROM transferencias ";
		busca += "WHERE data BETWEEN '"+dataInicio+"' AND '"+dataFim+" 23:59:59"+"'";
		busca += "ORDER BY data ASC";
		return busca;
	}

}
