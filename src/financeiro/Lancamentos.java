package financeiro;

import cadastro.Empresa;
import cadastro.Usuario;
import pdv.FormaPagamento;
import pdv.Venda;

public class Lancamentos {
	
	public int lancamentoID;
	public Receber receber = new Receber();
	public Pagar pagar = new Pagar();
	public Venda venda = new Venda();
	public Transferencias transferencia = new Transferencias();
	public ContasPagar contaPagar = new ContasPagar();
	public LivroCaixa livro = new LivroCaixa();
	public FormaPagamento formaPag = new FormaPagamento();
	public float valor;
	public float desconto;
	public float acrescimo;
	public String favorecido;
	public String observacao;
	public String tipo; // 'P' de Pagar ou 'R' de Receber (Identifica o Tipo de lançamento)
	public Usuario usuario = new Usuario();
	public Empresa empresa = new Empresa();
	
	
	//Gera um Lançamento de uma Entrada ou (Valor a vista quando pago em Dinheiro)
	public String insereEntrada() {
		String salvaValor = "INSERT INTO lancamentos ";
		salvaValor += "(receberID, vendaID, livroID, formID, valor, tipo, usuario, empresaID) ";
		salvaValor += "VALUES ('"+receber.receberID+"', '"+venda.vendaID+"', '1', '1', '"+valor+"', 'R', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return salvaValor;
	}
	
	
	public String insereEntradaServico() {
		String salvaValor = "INSERT INTO lancamentos ";
		salvaValor += "(receberID, vendaID, livroID, formID, valor, tipo, usuario, empresaID) ";
		salvaValor += "VALUES ('"+receber.receberID+"', '"+venda.vendaID+"', '1', '1', '"+valor+"', 'S', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return salvaValor;
	}
	
	
	//Registra o Recebimento de Uma conta que fazia parte do Contas a Receber
	public String pagaContaReceber() {
		String salvaValor = "INSERT INTO lancamentos ";
		salvaValor += "(receberID, vendaID, livroID, formID, valor, desconto, acrescimo, observacao, tipo, usuario, empresaID) ";
		salvaValor += "VALUES ('"+receber.receberID+"', '"+venda.vendaID+"', '"+livro.livroID+"', '"+formaPag.formPagID+"', ";
		salvaValor += "'"+valor+"', '"+desconto+"', '"+acrescimo+"', '"+observacao+"', 'R', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return salvaValor;
	}
	
	
	//Registra o Recebimento de Uma conta que fazia parte do Contas a Receber (de um Serviço)
	public String pagaContaReceberServico() {
		String salvaValor = "INSERT INTO lancamentos ";
		salvaValor += "(receberID, vendaID, livroID, formID, valor, desconto, acrescimo, observacao, tipo, usuario, empresaID) ";
		salvaValor += "VALUES ('"+receber.receberID+"', '"+venda.vendaID+"', '"+livro.livroID+"', '"+formaPag.formPagID+"', ";
		salvaValor += "'"+valor+"', '"+desconto+"', '"+acrescimo+"', '"+observacao+"', 'S', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return salvaValor;
	}
	
	
	//Registra o Pagamento de Uma conta que fazia parte do Contas a Pagar
	public String pagaContaPagar() {
		String salvaValor = "INSERT INTO lancamentos ";
		salvaValor += "(pagarID, contaPagarID, livroID, formID, valor, desconto, acrescimo, favorecido, observacao, tipo, usuario, empresaID) ";
		salvaValor += "VALUES ('"+pagar.pagarID+"', '"+contaPagar.contaID+"', '"+livro.livroID+"', '"+formaPag.formPagID+"', '"+valor+"', ";
		salvaValor += "'"+desconto+"', '"+acrescimo+"', '"+favorecido+"', '"+observacao+"', 'P', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return salvaValor;
	}
	
	
	//Registra o Lançamento de Uma Tranferencia
	public String transfere() {
		String transf = "INSERT INTO lancamentos (transferenciaID, livroID, valor, formID, tipo, usuario, empresaID) ";
		transf += "VALUES ('"+transferencia.transferenciaID+"', '"+livro.livroID+"', '"+valor+"', '1', 'T', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return transf;
	}
	
	
	//Registra o Lançamento de um Deposito
	public String deposito() {
		String transf = "INSERT INTO lancamentos (transferenciaID, livroID, valor, formID, tipo, usuario, empresaID) ";
		transf += "VALUES ('"+transferencia.transferenciaID+"', '"+livro.livroID+"', '"+valor+"', '1', 'D', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return transf;
	}
	
