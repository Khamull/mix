<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="orcamento" class="pdv.Orcamento" scope="page"></jsp:useBean>
 
<jsp:useBean id="item" class="pdv.OrcamentoItem" scope="page"></jsp:useBean>

<%
//Verifica se foi passado parametro via URL
if(request.getParameter("orcamentoID")!= null){
	//Atribui o valor do Parametro ao ID do objeto Orcamento
	orcamento.orcamentoID = Integer.parseInt(request.getParameter("orcamentoID"));
	item.orcamento.orcamentoID = orcamento.orcamentoID;
	//Cancela o Orcamento cujo o ID seja igual ao do que foi passado
 	st.execute(orcamento.cancelaOrcamento());
	//Exclui todos os itens amarrados a esse orcamento para limpar a tabela itemorcamento
	st.execute(item.removeItens());
	//Redireciona para outra página
	response.sendRedirect("sis_gerar_orcamento.jsp");
}

%>
