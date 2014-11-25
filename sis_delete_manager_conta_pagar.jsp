<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="pagar" class="financeiro.Pagar" scope="page"></jsp:useBean>

<%
//Recupera o ID da Conta à Pagar que irá ser excluido e adiciona ao Objeto
pagar.pagarID = Integer.parseInt(request.getParameter("pagarID"));

//chama o Metodo que irá excluir essa conta
st.execute(pagar.excluiPagar());

//direciona para a página que lista as Contas à Pagar
response.sendRedirect("sis_conta_pagar.jsp?msg=4");
%>

<%
 //fecha a consulta
 st.close();
%>