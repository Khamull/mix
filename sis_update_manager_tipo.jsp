<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="tipo" class="cadastro.TipoProduto" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formulário de Cadastro de Tipo
//Atrubui eles ao objeto tipo

tipo.tipoProdutoID 	= Integer.parseInt(request.getParameter("tipoprodutoID"));
tipo.tipo			= request.getParameter("tipo");

%>

<%
//Verifica se já existe um tipo com esse Nome
rs = st.executeQuery(tipo.tipoPorNomeEditar());

if(rs.next()){
	//Caso exista um Tipo com esse Nome, retorna para a Página de Cadastro
	response.sendRedirect("sis_update_tipo.jsp?msg=5&tipoprodutoID="+tipo.tipoProdutoID);
}else{
	//Senão: Executa a Função que irá Alterar os dados na Base de Dados
	st.execute(tipo.alteraTipo());
	response.sendRedirect("sis_view_tipos.jsp?msg=2");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>