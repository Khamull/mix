
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" language="java" %>
<%@ page language="java" import="java.util.*,java.lang.*" %> 

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="materiais" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="produtoestoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="produtos" class="cadastro.Produtos" scope="page"></jsp:useBean>

<jsp:useBean id="insertMateriais" class="servico.ServicoMateriais" scope="page"></jsp:useBean>

<jsp:useBean id="os" class="servico.Servico" scope="page"></jsp:useBean>




<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
Statement st07 = con.createStatement();
Statement st08 = con.createStatement();
Statement st09 = con.createStatement();
Statement st10 = con.createStatement();
Statement st11 = con.createStatement();
%>


<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma busca
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
ResultSet rs06 = null;
ResultSet rs07 = null;
ResultSet rs08 = null;
ResultSet rs09 = null;
ResultSet rs10 = null;
ResultSet rs11 = null;

%>


<%
//Recupera rotinaId do produto Selecionado
GregorianCalendar cal = new GregorianCalendar();//verfica qual o ultimo numero de OS inserido
rs11 = st11.executeQuery(os.ultimoServico_ano(cal.get(Calendar.YEAR)));
if(rs11.next()){
	
	servico.OS = Integer.toString(rs11.getInt("OS")+1);//atribui valor para a OS da classe servico, que fará a inserção do valor.
}

String nivel = (String) session.getAttribute("nivel");


//Recupera valores do formulário e atribui ao objeto servico
servico.cliente.clienteID 	= Integer.parseInt((String)request.getParameter("clienteID").trim());
servico.empresa.empresaID	= Integer.parseInt((String)session.getAttribute("empresaID"));
servico.descricao			= request.getParameter("descricao");
servico.dataInicio 			= data.converteParaData(data.dataAtual());
servico.valor				= Float.parseFloat(request.getParameter("valorTotal").replace(",","."));
servico.usuario.usuarioID	= Integer.parseInt((String)session.getAttribute("usuarioID"));
//servico.OS 					= request.getParameter("os");
servico.anoServico			= request.getParameter("anoServico");
servico.dataPrevista		= request.getParameter("previcao");

//Executa a Query q irá salvar o Serviço


//Para gerar um cupom pesquisa na base de dados qual foi o último serviço gerado
//rs01 = st01.executeQuery(servico.ultimoServico());

int servicoID = Integer.MIN_VALUE;

//if(rs01.next()){
//	servicoID = rs01.getInt("servicoID");