	//Registra o Lançamento de um Cheque que voltou
	public String chequeVoltou() {
		String cheque = "INSERT INTO lancamentos (receberID, vendaID, livroID, formID, valor, observacao, tipo, usuario, empresaID) ";
		cheque += "VALUES ('"+receber.receberID+"', '"+venda.vendaID+"', '"+livro.livroID+"', '"+formaPag.formPagID+"', '"+valor+"', ";
		cheque += "'"+observacao+"', 'C', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return cheque;
	}
	
	
	//Esse metodo irá pesquisar todas as contas a Pagas e Recebidas de Acordo com um Intervalo de Datas
	public String listaRecebimentos(String dataInicio, String dataFim) {
				
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, lancamentos.* FROM lancamentos ";
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = lancamentos.formID ";
		pesquisa += "WHERE lancamentos.livroID = '"+livro.livroID+"' ";
		pesquisa += "AND lancamentos.data BETWEEN '"+dataInicio+"' AND '"+dataFim+" 23:59:59"+"'";
		
		return pesquisa;
	}
	
	//Esse metodo irá pesquisar todas as contas a Pagas e Recebidas de Acordo com um Intervalo de Datas
	//Filtrando o resultado para trazer somente os lançamentos de uma Unidade Selecionada
	public String listaRecebimentosPorEmpresa(String dataInicio, String dataFim) {
				
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, lancamentos.* FROM lancamentos ";
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = lancamentos.formID ";
		pesquisa += "WHERE lancamentos.livroID = '"+livro.livroID+"' AND lancamentos.empresaID = '"+empresa.empresaID+"' ";
		pesquisa += "AND lancamentos.data BETWEEN '"+dataInicio+"' AND '"+dataFim+" 23:59:59"+"'";
		
		return pesquisa;
	}
	
	
	//Tras todas o TOTAL das dividas Quitadas de um Cliente em um Determinado Dia
	public String dividasQuitadasTotal(String dataBusca, String clienteID){
		String pesquisa = "SELECT venda.vendaID, venda.clienteID, cliente.clienteID, cliente.clienteNomeFantasia, lancamentos.vendaID, lancamentos.valor, SUM(lancamentos.valor) as total, lancamentos.formID ";
		pesquisa += "FROM lancamentos INNER JOIN venda ON venda.vendaID = lancamentos.vendaID ";
		pesquisa += "INNER JOIN cliente ON cliente.clienteID = venda.clienteID ";
		pesquisa += "WHERE lancamentos.data LIKE '"+dataBusca+"%' AND formID = '7' AND venda.clienteID = '"+clienteID+"'";
		
		return pesquisa;
	}
	
	//Tras todas as dividas Quitadas de um Cliente em um Determinado Dia
	public String dividasQuitadas(String dataBusca, String clienteID){
		String pesquisa = "SELECT venda.vendaID, venda.clienteID, venda.data AS dataVenda, cliente.clienteID, cliente.clienteNomeFantasia, lancamentos.* ";
		pesquisa += "FROM lancamentos INNER JOIN venda ON venda.vendaID = lancamentos.vendaID ";
		pesquisa += "INNER JOIN cliente ON cliente.clienteID = venda.clienteID ";
		pesquisa += "WHERE lancamentos.data LIKE '"+dataBusca+"%' AND formID = '7' AND venda.clienteID = '"+clienteID+"'";
		
		return pesquisa;
	}
	
