<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="fornecedor" class="cadastro.Fornecedor" scope="page"></jsp:useBean>

<%
//Recupera o ID do fornecedor que irá ser excluido e adiciona ao Objeto
fornecedor.fornecedorID = Integer.parseInt(request.getParameter("fornecedorID"));

//chama o Metodo que irá excluir esse fornecedor
st.execute(fornecedor.excluirFornecedor());

//direciona para a página que lista os fornecedores
response.sendRedirect("sis_view_fornecedores.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>