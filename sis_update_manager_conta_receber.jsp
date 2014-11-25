<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Recupera os valores do Formulário e adiciona ao Objeto receber
receber.receberID = Integer.parseInt(request.getParameter("receberID"));

	//Trata valor
	String valorReceber = request.getParameter("valor");
	receber.valor = Float.parseFloat(valorReceber.replace(",","."));

	//Trata a Data
	String dataVencimento = request.getParameter("vencimento");
	receber.vencimento = data.converteParaData(dataVencimento);
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Atualiza Receber</title>
</head>
<body>

<%
//Altera os valores na Base de Dados
st.execute(receber.alteraReceber());
%>

<%=receber.receberID%> <br>
<%=receber.valor %><br>
<%=receber.vencimento %>

<%
//Redireciona para a Página de Alteração e manda a Mensagem
response.sendRedirect("sis_update_conta_receber.jsp?receberID="+receber.receberID+"&msg=2");//caso ocorrer erro nessa página comente essa linha
%>

</body>
</html>