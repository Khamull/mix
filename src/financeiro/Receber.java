package financeiro;

import cadastro.Cliente;
import cadastro.Empresa;
import pdv.FormaPagamento;
import pdv.Venda;
import servico.Servico;

public class Receber {
	
	public int receberID;
	public Venda venda = new Venda();
	public Servico servico = new Servico();
	public Cliente cliente = new Cliente();
	public FormaPagamento forma = new FormaPagamento();
	public float valor;
	public String vencimento;
	public int parcela;
	public int de;
	public String status;
	public String tipoServico;
	public Empresa empresa = new Empresa();
	
	
	//Insere Conta a Receber na Base de Dados
	public String salvarReceber() {
		String salvaReceber = "INSERT INTO receber (vendaID, formID, clienteID, valor, vencimento, parcela, de, status, servico, empresaID) ";
		salvaReceber += "VALUES ('"+venda.vendaID+"', '"+forma.formPagID+"', '"+cliente.clienteID+"', '"+valor+"', '"+vencimento+"', ";
		salvaReceber += "'"+parcela+"', '"+de+"', 'D', 'N', '"+empresa.empresaID+"')";
		
		return salvaReceber;
	}
	
	//Insere Conta a Receber na Base de Dados (para serviços)
	public String salvarReceberServico() {
		String salvaReceber = "INSERT INTO receber (vendaID, formID, clienteID, valor, vencimento, parcela, de, status, servico, empresaID) ";
		salvaReceber += "VALUES ('"+servico.servicoID+"', '"+forma.formPagID+"', '"+cliente.clienteID+"', '"+valor+"', '"+vencimento+"', ";
		salvaReceber += "'"+parcela+"', '"+de+"', 'D', 'S', '"+empresa.empresaID+"')";
		
		return salvaReceber;
	}
	
	//Insere um valor de Entrada com Status (PAGO) na tabela receber
	public String cadastraEntrada(float entrada) {
		String salvaReceber = "INSERT INTO receber (vendaID, formID, clienteID, valor, vencimento, parcela, de, status, servico, empresaID) ";
		salvaReceber += "VALUES ('"+venda.vendaID+"', '"+forma.formPagID+"', '"+cliente.clienteID+"', '"+entrada+"', '"+vencimento+"', ";
		salvaReceber += "'1', '1', 'P', 'N', '"+empresa.empresaID+"')";
		
		return salvaReceber;
	}
	
	//Insere um valor de Entrada com Status (PAGO) na tabela receber (de um Serviço)
	public String cadastraEntradaServico(float entrada) {
		String salvaReceber = "INSERT INTO receber (vendaID, formID, clienteID, valor, vencimento, parcela, de, status, servico, empresaID) ";
		salvaReceber += "VALUES ('"+servico.servicoID+"', '"+forma.formPagID+"', '"+cliente.clienteID+"', '"+entrada+"', '"+vencimento+"', ";
		salvaReceber += "'1', '1', 'P', 'S', '"+empresa.empresaID+"')";
		
		return salvaReceber;
	}
	
	//Recupera o ID do ultimo Receber lançado referente a uma venda
	public String ultimoReceberID() {
		return "SELECT receberID FROM receber WHERE vendaID = '"+venda.vendaID+"' ORDER BY receberID DESC LIMIT 1";
	}
	
	//Recupera o ID do ultimo Receber lançado referente a um Serviço
	public String ultimoReceberIDServico() {
		return "SELECT receberID FROM receber WHERE vendaID = '"+servico.servicoID+"' ORDER BY receberID DESC LIMIT 1";
	}
	
	//Pesquisa a Conta a Receber pelo ID
	public String receberPorID() {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*, ";//receber
		pesquisa += " servico.* ";
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN servico ON servico.servicoID = receber.vendaID ";
		pesquisa += "WHERE receberID = '"+receberID+"'";
		
		return pesquisa;
	}
	
