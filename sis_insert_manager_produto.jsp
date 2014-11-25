<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>

<%
//Recupera valores trazidos do Formulário de Cadastro de Produto
//Atrubui eles ao objeto produto

produto.tipo.tipoProdutoID 			= Integer.parseInt(request.getParameter("tipoprodutoID"));
produto.fornecedor.fornecedorID 	= Integer.parseInt(request.getParameter("fornecedorID"));
produto.nome 						= request.getParameter("nome");
produto.codigo 						= request.getParameter("codigo");
produto.unidade 					= request.getParameter("unidade");
produto.precoCusto 					= Float.parseFloat(request.getParameter("precoCusto"));
produto.preco 						= Float.parseFloat(request.getParameter("precoVenda"));
produto.lucro 						= request.getParameter("lucro");
produto.estoqueMinimo 				= Integer.parseInt(request.getParameter("estoqueMinimo"));

%>

<%
//Verifica se já existe um produto com esse Nome
rs = st.executeQuery(produto.produtoNome());

if(rs.next()){
	//Caso exista um Produto com esse Nome, retorna para a Página de Cadastro
	response.sendRedirect("sis_insert_produto.jsp?msg=4");
}else{
	//Senão: Verifica se existe um produto com esse Codigo
	rs01 = st01.executeQuery(produto.produtoCodigo());
	if(rs01.next()){
		//Caso exista um Produto com esse Codigo, retorna para a Página de Cadasto
		response.sendRedirect("sis_insert_produto.jsp?msg=7");
	}else{
		//Senão: Executa a Função que irá salvar os dados na Base de Dados
		st02.execute(produto.salvaProduto());
		response.sendRedirect("sis_view_produtos_separados.jsp?msg=1");
	}
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>