	public String RecebidosporCliente(String clienteID) {
		String total =  " SELECT  receber.*, cliente.* from receber, cliente "; 
				total+=	" where date(receber.dataAlteracao) = date(now()) ";
				total+=" and cliente.clienteID = receber.clienteID ";
				total+=" and cliente.clienteID = '"+clienteID+"'";
		
		return total;
	}
	
	public String RecebidosporClienteSoma(String clienteID, String Data) {
		String total =  " SELECT  SUM(receber.valor) as total, cliente.* from receber, cliente "; 
				total+=	" where date(receber.dataAlteracao) = date('"+Data+"') ";
				total+=" and cliente.clienteID = receber.clienteID ";
				total+=" and cliente.clienteID = '"+clienteID+"'";
				total+=" and receber.status = 'P' ";
		
		return total;
	}
	
	public String RecebidosporClientePorData(String clienteID, String Data) {
		String total =  " SELECT  receber.*, cliente.*, servico.* from receber, cliente, servico "; 
				total+=	" where date(receber.dataAlteracao) = date('"+Data+"') ";
				total+=" and cliente.clienteID = receber.clienteID ";
				total+=" and cliente.clienteID = '"+clienteID+"'";
				total+=" and receber.status <> 'D' and servico.servicoID = receber.vendaID ";
		
		return total;
	}
	
	//Pesquisa qual foi o ultimo Lançamento
	public String ultimoLancamento() {
		return "SELECT * FROM lancamentos ORDER BY lancamentoID DESC LIMIT 1";
	}
	
	
	//Busca a Soma de Todos os Lançamentos Realizados entre um intervalo por um determinado usuário ((((SOMENTE DO TIPO 'R')))
	public String somaLancamentos(int lancamentoInicio, int lancamentoFim) {
		String soma = "SELECT SUM(valor) as totalLancamentos FROM lancamentos ";
		soma += "WHERE lancamentoID BETWEEN '"+lancamentoInicio+"' AND '"+lancamentoFim+"' ";
		soma += "AND (formID = '7' OR formID = '6' OR formID = '5' OR formID = '4') ";
		soma += "AND livroID = '1' AND tipo = 'R' AND usuario = '"+usuario.login+"'";
		
		return soma;
	}
	

	//Busca a Soma de Todas as dividas do Venda Vale pagas com um cheque
	public String somaLancamentosCheque(int lancamentoInicio, int lancamentoFim) {
		String soma = "SELECT receber.receberID, receber.formID, receber.status, ";
		soma += "SUM(lancamentos.valor) as totalLancamentos, lancamentos.receberID ";
		soma += "FROM lancamentos ";
		soma += "INNER JOIN receber ON receber.receberID = lancamentos.receberID ";
		soma += "WHERE lancamentos.formID = '7' AND receber.formID = '4' ";
		soma += "AND lancamentos.lancamentoID BETWEEN '"+lancamentoInicio+"' AND '"+lancamentoFim+"' ";
		soma += "AND lancamentos.usuario = '"+usuario.login+"'";
		
		return soma;
	}
	
	
	//Busca a Conta Quitada de acordo com o numero do Receber
	public String contasRecebidas() {
		String busca = "SELECT livrocaixa.livroID, livrocaixa.banco, lancamentos.* ";
		busca += "FROM lancamentos ";
		busca += "INNER JOIN livrocaixa ON livrocaixa.livroID = lancamentos.livroID ";
		busca += "WHERE receberID = '"+receber.receberID+"'";
		
		return busca;
	}
	
	//Busca a Conta Quitada de acordo com o numero do Pagar
	public String contasPagas() {
		String busca = "SELECT livrocaixa.livroID, livrocaixa.banco, lancamentos.* ";
		busca += "FROM lancamentos ";
		busca += "INNER JOIN livrocaixa ON livrocaixa.livroID = lancamentos.livroID ";
		busca += "WHERE pagarID = '"+pagar.pagarID+"'";
		
		return busca;
	}

}
