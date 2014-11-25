<%@ page errorPage="index.jsp?msg=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="item" class="pdv.VendaItem" scope="page"></jsp:useBean>

<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<%
//Recupera valores do formulário para salvar como Item da Venda
item.venda.vendaID 		= Integer.parseInt(request.getParameter("vendaID"));
item.produto.produtoID 	= Integer.parseInt(request.getParameter("prodID"));
item.produto.nome 		= request.getParameter("descricao");
item.produto.preco 		= Float.parseFloat(request.getParameter("valorUnitario"));
item.quantidade 		= Float.parseFloat(request.getParameter("quantidade"));
item.total 				= Float.parseFloat(request.getParameter("totalItem"));
%>


<%
//Executa a Query q irá salvar o item no banco de dados
st.execute(item.salvaItem());
%>


<%
//Subtrai quantidade adicionada ao pedido do Estoque
estoque.produto.estoque = (Float.parseFloat(request.getParameter("qtddEstoque")) - item.quantidade);
estoque.produto.produtoID = Integer.parseInt(request.getParameter("prodID"));
st.execute(estoque.alteraEstoque());
%>

<%
//Subtrai quantidade adicionao ao pedido do produtoEstoque (do estoque individual do produto por Unidade)
produtoEstoque.produto.produtoID = estoque.produto.produtoID;
produtoEstoque.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
produtoEstoque.quantidade = (Float.parseFloat(request.getParameter("estoqueParcial")) - item.quantidade);
st.execute(produtoEstoque.alteraEstoque());
%>

<%
//Direciona para o PDV novamente
response.sendRedirect("sis_gerar_venda.jsp");
%>

<%
//fecha Statment
st.close();
%>