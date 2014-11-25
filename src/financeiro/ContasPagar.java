package financeiro;

import cadastro.Empresa;
import pdv.FormaPagamento;

public class ContasPagar {
	
	public int contaID;
	public FormaPagamento formPag = new FormaPagamento();
	public String favorecido;
	public float valor;
	public int vezes;
	public int intervalo;
	public String data;
	public String usuario;
	public Empresa empresa = new Empresa();
	
	
	
	//Cadastra uma Conta à Receber
	public String cadastraConta() {
		String cadastrar = "INSERT INTO contapagar ";
		cadastrar += "(formPagID, favorecido, valor, vezes, intervalo, data, usuario, empresaID) ";
		cadastrar += "VALUES ('"+formPag.formPagID+"', '"+favorecido+"', '"+valor+"', '"+vezes+"', '"+intervalo+"', '"+data+"', '"+usuario+"', '"+empresa.empresaID+"')";
		
		return cadastrar;
	}
	
	
	//Pesquisa a ultima Conta a Receber
	public String ultimaConta() {
		return "SELECT * FROM contapagar ORDER BY contapagarID DESC LIMIT 1";
	}
	
	
	//Pesquisa conta por ID
	public String contaPorId() {
		return "SELECT * FROM contapagar WHERE contapagarID = '"+contaID+"'";
	}
	
	//Pesquisa Contas a receber de acordo com a data Passada
	public String detalhePagamento() {
		String pesquisa = "SELECT formapagamento.formID, formapagamento.descricao, ";//forma de Pagamento
		pesquisa += "contapagar.contapagarID, contapagar.favorecido, contapagar.valor as total, ";//contas à pagar
		pesquisa += "lancamentos.valor as pago, lancamentos.desconto, lancamentos.acrescimo, lancamentos.observacao, ";
		pesquisa += "pagar.*";//pagar
		pesquisa += "FROM pagar ";//Tabela Principal
		pesquisa += "INNER JOIN lancamentos ON lancamentos.pagarID = pagar.pagarID ";
		pesquisa += "INNER JOIN formapagamento ON formapagamento.formID = pagar.formID ";//INNER JOIN forma de Pagamento
		pesquisa += "INNER JOIN contapagar ON contapagar.contapagarID = pagar.contapagarID ";//INNER JOIN contas a pagar
		pesquisa += "WHERE contapagar.contapagarID = '"+contaID+"' ";
		
		return pesquisa;
	}
	
	
}
