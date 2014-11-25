package pdv;

import cadastro.Cliente;
import cadastro.Empresa;
import cadastro.Usuario;

public class Venda {
	
	public int vendaID;
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
	

	
	//verifica se já existe uma venda Aberta com esse usuário de sistema
	public String vendaAberta() {
		return "SELECT * FROM venda WHERE status = '1' AND usuario = '"+usuario.login+"'";
	}

	
	//Pesquisa dados do Cliente relacionado a uma venda
	public String clienteVendaID() {
		return "SELECT cliente.* , venda.* FROM venda LEFT JOIN cliente ON cliente.clienteID = venda.clienteID WHERE venda.vendaID = '"+vendaID+"'";
	}
	
	//Pesquisa todas as vendas Fechadas por Mes
	public String vendasFechadas(String dataInicial, String dataFinal) {
		String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
		busca += "cliente.clienteID, cliente.clienteNomeFantasia, ";
		busca += "venda.* FROM venda ";
		busca += "INNER JOIN formapagamento ON formapagamento.formID = venda.formPagID ";
		busca += "LEFT JOIN cliente ON cliente.clienteID = venda.clienteID ";
		busca += "WHERE venda.data BETWEEN '"+dataInicial+"' AND '"+dataFinal+" 23:59:59"+"' ";
		busca += "AND venda.status = '2' AND venda.empresaID = '"+empresa.empresaID+"' ";
		busca += "ORDER BY data DESC";
		
		return busca;
	}
	
	
	//Lista todas as vendas em um determinado Periodo
	public String listaVendasRelatorio(String dataInicial, String dataFinal) {
		String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
		busca += "cliente.clienteID, cliente.clienteNomeFantasia, ";
		busca += "venda.* FROM venda ";
		busca += "INNER JOIN formapagamento ON formapagamento.formID = venda.formPagID ";
		busca += "LEFT JOIN cliente ON cliente.clienteID = venda.clienteID ";
		busca += "WHERE venda.data BETWEEN '"+dataInicial+"' AND '"+dataFinal+" 23:59:59"+"' ";
		busca += "AND venda.status = '2' ";
		busca += "ORDER BY data ASC";
		
		return busca;
	}
	
	//Mostra o TOTAL vendido em um determinado Periodo
	public String listaVendasRelatorioTotal(String dataInicial, String dataFinal) {
		String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
		busca += "cliente.clienteID, cliente.clienteNomeFantasia, ";
		busca += "venda.vendaID, venda.formPagID, venda.clienteID, SUM(valor) AS totalVenda FROM venda ";
		busca += "INNER JOIN formapagamento ON formapagamento.formID = venda.formPagID ";
		busca += "LEFT JOIN cliente ON cliente.clienteID = venda.clienteID ";
		busca += "WHERE venda.data BETWEEN '"+dataInicial+"' AND '"+dataFinal+" 23:59:59"+"' ";
		busca += "AND venda.status = '2' ";
		busca += "ORDER BY data ASC";
		
		return busca;
	}
	
	//Lista todas as venda em um determinado Periodo com uma Forma de Pagamento
	public String listaVendasRelatorioPorFormaPagmento(String dataInicial, String dataFinal) {
		String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
		busca += "cliente.clienteID, cliente.clienteNomeFantasia, ";
		busca += "venda.* FROM venda ";
		busca += "INNER JOIN formapagamento ON formapagamento.formID = venda.formPagID ";
		busca += "LEFT JOIN cliente ON cliente.clienteID = venda.clienteID ";
		busca += "WHERE venda.data BETWEEN '"+dataInicial+"' AND '"+dataFinal+" 23:59:59"+"' ";
		busca += "AND venda.status = '2' AND venda.formPagID = '"+formPag.formPagID+"' ";
		busca += "ORDER BY data ASC";
		
		return busca;
	}
	
