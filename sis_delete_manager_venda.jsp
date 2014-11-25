<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>
 
<%
//Verifica se foi passado parametro via URL
if(request.getParameter("vendaID")!= null){
	//Atribui o valor do Parametro ao ID do objeto Venda
	venda.vendaID = Integer.parseInt(request.getParameter("vendaID"));
	//Cancela a Venda cujo o ID seja igual ao do que foi passado
 	st.execute(venda.cancelaVenda());
	//Redireciona para outra página
	response.sendRedirect("sis_menu.jsp");
}

%>
