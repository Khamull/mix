<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="item" class="pdv.OrcamentoItem" scope="page"></jsp:useBean>
 
<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do tipo Statment
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um Objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>
 
<%
//Verifica se foi passado parametro via URL
if(request.getParameter("itemID")!= null){
	//Atribui o valor do Parametro ao ID do objeto Item
	item.itemID = Integer.parseInt(request.getParameter("itemID"));
	
	//Exclui o Item da Venda cujo o ID seja igual ao do que foi passado
	st.execute(item.excluiItem());
	//Redireciona para outra página
	response.sendRedirect("sis_gerar_orcamento.jsp");
}

%>
