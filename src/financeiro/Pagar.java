package financeiro;

import cadastro.Empresa;
import pdv.FormaPagamento;

public class Pagar {
	
	public int pagarID;
	public ContasPagar conta = new ContasPagar();
	public FormaPagamento forma = new FormaPagamento();
	public float valor;
	public String vencimento;
	public int parcela;
	public int de;
	public String status;
	public Empresa empresa = new Empresa();
	
	
	//Insere uma conta a Pagar na Base de Dados
	public String cadastraPagar() {
		String inserePagar = "INSERT INTO pagar ";
		inserePagar += "(contapagarID, formID, valor, vencimento, parcela, de, status, empresaID) ";
		inserePagar += "VALUES ('"+conta.contaID+"', '"+forma.formPagID+"', '"+valor+"', '"+vencimento+"', '"+parcela+"', '"+de+"', '"+status+"', '"+empresa.empresaID+"')";
		
		return inserePagar;
	}
	
	
	//Pesquisa Contas a pagar de acordo com a data Passada
	public String pesquisaConta(String dataInicio, String dataFim) {
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "contapagar.contapagarID, contapagar.favorecido, ";//contas à pagar
		pesquisa += "pagar.*";//pagar
		pesquisa += "FROM pagar ";//Tabela Principal
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = pagar.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN contapagar ON contapagar.contapagarID = pagar.contapagarID ";//INNER JOIN contas a pagar
		pesquisa += "WHERE status = 'D' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND pagar.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY pagar.vencimento ASC, pagar.pagarID  ASC";//Ordena por Order de Pagamento
		
		return pesquisa;
	}
	
	//Pesquisa Contas a pagar de acordo com a data Passada e uma forma de Pagamento
	public String pesquisaContaPorForma(String dataInicio, String dataFim) {
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "contapagar.contapagarID, contapagar.favorecido, ";//contas à pagar
		pesquisa += "pagar.*";//pagar
		pesquisa += "FROM pagar ";//Tabela Principal
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = pagar.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN contapagar ON contapagar.contapagarID = pagar.contapagarID ";//INNER JOIN contas a pagar
		pesquisa += "WHERE status = 'D' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND pagar.formID = '"+forma.formPagID+"' ";
		pesquisa += "AND pagar.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY pagar.vencimento ASC, pagar.pagarID  ASC";//Ordena por Order de Pagamento
		
		return pesquisa;
	}
	
	
	//Pesquisa as Contas Pagas de acordo com a data Passada
	public String contaPaga(String dataInicio, String dataFim) {
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "contapagar.contapagarID, contapagar.favorecido, ";//contas à pagar
		pesquisa += "pagar.*";//pagar
		pesquisa += "FROM pagar ";//Tabela Principal
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = pagar.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN contapagar ON contapagar.contapagarID = pagar.contapagarID ";//INNER JOIN contas a pagar
		pesquisa += "WHERE status = 'P' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND pagar.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY pagar.vencimento ASC, pagar.pagarID  ASC";//Ordena por Order de Pagamento
		
		return pesquisa;
	}
	
	
	//Pesquisa as Contas Pagas de acordo com a data Passada e uma forma de Pagamento
	public String contaPagasPorForma(String dataInicio, String dataFim) {
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "contapagar.contapagarID, contapagar.favorecido, ";//contas à pagar
		pesquisa += "pagar.*";//pagar
		pesquisa += "FROM pagar ";//Tabela Principal
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = pagar.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN contapagar ON contapagar.contapagarID = pagar.contapagarID ";//INNER JOIN contas a pagar
		pesquisa += "WHERE status = 'P' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND pagar.formID = '"+forma.formPagID+"' ";
		pesquisa += "AND pagar.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "ORDER BY pagar.vencimento ASC, pagar.pagarID  ASC";//Ordena por Order de Pagamento
		
		return pesquisa;
	}
	
	
	//Pesquisa a Conta a Pagar pelo ID
	public String pagarPorID() {
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "contapagar.contapagarID, contapagar.favorecido, ";//contas à pagar
		pesquisa += "pagar.*";//receber
		pesquisa += "FROM pagar ";//Tabela Principal
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = pagar.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN contapagar ON contapagar.contapagarID = pagar.contapagarID ";//INNER JOIN
		pesquisa += "WHERE pagarID = '"+pagarID+"'";
		
		return pesquisa;
	}
	
