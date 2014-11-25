package pdv;

import cadastro.Cliente;
import cadastro.Empresa;
import cadastro.Usuario;

public class Orcamento {
	
	public int orcamentoID;
	public Cliente cliente = new Cliente();
	public FormaPagamento formPag = new FormaPagamento();
	public int vezes;
	public float valor;
	public float entrada;
	public float troco;
	public float desconto;
	public String notaFiscal;
	public Usuario usuario = new Usuario();
	public String status;
	public Empresa empresa = new Empresa();
	

	
	//verifica se já existe um orcamento Aberto com esse usuário de sistema
	public String orcamentoAberta() {
		return "SELECT * FROM orcamento WHERE status = '1' AND usuario = '"+usuario.login+"'";
	}

	
	//Pesquisa dados do Cliente relacionado a um orcamento
	public String clienteorcamentoID() {
		return "SELECT cliente.* , orcamento.* FROM orcamento LEFT JOIN cliente ON cliente.clienteID = orcamento.clienteID WHERE orcamento.orcamentoID = '"+orcamentoID+"'";
	}
	
	//Pesquisa todas as orcamentos Fechadas por Mes
	public String orcamentosFechados(String dataInicial, String dataFinal) {
		String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
		busca += "cliente.clienteID, cliente.clienteNomeFantasia, ";
		busca += "orcamento.* FROM orcamento ";
		busca += "INNER JOIN formapagamento ON formapagamento.formID = orcamento.formPagID ";
		busca += "LEFT JOIN cliente ON cliente.clienteID = orcamento.clienteID ";
		busca += "WHERE orcamento.data BETWEEN '"+dataInicial+"' AND '"+dataFinal+"' ";
		busca += "AND orcamento.status = '2' AND orcamento.empresaID = '"+empresa.empresaID+"' ";
		busca += "ORDER BY data DESC";
		
		return busca;
	}
	
	//Pesquisa dados do orcamento por ID
	public String dadosOrcamento() {
		return "SELECT * FROM orcamento WHERE orcamentoID = '"+orcamentoID+"'";
	}
	
	
	//Pesquisa qual foi a Ultima orcamento Realizada
	public String ultimoOrcamentoPorUsuario(){
		return "SELECT * FROM orcamento WHERE usuario = '"+usuario.login+"' AND status = '2' ORDER BY orcamentoID DESC LIMIT 1";
	}
	
	public String ultimoOrcamento() {
		return "SELECT * FROM orcamento ORDER BY orcamentoID DESC LIMIT 1";
	}
	
	
	//Pesquisa soma das orcamentos em um determinado Periodo com um determinado Usuário
	public String somaOrcamentos(int orcamentoInicio, int orcamentoFim) {
		String orcamentos = "SELECT SUM(valor) as totalorcamentos ";
		orcamentos += "FROM orcamento ";
		orcamentos += "WHERE orcamentoID BETWEEN '"+orcamentoInicio+"' AND '"+orcamentoFim+"' ";
		orcamentos += "AND usuario = '"+usuario.login+"'";
		
		return orcamentos;
	}
	
	//Pesquisa soma das orcamentos REALIZADAS Á DINHEIRO em um determinado Periodo com um determinado Usuário
	public String somaOrcamentosDinheiro(int orcamentoInicio, int orcamentoFim) {
		String orcamentos = "SELECT SUM(valor) as totalOrcamentos ";
		orcamentos += "FROM orcamento ";
		orcamentos += "WHERE orcamentoID BETWEEN '"+orcamentoInicio+"' AND '"+orcamentoFim+"' ";
		orcamentos += "AND usuario = '"+usuario.login+"' AND formPagID = '1'";
		
		return orcamentos;
	}
	
	public String somaOrcamentoFormaPgto(int orcamentoInicio, int orcamentoFim) {
		String orcamentos = "SELECT formapagamento.formID, formapagamento.descricao, ";
		orcamentos += "SUM(orcamento.valor) as totalOrcamentos, orcamento.formPagID ";
		orcamentos += "FROM orcamento ";
		orcamentos += "INNER JOIN formapagamento ON formapagamento.formID = orcamento.formPagID ";
		orcamentos += "WHERE orcamento.orcamentoID BETWEEN '"+orcamentoInicio+"' AND '"+orcamentoFim+"' ";
		orcamentos += "AND orcamento.usuario = '"+usuario.login+"' ";
		orcamentos += "GROUP BY orcamento.formPagID";
		
		return orcamentos;
	}
	
	//Cadastra um orcamento
	public String cadastraOrcamento(){
		String insere = "INSERT INTO orcamento (clienteID, formPagID, vezes, valor, entrada, troco, desconto, notaFiscal, usuario, empresaID) ";
		insere += "VALUES ('0', '0', '0', '0', '0', '0', '0', '0', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return insere;
	}
	
	//Completa as informações do orcamento
	public String completaOrcamento() {
		String completa = "UPDATE orcamento ";
		completa += "SET clienteID = '"+cliente.clienteID+"', formPagID = '"+formPag.formPagID+"', vezes = '"+vezes+"', ";
		completa += "valor = '"+valor+"', entrada = '"+entrada+"', troco = '"+troco+"', desconto = '"+desconto+"', status = '2' ";
		completa += "WHERE orcamentoID = '"+orcamentoID+"'";
		
		return completa;
	}
	
	//Finaliza o orcamento mudando o Status para 2
	public String finalizaOrcamento() {
		return "UPDATE orcamento SET status = '2' WHERE orcamentoID = '"+orcamentoID+"'";
	}
	
	//Cancela o orcamento Excluindo-o
	public String cancelaOrcamento() {
		return "DELETE FROM orcamento WHERE orcamentoID = '"+orcamentoID+"'";
	}

}
