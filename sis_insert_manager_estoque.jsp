<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do Tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um Objeto do Tipo ResultSet para receber o resultado de uma consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Recupera valores trazidos do Formulário de Alimentação de Estoque
//Atribui eles ao objeto estoque
estoque.fornecedor.fornecedorID = Integer.parseInt(request.getParameter("fornID"));
estoque.produto.produtoID 		= Integer.parseInt(request.getParameter("prodID"));

//trata valores
String precoCusto 				= request.getParameter("precoCusto");
String preco					= request.getParameter("precoVenda");
estoque.produto.precoCusto 		= Float.parseFloat(precoCusto.replace(",","."));
estoque.produto.preco 			= Float.parseFloat(preco.replace(",","."));

estoque.produto.lucro 			= request.getParameter("lucro");
estoque.produto.unidade 		= request.getParameter("unidade");
estoque.produto.unidade 		= request.getParameter("unidade");
float qtdd						= Float.parseFloat(request.getParameter("quantidade"));
estoque.quantidade 				= qtdd;
estoque.usuario 				= request.getParameter("usuario");
estoque.empresa.empresaID	    = Integer.parseInt(request.getParameter("empresaID"));

//Atribui eles ao objeto produtoEstoque
produtoEstoque.produto.produtoID 	= estoque.produto.produtoID;
produtoEstoque.empresa.empresaID 	= estoque.empresa.empresaID;
produtoEstoque.quantidade			= qtdd;
%>

<%
//Salva os dados na tabela estoque
st.execute(estoque.salvaEstoque());

//Pesquisa se já há um estoque cadastrado para esse produto na tabela produtoestoque
rs01 = st01.executeQuery(produtoEstoque.pesquisaEstoque());
	//Se houver, soma com o estoque que está sendo adicionado
	if(rs01.next()){
		produtoEstoque.quantidade = (produtoEstoque.quantidade + rs01.getFloat("quantidade"));	
		st.execute(produtoEstoque.alteraEstoque());
	}else{
	//Senão: insere um estoque para esse produto com o ID da Empresa que o usuário logou
		st.execute(produtoEstoque.salvaQuantidade());
	}


//Pesquisa quantidade Geral em Estoque
rs = st.executeQuery(estoque.pesquisaEstoque());

//Soma Estoque
int q = 0;
if(rs.next()){
	q = rs.getInt("estoque");
}
estoque.quantidade = (q + qtdd);

//média de valores para material

//Atualiza os dados na tabela produto
st.execute(estoque.alteraEstoqueProduto());

//Redireciona para a listagem de Produtos;
response.sendRedirect("sis_view_produtos_separados.jsp?msg=6");
%>

<%
 //fecha a query
 st.close();
%>