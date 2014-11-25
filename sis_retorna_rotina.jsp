<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="inc/conexao.jsp" %>
<%@page import="cadastro.Usuario" %>
<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<jsp:useBean id="material" class="cadastro.Produtos" scope="page"></jsp:useBean>
<%
Statement st01 = con.createStatement();
ResultSet rs01 = null;

if(request.getParameter("prodID") != null ||request.getParameter("prodID")!= "")
{
	material.produtoID = Integer.parseInt(request.getParameter("prodID"));
	rs01 = st01.executeQuery(material.pesquisaProdutoID());
	if(rs01.next())
	{
		String precoVenda = rs01.getString("rotinaID");
		out.println(precoVenda);
	}
}
%>
