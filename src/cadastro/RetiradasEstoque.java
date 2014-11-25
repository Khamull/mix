package cadastro;

public class RetiradasEstoque {
	
	public int retiradaID;
	public Produto produto = new Produto();
	public float quantidade;
	public String motivo;
	public Usuario usuario = new Usuario();
	public Empresa empresa = new Empresa();
	
	
	//Seleciona Retiradas através do ID de um produto
	public String retiradasPorProdutoID() {
		return "SELECT * FROM retiradasestoque WHERE produtoID = '"+produto.produtoID+"'";
	}
	
	
	//Pesquisa as Retiradas de um determinado produto entre um determinado intervalo
	public String retiradasEntreDatas(String dataInicio, String dataFim) {
		String busca = "SELECT * FROM retiradasestoque ";
		busca += "WHERE produtoID = '"+produto.produtoID+"' ";
		busca += "AND data BETWEEN '"+dataInicio+"' AND '"+dataFim+" 23:59:59"+"'";
		
		return busca;
	}
	
	//Pesquisa as Retiradas de um determinado produto entre um determinado intervalo
	public String retiradasEntreDatasDetalhada(String dataInicio, String dataFim) {
		String busca = "SELECT usuario.usuarioID, usuario.usuarioLogin, usuario.usuarioNome, retiradasestoque.* ";
		busca += "FROM retiradasestoque ";
		busca += "LEFT JOIN usuario ON usuario.usuarioID = retiradasestoque.usuario ";
		busca += "WHERE retiradasestoque.produtoID = '"+produto.produtoID+"' ";
		busca += "AND retiradasestoque.data BETWEEN '"+dataInicio+"' AND '"+dataFim+" 23:59:59"+"' ";
		busca += "GROUP BY retiradasestoque.retiradaID ";
		busca += "ORDER BY retiradasestoque.data DESC";
		
		return busca;
	}
	
	
	//Pesquisa todas as retiradas realizadas em um determinado Período
	public String retiradasEntreDatasRelatorio(String dataInicio, String dataFim) {
		String busca = "SELECT usuario.usuarioID, usuario.usuarioLogin, usuario.usuarioNome, produto.produtoID, produto.nome, produto.unidade, retiradasestoque.* ";
		busca += "FROM retiradasestoque ";
		busca += "LEFT JOIN usuario ON usuario.usuarioID = retiradasestoque.usuario ";
		busca += "INNER JOIN produto ON produto.produtoID = retiradasestoque.produtoID  ";
		busca += "WHERE retiradasestoque.data BETWEEN '"+dataInicio+"' AND '"+dataFim+" 23:59:59"+"' ";
		busca += "GROUP BY retiradasestoque.retiradaID ";
		busca += "ORDER BY retiradasestoque.data ASC";
		
		return busca;
	}
	
	
	//Pesquisa o total de retiradas de Estoque de um Determinado produto em um determinado periodo
	public String quantidadeRetirada(String dataInicio, String dataFim) {
		String busca = "SELECT SUM(quantidade) as totalRetirada FROM retiradasestoque ";
		busca += "WHERE produtoID = '"+produto.produtoID+"' ";
		busca += "AND data BETWEEN '"+dataInicio+"' AND '"+dataFim+"'";
		
		return busca;
	}
	
	//Cadastra uma Retirada do Estoque
	public String cadastraRetirada() {
		String cadastra = "INSERT INTO retiradasestoque ";
		cadastra += "(produtoID, quantidade, motivo, usuario, empresaID) VALUES";
		cadastra += "('"+produto.produtoID+"', '"+quantidade+"', '"+motivo+"', '"+usuario.login+"', '"+empresa.empresaID+"')";
		
		return cadastra;
	}

}
