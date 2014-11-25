package cadastro;

public class Estoque {
	
	public int estoqueID;
	public Fornecedor fornecedor = new Fornecedor();
	public Produto produto = new Produto();
	public float quantidade;
	public String usuario;
	public Empresa empresa = new Empresa();
	//public String unidade;
	
	
	//Pesquisa Estoque por ID do produto
	public String pesquisaEstoque() {
		return "SELECT estoque FROM produto WHERE produtoID = '"+produto.produtoID+"'";
	}
	
	//Cadatra alimentação de Estoque
	public String salvaEstoque() {
		String salvarEst = "INSERT INTO estoque ";
		salvarEst += "(fornecedorID, produtoID, quantidade, precoCusto, preco, lucro, unidade, usuario, empresaID) ";
		salvarEst += "VALUES ";
		salvarEst += "('"+fornecedor.fornecedorID+"', '"+produto.produtoID+"', '"+quantidade+"', '"+produto.precoCusto+"', ";
		salvarEst += "'"+produto.preco+"', '"+produto.lucro+"', '"+produto.unidade+"', '"+usuario+"', '"+empresa.empresaID+"')";
		
		return salvarEst;
	}
	
	//Atualiza produto
	public String alteraEstoqueProduto() {
		String alteraEst = "UPDATE produto SET precoCusto = '"+produto.precoCusto+"', preco = '"+produto.preco+"', estoque = '"+quantidade+"', ";
		alteraEst += "lucro = '"+produto.lucro+"', unidade = '"+produto.unidade+"' ";
		alteraEst += "WHERE produtoID = '"+produto.produtoID+"'";
		
		return alteraEst;
	}
	
	//Atualiza estoque depois da inclusão do produto
	public String alteraEstoque() {
		return "UPDATE produto SET estoque = '"+produto.estoque+"' WHERE produtoID = '"+produto.produtoID+"'";
	}
	
	
	//Pesquisa a soma de todos os itens no Estoque dos produtos Ativos
	public String qtdTotalEstoque() {
		return "SELECT SUM(estoque) AS produtoEstoque, precoCusto FROM produto WHERE produtoAtivo = 'S'";
	}
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "";
			
		case 2:
			return "";
			
		case 3:
			return "";
			
		case 4:
			return "";
		
		case 5:
			return "";

		default:
			return "";
		}
	}

}
