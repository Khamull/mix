<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="compra" class="cadastro.Compras" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Pesquisa todos os itens da tabela compras
rs = st.executeQuery(compra.listaItens());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Imprimir Lista de Compras</title>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>
<body>

 <table align="center" bgcolor="#FFFFFF">
  <tr>
   <td align="left"><a href='javascript: window.print();'>[ imprimir ]</a></td>
   <td align="left"></td>
   <td align="right"><a href='javascript: window.close();'>[ x fechar ]</a></td>
  </tr>
  <tr bgcolor="#EEEEEE">
   <td width="327" align="left"><strong>Produto</strong></td>
   <td width="145" align="left"><strong>Quantidade</strong></td>
   <td width="92" align="left"><strong>Data</strong></td>
  </tr>
  <%while(rs.next()){ %>
  <tr>
   <td width="327" align="left"><%=rs.getString("nome") %></td>
   <td width="145" align="left"><%=rs.getString("quantidade") %></td>
   <td width="92" align="left"><%=data.converteDeData(String.valueOf(rs.getDate("data"))) %></td>
  </tr>
  <%} %>
 </table>

</body>
</html>