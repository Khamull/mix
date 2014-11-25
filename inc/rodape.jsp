<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
%>

<%
//Atribui o objeto salvo na sessao ao objeto empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
//Pesquisa a Unidade que está logada de acordo com a variavel que foi salva na sessao
rs01 = st01.executeQuery(empresa.dadosGerais());
%>

<table width="1023" height="65" align="center">
 <tr>
  <td valign="middle" align="center">
  Forte System - Gest&atilde;o Comercial - Empresa: Mix Publicidade - Usu&aacute;rio: <%=session.getAttribute("usuario")%> 
  <%if(rs01.next()){%>
  ( Unidade: <%=rs01.getString("unidade")%> )
  <%}%>
  <br />
  Copyright&copy; 2014 - Forte em Midia Propaganda Todos os direitos reservados
  </td>
 </tr>
</table>
