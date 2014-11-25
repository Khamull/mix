package pdv;

import cadastro.Produto;

public class OrcamentoItem {
	
	public int itemID;
	public Orcamento orcamento = new Orcamento();
	public Produto produto = new Produto();
	public float quantidade;
	public float total;
	
	//Pesquisa informações do Item Adicionado
	public String pesquisItem() {
		return "SELECT * FROM orcamentoitem WHERE itemID = '"+itemID+"'";
	}
	
	//Pesquisa itens por ID do orcamento
	public String listaItensPorID() {
		String pesquisaItem = "SELECT produto.produtoID, produto.tipoprodutoID, produto.codigo, produto.nome, produto.unidade, ";
		pesquisaItem += "tipoproduto.tipoprodutoID, tipoproduto.tipo, ";
		pesquisaItem += "orcamentoitem.* ";
		pesquisaItem += "FROM orcamentoitem ";
		pesquisaItem += "INNER JOIN produto ON produto.produtoID = orcamentoitem.produtoID ";
		pesquisaItem += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaItem += "WHERE orcamentoitem.orcamentoID = '"+orcamento.orcamentoID+"' ";
		pesquisaItem += "ORDER BY orcamentoitem.itemID DESC";
		
		return pesquisaItem;
	}
	
	//Insere os itens do orcamento na Base de dados
	public String salvaItem() {
		String salvaItem = "INSERT INTO orcamentoitem ";
		salvaItem += "(orcamentoID, produtoID, quantidade, valor, total) ";
		salvaItem += "VALUES ";
		salvaItem += "('"+orcamento.orcamentoID+"', '"+produto.produtoID+"', '"+quantidade+"', '"+produto.preco+"', '"+total+"')";
		
		return salvaItem;
	}
	
	//Remove o Item do orcamento
	public String excluiItem() {
		return "DELETE FROM orcamentoitem WHERE itemID = '"+itemID+"'";
	}
	
	
	//Remove todos os Itens de um orcamento
	public String removeItens() {
		return "DELETE FROM orcamentoitem WHERE orcamentoID = '"+orcamento.orcamentoID+"'";
	}
	
	//Pesquisa a Soma do valor dos itens adicionados ao orcamento
	public String totalItem() {
		return "SELECT SUM(total) as subtotal FROM orcamentoitem WHERE orcamentoID = '"+orcamento.orcamentoID+"'";
	}

}
