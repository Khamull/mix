package cadastro;

public class Produto {
	
	public int produtoID;
	public TipoProduto tipo = new TipoProduto();
	public Fornecedor fornecedor = new Fornecedor();
	public String nome;
	public String codigo;
	public String unidade;
	public double precoCusto;
	public double preco;
	public int estoqueMinimo;
	public float estoque;
	public String lucro;
	
	//Lista todos os Produtos
	public String listaProdutos() {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProduto += "ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	
	
	//MIX Publicidade Lista de Produtos
	public String listaProdutosNova() {
		//SELECT distinct(produto.nome), estoque.produtoID, produto.codigo, produto.estoque, produto.estoqueMinimo, ROUND(AVG(estoque.precoCusto),2) as precoCusto, estoque.unidade FROM estoque inner join produto on estoque.produtoID = produto.produtoID
		//group by produto.nome
		String pesquisaProduto = " SELECT distinct(produto.nome), estoque.produtoID, produto.codigo, produto.estoque as quantidade, produto.estoqueMinimo, ROUND(estoque.precoCusto,2) as precoCusto, estoque.unidade, produto.produtoAtivo";
		pesquisaProduto += " FROM estoque inner join produto on estoque.produtoID = produto.produtoID";
		pesquisaProduto += " group by produto.nome";
		pesquisaProduto += " ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	//Produtos por ID Mix Publicidade
	public String listaProdutosIDNova() {
		//SELECT distinct(produto.nome), estoque.produtoID, produto.codigo, produto.estoque, produto.estoqueMinimo, ROUND(AVG(estoque.precoCusto),2) as precoCusto, estoque.unidade FROM estoque inner join produto on estoque.produtoID = produto.produtoID
		//group by produto.nome
		String pesquisaProduto = " SELECT distinct(produto.nome), estoque.produtoID, produto.codigo, produto.estoque as quantidade, produto.estoque, produto.estoqueMinimo, ROUND(AVG(estoque.precoCusto),2) as precoCusto, estoque.unidade, produto.produtoAtivo";
		pesquisaProduto += " FROM estoque inner join produto on estoque.produtoID = produto.produtoID";
		pesquisaProduto += " WHERE produto.produtoID = '"+produtoID+"'";
		pesquisaProduto += " group by produto.nome";
		pesquisaProduto += " ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	public String listaPrecosporID() {
		//SELECT distinct(produto.nome), estoque.produtoID, produto.codigo, produto.estoque, produto.estoqueMinimo, ROUND(AVG(estoque.precoCusto),2) as precoCusto, estoque.unidade FROM estoque inner join produto on estoque.produtoID = produto.produtoID
		//group by produto.nome
		String pesquisaProduto = " SELECT preco";
		pesquisaProduto += " FROM produto ";
		pesquisaProduto += " WHERE produto.produtoID = '"+produtoID+"'";
		
		return pesquisaProduto;
	}
	
	//Lista todos os produtos Ativos
	public String listaProdutosAtivos() {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProduto += "WHERE produtoAtivo = 'S' ";
		pesquisaProduto += "ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	public String listaProdutosAtivos_Selecao() {
		String pesquisaProduto = "SELECT * FROM produto WHERE produtoAtivo = 'S'";
		
		return pesquisaProduto;
	}
	
	public String listaProdutosPorID_() {
		String pesquisaProduto = "SELECT * FROM produto WHERE produto.produtoID = '"+produtoID+"' ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	//Lista todos os Produtos
	public String listaProdutosPorID() {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID WHERE produto.produtoID = '"+produtoID+"' ";
		pesquisaProduto += "ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	public String listaProdutosPorIDNovo() {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID WHERE produto.produtoID = '"+produtoID+"' ";
		pesquisaProduto += "ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	//pesquisa produto por Codigo
	public String pesquisaProdutoPorCodigo(String cod) {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProduto += " WHERE produto.codigo = '"+cod+"' ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	//Pesquisa Produto por Código Mix Publicidade
	public String pesquisaProdutoPorCodigoNova(String cod) {
		
		String pesquisaProduto = " SELECT distinct(produto.nome), estoque.produtoID, produto.codigo, produto.estoque as quantidade, produto.estoqueMinimo, ROUND(AVG(estoque.precoCusto),2) as precoCusto, estoque.unidade, produto.produtoAtivo";
		pesquisaProduto += " FROM estoque inner join produto on estoque.produtoID = produto.produtoID";
		pesquisaProduto += " WHERE produto.codigo = '"+cod+"'";
		pesquisaProduto += " group by produto.nome";
		pesquisaProduto += " ORDER BY produto.nome ASC";

		return pesquisaProduto;
	}
	
	//Pesquisa Produto por Nome
	public String pesquisaProdutos(String keyWord) {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProduto += " WHERE nome LIKE '%"+keyWord+"%' ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	//Pesquisa Prdoutos por Nome Mix Publicidade
	public String pesquisaProdutosNova(String keyWord) {
		
		String pesquisaProduto = " SELECT distinct(produto.nome), estoque.produtoID, produto.codigo, produto.estoque as quantidade, produto.estoqueMinimo, ROUND(AVG(estoque.precoCusto),2) as precoCusto, estoque.unidade, produto.produtoAtivo";
		pesquisaProduto += " FROM estoque inner join produto on estoque.produtoID = produto.produtoID";
		pesquisaProduto += " WHERE produto.nome LIKE '%"+keyWord+"%'";
		pesquisaProduto += " group by produto.nome";
		pesquisaProduto += " ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	
	
	//Pesquisa Produtos por Fornecedor e Por Tipo
	public String produtoPorFT() {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProduto += "WHERE produto.fornecedorID = '"+fornecedor.fornecedorID+"' ";
		pesquisaProduto += "AND produto.tipoprodutoID = '"+tipo.tipoProdutoID+"' ";
		pesquisaProduto += "ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	//Pesquisa Produtos por Fornecedor
	public String produtoPorF() {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProduto += "WHERE produto.fornecedorID = '"+fornecedor.fornecedorID+"' ";
		pesquisaProduto += "ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	//Pesquisa Produtos por Tipo
	public String produtoPorT() {
		String pesquisaProduto = "SELECT fornecedor.fornecedorID, fornecedor.fornNomeFantasia, tipoproduto.tipoprodutoID, tipoproduto.tipo, produto.* ";
		pesquisaProduto += "FROM produto INNER JOIN fornecedor ON fornecedor.fornecedorID = produto.fornecedorID ";
		pesquisaProduto += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProduto += "WHERE produto.tipoprodutoID = '"+tipo.tipoProdutoID+"' ";
		pesquisaProduto += "ORDER BY produto.nome ASC";
		
		return pesquisaProduto;
	}
	
	//Verifica se Existe Produto Cadastrado com esse nome
	public String produtoNome() {
		return "SELECT * FROM produto WHERE nome = '"+nome+"'";
	}
	
	//Verifica se Existe Produto Cadastrado com esse nome Antes de Alterar
	public String produtoNomeEditar() {
		return "SELECT * FROM produto WHERE nome = '"+nome+"' AND produtoID <> '"+produtoID+"'";
	}
	
	//Verifica se Existe Produto Cadastrado com esse codigo
	public String produtoCodigo() {
		return "SELECT * FROM produto WHERE codigo = '"+codigo+"'";
	}
	
	//Verifica se Existe Produto Cadastrado com esse codigo Antes de Alterar
	public String produtoCodigoEditar() {
		return "SELECT * FROM produto WHERE codigo = '"+codigo+"' AND produtoID <> '"+produtoID+"'";
	}
	
	//Pesquisa Produtos vinculados a um determinado Fornecedor
	public String produtoPorFornecedor(String fornID) {
		return "SELECT * FROM produto WHERE fornecedorID = '"+fornID+"' ORDER BY nome ASC";
	}
	
	//Insere na Base de Dados
	public String salvaProduto() {
		String salvaProd = "INSERT INTO produto ";
		salvaProd += "(tipoprodutoID, fornecedorID, nome, codigo, unidade, precoCusto, preco, estoqueminimo, estoque, lucro) VALUES";
		salvaProd += "('"+tipo.tipoProdutoID+"', '"+fornecedor.fornecedorID+"', '"+nome+"', '"+codigo+"', '"+unidade+"', '"+precoCusto+"', '"+preco+"', '"+estoqueMinimo+"', '"+estoque+"', '"+lucro+"' ) ";
		
		return salvaProd;
	}
	
	public String salvaMateriaisServico() {
		String salvaProd = "INSERT INTO servicomateriais ";
		salvaProd += "(tipoprodutoID, fornecedorID, nome, codigo, unidade, precoCusto, preco, estoqueminimo, estoque, lucro) VALUES";
		salvaProd += "('"+tipo.tipoProdutoID+"', '"+fornecedor.fornecedorID+"', '"+nome+"', '"+codigo+"', '"+unidade+"', '"+precoCusto+"', '"+preco+"', '"+estoqueMinimo+"', '"+estoque+"', '"+lucro+"' ) ";
		
		return salvaProd;
	}
	
	//Altera Produto
	public String alteraProduto() {
		String alterProd = "UPDATE produto SET ";
		alterProd += "tipoprodutoID = '"+tipo.tipoProdutoID+"', fornecedorID = '"+fornecedor.fornecedorID+"', nome = '"+nome+"', codigo = '"+codigo+"', ";
		alterProd += "unidade = '"+unidade+"', precoCusto = '"+precoCusto+"', preco = '"+preco+"', estoqueminimo = '"+estoqueMinimo+"', ";
		alterProd += "estoque = '"+estoque+"', lucro = '"+lucro+"' ";
		alterProd += "WHERE produtoID = '"+produtoID+"'";
		
		return alterProd;
	}
	
	
	//Altera Estoque do Produto
	public String alteraEstoqueProduto() {
		return "UPDATE produto SET estoque = '"+estoque+"' WHERE produtoID = '"+produtoID+"'";
	}
	
	//Exclui Produto
	public String excluiProduto() {
		return "DELETE FROM produto WHERE produtoID = '"+produtoID+"'";
	}
	
	//Muda Status do Produto para ATIVO(S) OU INATIVO(N)
	public String statusProduto(int numeroAcao){
		
		if(numeroAcao == 1){
			return "UPDATE produto SET produtoAtivo = 'N' WHERE produtoID = '"+produtoID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE produto SET produtoAtivo = 'S' WHERE produtoID = '"+produtoID+"'";
		}
		
		return null;
	}
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Material Cadastrado com Sucesso!";
			
		case 2:
			return "Material Alterado com Sucesso!";
			
		case 3:
			return "Material Excluido com Sucesso!";
			
		case 4:
			return "Impossível Cadastrar! Já existe um material cadastrado com esse Nome.";
		
		case 5:
			return "Impossível Alterar! Já existe um material cadastrado com esse Nome.";

		case 6:
			return "Estoque Alterado com Sucesso!";
			
		case 7:
			return "Impossível Cadastrar! Já existe um material cadastrado com esse Código.";
			
		case 8:
			return "Impossível Alterar! Já existe um material cadastrado com esse Código.";
			
		default:
			return "";
		}
	}

}
