<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="tipo" class="cadastro.TipoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="compra" class="cadastro.Compras" scope="page"></jsp:useBean>

<%
//Recupera o ID da Compra que irá ser excluida e adiciona ao Objeto
compra.compraID = Integer.parseInt(request.getParameter("compraID"));


//chama o Metodo que irá excluir esse item da Compra
st.execute(compra.excluiItem());

//direciona para a página que lista os itens da Compra
response.sendRedirect("sis_view_lista_compras.jsp?msg=2");
%>

<%
 //fecha a consulta
 st.close();
%>