	//Pesquisa Contas a receber de acordo com a data Passada
	public String pesquisaConta(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'D' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	//Pesquisa Contas a receber de acordo com a data Passada, Uma forma de Pagamento e um Cliente
	public String pesquisaContaFC(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'D' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.formID = '"+forma.formPagID+"' ";
		pesquisa += "AND receber.clienteID = '"+cliente.clienteID+"' ";
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	
	//Pesquisa Contas a receber de acordo com a data Passada e um Cliente
	public String pesquisaContaC(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'D' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.clienteID = '"+cliente.clienteID+"' ";
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	
	//Pesquisa Contas a receber de acordo com a data Passada e Uma forma de Pagamento
	public String pesquisaContaF(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'D' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.formID = '"+forma.formPagID+"' ";
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	
	//Pesquisa Contas a receber de acordo com a data Passada
	public String contaRecebida(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'P' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	//Pesquisa Contas a receber de acordo com a data Passada, Uma forma de Pagamento e um Cliente
	public String contaRecebidaFC(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'P' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.formID = '"+forma.formPagID+"' ";
		pesquisa += "AND receber.clienteID = '"+cliente.clienteID+"' ";
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	
	//Pesquisa Contas a receber de acordo com a data Passada e um Cliente
	public String contaRecebidaC(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'P' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.clienteID = '"+cliente.clienteID+"' ";
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	
	//Pesquisa Contas a receber de acordo com a data Passada e Uma forma de Pagamento
	public String contaRecebidaF(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'P' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.formID = '"+forma.formPagID+"' ";
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	//Pesquisa Detalhes da Conta a receber
	public String detalheReceber() {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "lancamentos.receberID, lancamentos.valor AS recebido, lancamentos.desconto, lancamentos.acrescimo, lancamentos.observacao, ";//lançamentos
		pesquisa += "venda.vendaID , venda.valor AS total, venda.data, ";
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "INNER JOIN venda ON venda.vendaID = receber.vendaID ";//INNER JOIN venda
		pesquisa += "INNER JOIN lancamentos ON lancamentos.receberID = receber.receberID ";//INNER JOIN lançamentos
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE receber.receberID = '"+receberID+"'";
		
		return pesquisa;
	}
	
	
	//Pesquisa Detalhes da Conta a receber de um Serviço
	public String detalheReceberServico() {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "lancamentos.receberID, lancamentos.valor AS recebido, lancamentos.desconto, lancamentos.acrescimo, lancamentos.observacao, ";//lançamentos
		pesquisa += "servico.servicoID , servico.valor AS total, servico.dataFim, ";
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "INNER JOIN servico ON servico.servicoID = receber.vendaID ";//INNER JOIN venda
		pesquisa += "INNER JOIN lancamentos ON lancamentos.receberID = receber.receberID ";//INNER JOIN lançamentos
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE receber.receberID = '"+receberID+"'";
		
		return pesquisa;
	}
	
	
	
	//Pesquisa Detalhes da Conta a receber de um cheque devolvido
	public String detalheReceberChequeVoltou() {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";
		pesquisa += "lancamentos.receberID, lancamentos.valor AS recebido, lancamentos.desconto, lancamentos.acrescimo, lancamentos.observacao, ";
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";
		pesquisa += "cheques.receberID, cheques.numeroCheque, cheques.valorCheque as valor, cheques.observacoes, ";
		pesquisa += "receber.valor as total, receber.vencimento, receber.parcela, receber.de ";
		pesquisa += "FROM lancamentos ";
		pesquisa += "INNER JOIN cheques ON cheques.receberID = lancamentos.receberID ";
		pesquisa += "INNER JOIN cliente ON cliente.clienteID = cheques.clienteID ";
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = lancamentos.formID ";
		pesquisa += "INNER JOIN receber ON cheques.receberID = receber.receberID ";
		pesquisa += "WHERE lancamentos.receberID = '"+receberID+"' AND lancamentos.tipo = 'C'";
		
		return pesquisa;
	}
	
	//Pesquisa Detalhes da Conta a receber de um cheque devolvido Depois de Quitada a Divida
	public String detalheReceberCheque() {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";
		pesquisa += "lancamentos.receberID, lancamentos.valor AS recebido, lancamentos.desconto, lancamentos.acrescimo, lancamentos.observacao, ";
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";
		pesquisa += "cheques.receberID, cheques.numeroCheque, cheques.valorCheque as valor, cheques.observacoes, ";
		pesquisa += "receber.valor as total, receber.vencimento, receber.parcela, receber.de ";
		pesquisa += "FROM lancamentos ";
		pesquisa += "INNER JOIN cheques ON cheques.receberID = lancamentos.receberID ";
		pesquisa += "INNER JOIN cliente ON cliente.clienteID = cheques.clienteID ";
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = lancamentos.formID ";
		pesquisa += "INNER JOIN receber ON cheques.receberID = receber.receberID ";
		pesquisa += "WHERE lancamentos.receberID = '"+receberID+"' AND lancamentos.tipo = 'R'";
		
		return pesquisa;
	}
	
	
	//Pesquisa Contas a receber de acordo com um Cliente
	public String pesquisaContaCliente() {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*, servico.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID INNER JOIN servico on servico.servicoID = receber.vendaID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE receber.status = 'D' AND receber.formID = '7' AND receber.clienteID = '"+cliente.clienteID+"'";//se status for igual a 'D' de DEVENDO e Venda igual Vale
		pesquisa += "ORDER BY receber.vencimento ASC";
		
		return pesquisa;
	}
	
	
	//Pesquisa o valor total a receber aquele mês
	public String totalReceber(String dataInicio, String dataFim) {
		String total = "SELECT SUM(valor) as faltaPagar FROM receber ";
		total += "WHERE status = 'D' AND vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"'";
		
		return total;
	}
	
	//Pesquisa o valor total a receber em vendas vale de um determinado cliente
	public String totalReceberVale() {
		String total = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, SUM(valor) as faltaPagar ";
		total += "FROM receber INNER JOIN cliente ON cliente.clienteID = receber.clienteID ";
		total += "WHERE receber.status = 'D' AND receber.formID = '7' AND receber.clienteID = '"+cliente.clienteID+"'";
		
		return total;
	}
	
	/*
	 * SELECT  receber.*, cliente.* from receber, cliente 
		where date(receber.dataAlteracao) = date(now())
		and cliente.clienteID = receber.clienteID
		and cliente.clienteID = 2
 	*/
	public String RecebidosporCliente() {
		String total =  " SELECT  receber.*, cliente.* from receber, cliente "; 
				total+=	" where date(receber.dataAlteracao) = date(now()) ";
				total+=" and cliente.clienteID = receber.clienteID ";
				total+=" and cliente.clienteID = '"+cliente.clienteID+"'";
		
		return total;
	}
	
	//Pesquisa Contas a receber de acordo com a data Passada e Filtrando pela unidade que estiver logada
	public String pesquisaContaPorEmpresa(String dataInicio, String dataFim) {
		String pesquisa = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, ";//cliente
		pesquisa += "formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "receber.*";//receber
		pesquisa += "FROM receber ";//Tabela Principal
		pesquisa += "LEFT JOIN cliente ON cliente.clienteID = receber.clienteID ";//LEFT JOIN cliente
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = receber.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "WHERE status = 'D' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND receber.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "AND receber.empresaID = '"+empresa.empresaID+"'";//somente da unidade que estiver logada
		pesquisa += "ORDER BY receber.vencimento ASC, receber.receberID  ASC";//Ordena por Order de Recebimento
		
		return pesquisa;
	}
	
	//Pesquisa o valor total a receber aquele mês e Filtrando pela unidade que estiver logada
	public String totalReceberPorEmpresa(String dataInicio, String dataFim) {
		String total = "SELECT SUM(valor) as faltaPagar FROM receber ";
		total += "WHERE status = 'D' AND vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' AND empresaID = '"+empresa.empresaID+"'";
		
		return total;
	}
	
	//Altera valor e data de vencimento da Conta à Receber
	public String alteraReceber() {
		return "UPDATE receber SET valor = '"+valor+"', vencimento = '"+vencimento+"' WHERE receberID = '"+receberID+"'";
	}
	
	
	//Atualiza status da Conta a Receber para 'P' de Pago
	public String alteraStatus() {
		return "UPDATE receber SET status = 'P' WHERE receberID = '"+receberID+"'";
	}
	
	
	//Muda a forma de Pagamento do Receber para Cheque
	public String alteraFormaPgto() {
		return "UPDATE receber SET formID = '"+forma.formPagID+"' WHERE receberID = '"+receberID+"'";
	}
	
	
	//Exclui a Conta a Receber
	public String excluiContaReceber() {
		return "DELETE FROM receber WHERE receberID = '"+receberID+"'";
	}
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Valor Recebido com Sucesso!";
			
		case 2:
			return "Conta a Receber Alterada com Sucesso!";
			
		case 3:
			return "Conta a Receber Excluida com Sucesso!";
			
		case 4:
			return "";
		
		case 5:
			return "";

		default:
			return "";
		}
	}

}
