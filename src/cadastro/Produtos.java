
package cadastro;


public class Produtos {
	//propriedades da clase para manipular os dados da tabela produtos, que guardaram os dados de produtos (Ex: Banner)
	public String nome;
	public int produtoID;
	public String codigo;
	public String ativo;
	public int rotina;
	
	//Objetos para acesso as outras classes de cadastro
	public TipoProduto tipo = new TipoProduto();
	public Fornecedor fornecedor = new Fornecedor();
	public Estoque estoque = new Estoque();
	
	
	//Status Produtos
	public String statusProduto(int numeroAcao){
		
		if(numeroAcao == 1){
			return "UPDATE produtos SET ativo = 'N' WHERE produtoID = '"+produtoID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE produtos SET ativo = 'S' WHERE produtoID = '"+produtoID+"'";
		}
		
		return null;
	}
	
	public String excluiProduto() {
		return "DELETE FROM produtos WHERE produtoID = '"+produtoID+"'";
	}
	//Pesquisa de produtos por código
	public String pesquisaProdutoPorCodigo(String cod) {
		
		String pesquisaProduto = " SELECT produtos.nome, produtos.produtoID, produtos.codigo, produtos.ativo";
		pesquisaProduto += " FROM produtos";
		pesquisaProduto += " WHERE produtos.codigo = '"+cod+"'";

		return pesquisaProduto;
	}
	//Pesquisa Produto por Nome
	public String pesquisaProdutos(String keyWord) {
		
		String pesquisaProduto = " SELECT produtos.nome, produtos.produtoID, produtos.codigo, produtos.ativo";
		pesquisaProduto += " FROM produtos";
		pesquisaProduto += " WHERE nome LIKE '%"+keyWord+"%'";
		
		return pesquisaProduto;
	}
	
	//pesquisa todos os produtos
	public String pesquisaProdutosTodos() {
		
		String pesquisaProduto = " SELECT produtos.*";
		pesquisaProduto += " FROM produtos";
	
		return pesquisaProduto;
	}
	
	
	//Adiciona novo produto a tabela Produtos
	public String salvaProduto() {
		String salvaProd = "INSERT INTO produtos ";
		salvaProd += " (rotinaID, nome, codigo) VALUES";
		salvaProd += " ('"+rotina+ "','"+nome+"', '"+codigo+"')";
		return salvaProd;
	}
	
	
	//Verificação para alterações e novos produtos
	//Verifica se Existe Produto Cadastrado com esse nome
		public String produtoNome() {
			return "SELECT * FROM produtos WHERE nome = '"+nome+"'";
		}
		
		//Verifica se Existe Produto Cadastrado com esse nome Antes de Alterar
		public String produtoNomeEditar() {
			return "SELECT * FROM produtos WHERE nome = '"+nome+"' AND produtoID <> '"+produtoID+"'";
		}
		
		//Verifica se Existe Produto Cadastrado com esse codigo
		public String produtoCodigo() {
			return "SELECT * FROM produtos WHERE codigo = '"+codigo+"'";
		}
		
		//Verifica se Existe Produto Cadastrado com esse codigo Antes de Alterar
		public String produtoCodigoEditar() {
			return "SELECT * FROM produtos WHERE codigo = '"+codigo+"' AND produtoID <> '"+produtoID+"'";
		}
		
		public String pesquisaProdutoID() {
			return "SELECT * FROM produtos WHERE  produtoID ='"+produtoID+"'";
		}
		
		public String alteraProduto() {
			String alterProd = "UPDATE produtos SET ";
			alterProd += " nome = '"+nome+"', codigo = '"+codigo+"'";
			alterProd += "WHERE produtoID = '"+produtoID+"'";
			
			return alterProd;
		}
	
	public String mensagem(int numeroMsg){
			
			switch (numeroMsg) {
			case 1:
				return "Produto Cadastrado com Sucesso!";
				
			case 2:
				return "Produto Alterado com Sucesso!";
				
			case 3:
				return "Produto Excluido com Sucesso!";
				
			case 4:
				return "Impossível Cadastrar! Já existe um produto cadastrado com esse Nome.";
			
			case 5:
				return "Impossível Alterar! Já existe um produto cadastrado com esse Nome.";
	
			case 6:
				return "";
				
			case 7:
				return "Impossível Cadastrar! Já existe um produto cadastrado com esse Código.";
				
			case 8:
				return "Impossível Alterar! Já existe um produto cadastrado com esse Código.";
				
			default:
				return "";
			}
		}

}