	//Mostra o TOTAL vendido em um determinado Periodo com uma Forma de Pagamento
	public String listaVendasRelatorioPorFormaPagmentoTotal(String dataInicial, String dataFinal) {
		String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
		busca += "cliente.clienteID, cliente.clienteNomeFantasia, ";
		busca += "venda.vendaID, venda.formPagID, venda.clienteID, SUM(valor) AS totalVenda FROM venda ";
		busca += "INNER JOIN formapagamento ON formapagamento.formID = venda.formPagID ";
		busca += "LEFT JOIN cliente ON cliente.clienteID = venda.clienteID ";
		busca += "WHERE venda.data BETWEEN '"+dataInicial+"' AND '"+dataFinal+" 23:59:59"+"' ";
		busca += "AND venda.status = '2' AND venda.formPagID = '"+formPag.formPagID+"' ";
		busca += "ORDER BY data ASC";
		
		return busca;
	}
	
	//Pesquisa dados da venda por ID
	public String dadosVenda() {
		return "SELECT * FROM venda WHERE vendaID = '"+vendaID+"'";
	}
	
	
	//Pesquisa qual foi a Ultima Venda Realizada
	public String ultimaVendaPorUsuario(){
		return "SELECT * FROM venda WHERE usuario = '"+usuario.login+"' AND status = '2' ORDER BY vendaID DESC LIMIT 1";
	}
	
	public String ultimaVenda() {
		return "SELECT * FROM venda ORDER BY vendaID DESC LIMIT 1";
	}
	
	
	//Pesquisa soma das vendas em um determinado Periodo com um determinado Usuário
	public String somaVendas(int vendaInicio, int vendaFim) {
		String vendas = "SELECT SUM(valor) as totalVendas ";
		vendas += "FROM venda ";
		vendas += "WHERE vendaID BETWEEN '"+vendaInicio+"' AND '"+vendaFim+"' ";
		vendas += "AND usuario = '"+usuario.login+"'";
		
		return vendas;
	}
	
	//Pesquisa soma das vendas REALIZADAS Á DINHEIRO em um determinado Periodo com um determinado Usuário
	public String somaVendasDinheiro(int vendaInicio, int vendaFim) {
		String vendas = "SELECT SUM(valor) as totalVendas ";
		vendas += "FROM venda ";
		vendas += "WHERE vendaID BETWEEN '"+vendaInicio+"' AND '"+vendaFim+"' ";
		vendas += "AND usuario = '"+usuario.login+"' AND formPagID = '1'";
		
		return vendas;
	}
	
	public String somaVendaFormaPgto(int vendaInicio, int vendaFim) {
		String vendas = "SELECT formapagamento.formID, formapagamento.descricao, ";
		vendas += "SUM(venda.valor) as totalVendas, venda.formPagID ";
		vendas += "FROM venda ";
		vendas += "INNER JOIN formapagamento ON formapagamento.formID = venda.formPagID ";
		vendas += "WHERE venda.vendaID BETWEEN '"+vendaInicio+"' AND '"+vendaFim+"' ";
		vendas += "AND venda.usuario = '"+usuario.login+"' ";
		vendas += "GROUP BY venda.formPagID";
		
		return vendas;
	}
	
	//Cadastra uma Venda
	public String cadastraVenda(){
		String insere = "INSERT INTO venda (clienteID, formPagID, vezes, valor, entrada, troco, desconto, notaFiscal, usuario, empresaID) ";
		insere += "VALUES ('0', '0', '0', '0', '0', '0', '0', '0', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return insere;
	}
	
	//Completa as informações da Venda
	public String completaVenda() {
		String completa = "UPDATE venda ";
		completa += "SET clienteID = '"+cliente.clienteID+"', formPagID = '"+formPag.formPagID+"', vezes = '"+vezes+"', ";
		completa += "valor = '"+valor+"', entrada = '"+entrada+"', troco = '"+troco+"', desconto = '"+desconto+"', status = '2' ";
		completa += "WHERE vendaID = '"+vendaID+"'";
		
		return completa;
	}
	
	//Finaliza a Venda mudando o Status para 2
	public String finalizaVenda() {
		return "UPDATE venda SET status = '2' WHERE vendaID = '"+vendaID+"'";
	}
	
	//Cancela a Venda Excluindo-a
	public String cancelaVenda() {
		return "DELETE FROM venda WHERE vendaID = '"+vendaID+"'";
	}

}
