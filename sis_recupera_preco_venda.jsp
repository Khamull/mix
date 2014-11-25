<%@ include file="inc/conexao.jsp" %>
<%@page import="cadastro.Usuario" %>
<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<jsp:useBean id="material" class="cadastro.Produto" scope="page"></jsp:useBean>
<%

Statement st01 = con.createStatement();
ResultSet rs01 = null;

if(request.getParameter("materialID") != null ||request.getParameter("materialID")!= "")
{
	material.produtoID = Integer.parseInt(request.getParameter("materialID"));
	rs01 = st01.executeQuery(material.listaPrecosporID());
	if(rs01.next())
	{
		String precoVenda = rs01.getString("preco");
		out.println(precoVenda);
	}
}


%>