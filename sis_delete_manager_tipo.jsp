<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="tipo" class="cadastro.TipoProduto" scope="page"></jsp:useBean>

<%
//Recupera o ID do Tipo que irá ser excluido e adiciona ao Objeto
tipo.tipoProdutoID = Integer.parseInt(request.getParameter("tipoprodutoID"));

//chama o Metodo que irá excluir esse tipo
st.execute(tipo.excluiTipo());

//direciona para a página que lista os tipo
response.sendRedirect("sis_view_tipos.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>