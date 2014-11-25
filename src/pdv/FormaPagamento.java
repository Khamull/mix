package pdv;

public class FormaPagamento {
	
	public int formPagID;
	public String formPagNome;
	
	
	//Seleciona todas as formas de Pagamento Ordenadas por ID
	public String listaFormasPagamento() {
		return "SELECT * FROM formapagamento WHERE formAtivo = 'S' ORDER BY formID";
	}
	
	//Seleciona forma de pagamento através do ID
	public String formaPorID() {
		return "SELECT * FROM formapagamento WHERE formID = '"+formPagID+"'";
	}

}
