<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="produto" class="cadastro.Produtos" scope="page"></jsp:useBean>

<%
//Recupera o ID do produto que irá ser excluido e adiciona ao Objeto
produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));

//chama o Metodo que irá excluir esse produto
st.execute(produto.excluiProduto());

//direciona para a página que lista os produtos
response.sendRedirect("sis_view_produtos_mix_publicidade.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>