<%@ page errorPage="index.jsp?msg=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="item" class="pdv.OrcamentoItem" scope="page"></jsp:useBean>

<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<%
//Recupera valores do formulário para salvar como Item da Venda
item.orcamento.orcamentoID 		= Integer.parseInt(request.getParameter("orcamentoID"));
item.produto.produtoID 			= Integer.parseInt(request.getParameter("prodID"));
item.produto.nome 				= request.getParameter("descricao");
item.produto.preco 				= Float.parseFloat(request.getParameter("valorUnitario"));
item.quantidade 				= Float.parseFloat(request.getParameter("quantidade"));
item.total 						= Float.parseFloat(request.getParameter("totalItem"));
%>


<%
//Executa a Query q irá salvar o item no banco de dados
st.execute(item.salvaItem());
%>



<%
//Direciona para a Tela de Orcamento novamente
response.sendRedirect("sis_gerar_orcamento.jsp");
%>

<%
//fecha Statment
st.close();
%>