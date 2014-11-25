package servico;

import cadastro.Produto;
import cadastro.Produtos;

public class ServicoMateriais {
	
	public int servicoProdutoID;
	public Servico servico = new Servico();
	public Produto produto = new Produto();
	public Produtos produtos = new Produtos();
	public String altura;
	public String largura;
	public String Quantidade;
	public String alturaR;
	public String larguraR;
	public String QuantidadeR;
	public float valorCusto;
	public float valor;//Venda informado no Formulário
	
	
	
		
	//Seleciona o produto que foi adicionado ao Servico
	public String listaProdutos() {
		String pesquisaProd = "SELECT produtos.produtoID, produtos.nome, servicoproduto.*, servicomateriais.* ";
		pesquisaProd += "FROM servicoproduto INNER JOIN produtos ON produtos.produtoID = servicoproduto.produtoID ";
		pesquisaProd += "WHERE servicoproduto.servicoID = '"+servico.servicoID+"'";
		
		return pesquisaProd;
	}
	
	//Seleciona o produto que foi adicionado ao Servico
	public String listaProdutosCupom() {//para alterar impressão
		String pesquisaProd = "SELECT produto.produtoID, produto.nome, produto.codigo, produto.tipoprodutoID, produto.unidade, ";
		pesquisaProd += "tipoproduto.tipoprodutoID, tipoproduto.tipo, ";
		pesquisaProd += "servicoproduto.* ";
		pesquisaProd += "FROM servicoproduto INNER JOIN produto ON produto.produtoID = servicoproduto.produtoID ";
		pesquisaProd += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProd += "WHERE servicoproduto.servicoID = '"+servico.servicoID+"'";
		
		return pesquisaProd;
	}
	
	//Pesquisa produto por ID
	public String pequisaProduto() {
		return "SELECT * FROM servicoproduto WHERE servicoprodutoID = '"+servicoProdutoID+"'";
	}
	
	//Cadastra Produto no Servico
	public String salvaProduto() {
		String salvaProd = "INSERT INTO servicoproduto (servicoID, produtoID, altura, largura, valor) VALUES ";
		salvaProd += "('"+servico.servicoID+"', '"+produto.produtoID+"','"+altura+"','"+largura+"','"+valor+"')";
		
		return salvaProd;
	}
	
	
	public String insereMaterial() {
		String salvaProd  = "INSERT INTO servicomateriais ";
		salvaProd += " (idServico ,  idMaterial , produtoID,  valorCusto , quantidadeReal ,  valorVenda )";
		salvaProd += " VALUES ('"+servico.servicoID+"','"+produto.produtoID+"','"+produtos.produtoID+"','"+valorCusto+"','"+QuantidadeR+"','"+valor+"')";
		
		return salvaProd;
	}
	
	public String selectMaterial() {
		String selctMat  = "SELECT * FROM `servicomateriais` WHERE idServico ='"+servico.servicoID+"'";
		
		return selctMat;
	}
	
	
	
	//Exclui Produto do Serviço
	public String excluiProduto() {
		return "DELETE FROM servicoproduto WHERE servicoprodutoID = '"+servicoProdutoID+"'";
	}

}
