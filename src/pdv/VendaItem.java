package pdv;

import cadastro.Produto;

public class VendaItem {
	
	public int itemID;
	public Venda venda = new Venda();
	public Produto produto = new Produto();
	public float quantidade;
	public float total;
	
	//Pesquisa informações do Item Adicionado
	public String pesquisItem() {
		return "SELECT * FROM vendaitem WHERE itemID = '"+itemID+"'";
	}
	
	//Pesquisa itens por ID da Venda
	public String listaItensPorID() {
		String pesquisaItem = "SELECT produto.produtoID, produto.tipoprodutoID, produto.codigo, produto.nome, produto.unidade, ";
		pesquisaItem += "tipoproduto.tipoprodutoID, tipoproduto.tipo, ";
		pesquisaItem += "vendaitem.* ";
		pesquisaItem += "FROM vendaitem ";
		pesquisaItem += "INNER JOIN produto ON produto.produtoID = vendaitem.produtoID ";
		pesquisaItem += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaItem += "WHERE vendaitem.vendaID = '"+venda.vendaID+"' ";
		pesquisaItem += "ORDER BY vendaitem.itemID DESC";
		
		return pesquisaItem;
	}
	
	//Insere os itens da venda na Base de dados
	public String salvaItem() {
		String salvaItem = "INSERT INTO vendaitem ";
		salvaItem += "(vendaID, produtoID, quantidade, valor, total) ";
		salvaItem += "VALUES ";
		salvaItem += "('"+venda.vendaID+"', '"+produto.produtoID+"', '"+quantidade+"', '"+produto.preco+"', '"+total+"')";
		
		return salvaItem;
	}
	
	//Remove o Item da Venda
	public String excluiItem() {
		return "DELETE FROM vendaitem WHERE itemID = '"+itemID+"'";
	}
	
	//Pesquisa a Soma do valor dos itens adicionados à Venda
	public String totalItem() {
		return "SELECT SUM(total) as subtotal FROM vendaitem WHERE vendaID = '"+venda.vendaID+"'";
	}

}
