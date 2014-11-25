<%@page import="formatar.Datas"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="servico.ServicoProduto"%>
<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoitem" class="servico.ServicoItem" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>



<%
	ResultSet rs = null;
	ResultSet rs01 = null;
	Statement st01 = con.createStatement();
	
	servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));//Atribui ID do serviço a classe
	
	rs = st.executeQuery(servico.pesquisaServico());
	String servicoID = request.getParameter("servicoID");
	String OS = request.getParameter("OS");
	String ano = request.getParameter("ano");
	
	servicoproduto.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
	rs01 = st01.executeQuery(servicoproduto.listaProdutos());
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reagendamento</title>
</head>
<body>
<div align="center">
<h3>OS :<%=OS+"/"+ano %></h3>
<%if(rs.next()) %>
<h6>
<%=rs.getString("clienteNomeFantasia") %>
<p/>
<%if(rs01.next())%>
	Produto: <%=rs01.getString("nome") %> Dimen.: <%=rs01.getString("altura") %> X <%=rs01.getString("largura") %>
</h6>
<form id="form1" name="solicitar" action="sis_manager_reagenda.jsp" method="post">
 <textarea name="razao" rows="10" cols="50"  required title="Informe Motivo para Reagendar" placeholder="Informe Motivo para Reagendar!"></textarea>
 <p>
 <input type="submit" value="Solicitar"/>
 <input type="hidden" name="servicoID" value="<%=servicoID %>"/>
 <input type="hidden" name="reagenda" value="2"/>
 </p>
</form>
</div>
</body>
</html>