%>
<%//Copiado do Sis Add Produto

	
	//Recupera Arrays dos Materiais
	String [] Produtos = request.getParameterValues("produtoID[]");//Dimensões Informadas na OS
	String [] Altura    =    request.getParameterValues("altura[]");
	String [] Largura	= request.getParameterValues("largura[]");
	//String [] Quantidade= request.getParameterValues("Quantidade[]");
	//String [] AlturaR    	= request.getParameterValues("alturaR[]");//valores Reais de consumo(com sobra)
	//String [] LarguraR		= request.getParameterValues("larguraR[]");
	String [] QuantidadeR	= request.getParameterValues("qtdProduto[]");
	String [] valorProduto = request.getParameterValues("valorProdutoTotal[]");
	String [] caminho_ = request.getParameterValues("caminho[]");
	
	
	for(int j = 0; j < Produtos.length; j++){
		produtos.produtoID = Integer.parseInt(Produtos[j]);
		rs10 = st10.executeQuery(produtos.pesquisaProdutoID());
		int rotina;
		
		if(rs10.next())
		{
			rotina = rs10.getInt("rotinaID");
			if(rotina == 0 || rotina == 1){
				//Segue para inserção na tabela de serviços seguindo Rotina de Trabalho 1
				if(rotina == 1){			
					String  caminho = caminho_[j];
					st02.execute(servico.cadastraServicoCaminho2Orcamento(nivel, caminho, "1"));
				}
				else
				{
					String  caminho = caminho_[j];
					st02.execute(servico.cadastraServicoCaminhoOrcamento(nivel, caminho, "0"));
				}
				
			}
			if(rotina == 2){//Segue para inserção na tabela de serviços seguindo Rotina de Trabalho 3
				st02.execute(servico.cadastraServicoOrcamento(nivel));//Segue primeiro para produção
			}
		}

		rs01 = st01.executeQuery(servico.ultimoServico());

		//servicoID = 

		if(rs01.next()){
			servicoID = rs01.getInt("servicoID");


	
	//Recupera os valores trazidos do formulário e atribui ao objeto servicoitem
	servicoproduto.servico.servicoID 	= servicoID;
	servicoproduto.produtos.produtoID	= Integer.parseInt(Produtos[j]);
	String valor_ 				= valorProduto[j];
	String qtdProduto			= QuantidadeR[j];
	//servicoproduto.altura				= request.getParameter("alturaProduto");
	//servicoproduto.largura				= request.getParameter("larguraProduto");
	//Atribui o valor ao objeto servico
	servico.servicoID				= servicoproduto.servico.servicoID;
	
	
	//Insere o produto na base de dados
	st.execute(servicoproduto.salvaProduto(Altura[j],Largura[j], qtdProduto, valor_));
	
	//-------------------> Continuar Daqui!
	//Pesquisa o estoque TOTAL atual dos materias
	//produto.produtoID = servicoproduto.produtos.produtoID; Aqui devemos alterar para assumir os valores da tebala de materias, que é a antiga tabela de Produto
 	
	//Recuepra Dados dos Materiais
	String [] Materiais = request.getParameterValues("materiais"+j+"[]");
	String [] qtdMAterial = request.getParameterValues("QuantidadeR"+j+"[]");
	String [] valorMateriais = request.getParameterValues("valorMaterial"+j+"[]");
	
	
	for(int i = 0; i< Materiais.length; i++){
		
		
		//Inserir dados de materiais usados na tabela 
		produto.produtoID = Integer.parseInt(Materiais[i]);
		rs04 = st04.executeQuery(produto.listaProdutosIDNova());//Aqui termina a parte de inserção de dados do produto, seguimos para iteração por material
	
		float estoqueTotalAtual = 0;
	
	if(rs04.next()){
		estoqueTotalAtual = rs04.getFloat("estoque");
		insertMateriais.valorCusto	 	= rs04.getFloat("precoCusto");
	}
	
	//Insere na tabela de Materiais
	insertMateriais.servico.servicoID 	= servicoID;
	insertMateriais.produto.produtoID 	= Integer.parseInt(Materiais[i]);
	insertMateriais.produtos.produtoID  = servicoproduto.produtos.produtoID;
	//insertMateriais.altura			  	= Altura[i];
	//insertMateriais.largura			  	= Largura[i];
	insertMateriais.valor			  	= Float.valueOf(valorMateriais[i].replace(",", "."));
	//insertMateriais.Quantidade		  	= Quantidade[i];
	//insertMateriais.alturaR 	      	= AlturaR[i];
	//insertMateriais.larguraR 			= LarguraR[i];
	insertMateriais.QuantidadeR 		= qtdMAterial[i];
	
	//Insere de fato na tabela servicoMateriais
	st07.execute(insertMateriais.insereMaterial());
		//Atualiza o estoque total
		produto.estoque = (estoqueTotalAtual - Float.parseFloat(QuantidadeR[i]));
		st.execute(produto.alteraEstoqueProduto());
		
	
	//pesquisa o estoque POR LOJA desse produto
	produtoestoque.produto.produtoID = produto.produtoID;
	produtoestoque.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	rs05 = st05.executeQuery(produtoestoque.pesquisaEstoque());
	
	float estoqueAtual = 0;
	
		if(rs05.next()){
			estoqueAtual = rs05.getFloat("quantidade");
		}
	
		//Atualiza o estoque por loja
		produtoestoque.quantidade = (estoqueAtual - Float.parseFloat(QuantidadeR[i]));
		st.execute(produtoestoque.alteraEstoque());
	}
	
	//Pesquisa o valor total atual desse serviço
		rs01 = st01.executeQuery(servico.pesquisaServico());
		
		float valorAtual = 0;

		if(rs01.next()){
			valorAtual = rs01.getFloat("valor");
		}
		
		//Soma ao novo valor vindo do formulário
		servico.valor = (valorAtual + servicoproduto.valor);
		//Altera o valor total do servico
		st.execute(servico.atualizaValorServico());
		//Muda o Status de visualizado para (Não-Visualizado)
		//st.execute(servico.naoVisualizado());
		//Após alterado fecha a página e atualiza a página de pai

	}
}
%>


<%
//Direciona para a impressão de um cupom para o cliente
response.sendRedirect("sis_print_cupom_servico_cliente.jsp?servicoID="+servicoID+"&OS="+servico.OS+"&Ano="+servico.anoServico);
//response.sendRedirect("sis_update_os.jsp?servicoID="+servicoID);
%>

<%
//fecha Statment
st.close();
%>