	//Pesquisa Contas a Pagar de acordo com a data Passada
	public String detalhePagamento() {
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "contapagar.contapagarID, contapagar.favorecido, contapagar.valor as total, ";//contas à pagar
		pesquisa += "lancamentos.valor as pago, lancamentos.desconto, lancamentos.acrescimo, lancamentos.observacao, lancamentos.data, ";
		pesquisa += "pagar.*";//pagar
		pesquisa += "FROM pagar ";//Tabela Principal
		pesquisa += "INNER JOIN lancamentos ON lancamentos.pagarID = pagar.pagarID ";
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = pagar.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN contapagar ON contapagar.contapagarID = pagar.contapagarID ";//INNER JOIN contas a pagar
		pesquisa += "WHERE pagar.pagarID = '"+pagarID+"' ";
		
		return pesquisa;
	}
	
	//Pesquisa o valor total a receber aquele mês
	public String totalPagar(String dataInicio, String dataFim) {
		String total = "SELECT SUM(valor) as faltaPagar FROM pagar ";
		total += "WHERE status = 'D' AND vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"'";
		
		return total;
	}
	
	//Pesquisa Contas a pagar de acordo com a data Passada filtrando por uma Unidade
	public String pesquisaContaPorEmpresa(String dataInicio, String dataFim) {
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "contapagar.contapagarID, contapagar.favorecido, ";//contas à pagar
		pesquisa += "pagar.*";//pagar
		pesquisa += "FROM pagar ";//Tabela Principal
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = pagar.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN contapagar ON contapagar.contapagarID = pagar.contapagarID ";//INNER JOIN contas a pagar
		pesquisa += "WHERE status = 'D' ";//se status for igual a 'D' de DEVENDO
		pesquisa += "AND pagar.vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";//Entre as Datas passadas por Parametro
		pesquisa += "AND pagar.empresaID = '"+empresa.empresaID+"'";
		pesquisa += "ORDER BY pagar.vencimento ASC, pagar.pagarID  ASC";//Ordena por Order de Pagamento
		
		return pesquisa;
	}
	
	//Pesquisa o valor total a receber aquele mês Filtrando por Unidade
	public String totalPagarPorEmpresa(String dataInicio, String dataFim) {
		String total = "SELECT SUM(valor) as faltaPagar FROM pagar ";
		total += "WHERE status = 'D' AND vencimento BETWEEN '"+dataInicio+"' AND '"+dataFim+"' AND empresaID = '"+empresa.empresaID+"'";
		
		return total;
	}
	
	//Altera valor e data de vencimento da Conta à Pagar
	public String alteraPagar() {
		return "UPDATE pagar SET valor = '"+valor+"', vencimento = '"+vencimento+"' WHERE pagarID = '"+pagarID+"'";
	}
	
	//Atualiza status da Conta a Pagar para 'P' de Pago
	public String alteraStatus() {
		return "UPDATE pagar SET status = 'P' WHERE pagarID = '"+pagarID+"'";
	}
	
	//Exclui a conta a Pagar
	public String excluiPagar() {
		return "DELETE FROM pagar WHERE pagarID = '"+pagarID+"'";
	}
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Valor Pago com Sucesso!";
			
		case 2:
			return "Conta a Pagar Alterada com Sucesso!";
			
		case 3:
			return "Conta Cadastrada com Sucesso!";
			
		case 4:
			return "Conta a Pagar Excluida com Sucesso!";
		
		case 5:
			return "";

		default:
			return "";
		}
	}
}
