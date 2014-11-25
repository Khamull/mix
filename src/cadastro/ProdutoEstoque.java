package cadastro;

public class ProdutoEstoque {
	
	public int produtoEstoqueID;
	public Produto produto = new Produto();
	public Empresa empresa = new Empresa();
	public float quantidade;
	
	
	//Pesquisa se já tem estoque cadastrado para esse produto
	public String pesquisaEstoque() {
		return "SELECT * FROM produtoestoque WHERE produtoID = '"+produto.produtoID+"' AND empresaID = '"+empresa.empresaID+"'";
	}
	
	
	//Salva quantidade no Estoque
	public String salvaQuantidade() {
		String salvaQtdd = "INSERT INTO produtoestoque ";
		salvaQtdd += "(produtoID, empresaID, quantidade) ";
		salvaQtdd += "VALUES ";
		salvaQtdd += "('"+produto.produtoID+"', '"+empresa.empresaID+"', '"+quantidade+"')";
		
		return salvaQtdd;
	}
	
	
	//Altera quantidade no Estoque
	public String alteraEstoque() {
		String alteraQtdd = "UPDATE produtoestoque SET ";
		alteraQtdd += "quantidade = '"+quantidade+"' ";
		alteraQtdd += "WHERE produtoID = '"+produto.produtoID+"' AND empresaID = '"+empresa.empresaID+"'";
		
		return alteraQtdd;
	}

}
