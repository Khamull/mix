package servico;

import cadastro.Produto;
import cadastro.Produtos;

public class ServicoProduto {
	
	public int servicoProdutoID;
	public Servico servico = new Servico();
	public Produtos produtos = new Produtos();
	public String altura;
	public String largura;
	public float valor;
	public String pID;
	
		
	//Seleciona o produto que foi adicionado ao Servico
	public String listaProdutos() {
		String pesquisaProd = "SELECT produtos.*, servicoproduto.*, servico.*, servico.valor as val ";
		pesquisaProd += "FROM servicoproduto INNER JOIN produtos ON produtos.produtoID = servicoproduto.produtoID INNER JOIN servico ON servico.servicoID = servicoproduto.servicoID ";
		pesquisaProd += "WHERE servicoproduto.servicoID = '"+servico.servicoID+"'";
		
		return pesquisaProd;
	}
	
	public String pesquisaOutrosProdutos(String prdID) {//Pesquisa Todos os Produtos menos o que já esta selecionado no serviço
		
		String pesquisaProduto = " SELECT produtos.*";
		pesquisaProduto += " FROM produtos";
		pesquisaProduto += " where produtoID <> "+ prdID;
		pesquisaProduto += " order by nome asc";
	
		return pesquisaProduto;
	}
	
	public String listaProdutosOS(String OS, String Ano) {
		String pesquisaProd = "SELECT produtos.*, servicoproduto.*, servico.*, servico.valor as val ";
		pesquisaProd += "FROM servicoproduto INNER JOIN produtos ON produtos.produtoID = servicoproduto.produtoID INNER JOIN servico ON servico.servicoID = servicoproduto.servicoID ";
		pesquisaProd += "WHERE servico.OS = '"+OS+"' AND servico.anoServico = '"+Ano+"'";
		
		return pesquisaProd;
	}
	
	public String RetornaRotina() {
		String pesquisaProd = "SELECT produtos.produtoID, produtos.nome, produtos.rotinaID, servicoproduto.* ";
		pesquisaProd += "FROM servicoproduto INNER JOIN produtos ON produtos.produtoID = servicoproduto.produtoID ";
		pesquisaProd += "WHERE servicoproduto.servicoID = '"+servico.servicoID+"'";
		
		return pesquisaProd;
	}
	
	public String listaToldos() {
		String pesquisaProd = "SELECT produtos.produtoID, produtos.nome, servicoproduto.* ";
		pesquisaProd += " FROM servicoproduto INNER JOIN produtos ON produtos.produtoID = servicoproduto.produtoID ";
		pesquisaProd += " WHERE servicoproduto.servicoID = '"+servico.servicoID+"'";
		pesquisaProd += " AND produtos.produtoID = 0";
		
		return pesquisaProd;
	}
	
	public String listaProdutosNovo(String produtoID) {
		
		String pesquisaProd =" SELECT * from servicomateriais inner join produto on produto.produtoID = servicomateriais.idMaterial ";
		pesquisaProd += " left join produtos on produtos.produtoID = servicomateriais.produtoID ";
		pesquisaProd += " where servicomateriais.idServico ='"+servico.servicoID+"' ";
		pesquisaProd += " AND servicomateriais.produtoID ='"+produtoID+"'";
		
		return pesquisaProd;
	}
	

	//Seleciona o produto que foi adicionado ao Servico
	public String listaProdutosCupom() {
		String pesquisaProd = "SELECT produto.produtoID, produto.nome, produto.codigo, produto.tipoprodutoID, produto.unidade, ";
		pesquisaProd += "tipoproduto.tipoprodutoID, tipoproduto.tipo, ";
		pesquisaProd += "servicoproduto.* ";
		pesquisaProd += "FROM servicoproduto INNER JOIN produto ON produto.produtoID = servicoproduto.produtoID ";
		pesquisaProd += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProd += "WHERE servicoproduto.servicoID = '"+servico.servicoID+"'";
		
		return pesquisaProd;
	}
	
	public String updateMateriais(int ServicoID,int ProdutoID, int ProdutoIDNovo){
		String update = "UPDATE servicomateriais SET produtoID='"+ProdutoIDNovo+"' where idServico ='"+ServicoID+"'  and produtoID='"+ProdutoID+"'";
		return update;
	}
	
	//Pesquisa produto por ID
	public String pequisaProduto() {
		return "SELECT * FROM servicoproduto WHERE servicoprodutoID = '"+servicoProdutoID+"'";
	}
	
	//Cadastra Produto no Servico
	public String salvaProduto(String altura, String largura, String qtdProduto, String valor_) {
		String salvaProd = "INSERT INTO servicoproduto (servicoID, produtoID, valor, qtdProduto, altura, largura) VALUES ";
		salvaProd += "('"+servico.servicoID+"', '"+produtos.produtoID+"','"+valor_.replace(",", ".")+"','"+qtdProduto+"','"+altura+"','"+largura+"')";
		
		return salvaProd;
	}
	
	//Exclui Produto do Serviço
	public String excluiProduto() {
		return "DELETE FROM servicoproduto WHERE servicoprodutoID = '"+servicoProdutoID+"'";
	}
	
	//Exclui Produto do Serviço
		public String excluiMateriais() {
			
			String del ="DELETE FROM `servicomateriais` WHERE idServico = '"+servico.servicoID+"' and produtoID = '"+pID+"'";  
			return del;
		}

}
