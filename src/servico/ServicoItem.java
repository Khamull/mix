package servico;

public class ServicoItem {
	
	public int servicoItemID;
	public Servico servico = new Servico();
	public String descricao;
	public float valor;
	
	
	//Lista todos os Itens de um Serviço
	public String listaItens() {
		return "SELECT * FROM servicoitem WHERE servicoID = '"+servico.servicoID+"'";
	}
	
	//Pesquisa um item especifico
	public String pesquisaItem() {
		return "SELECT * FROM servicoitem WHERE servicoitemID = '"+servicoItemID+"'";
	}
	
	//Cadastra item no Serviço
	public String salvaItem() {
		String salvaItem = "INSERT INTO servicoitem (servicoID, descricao, valor) VALUES ";
		salvaItem += "('"+servico.servicoID+"', '"+descricao+"', '"+valor+"')";
		
		return salvaItem;
	}
	
	//Exclui item
	public String excluiItem() {
		return "DELETE FROM servicoitem WHERE servicoitemID = '"+servicoItemID+"'";
	}

}
