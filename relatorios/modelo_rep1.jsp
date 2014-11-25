<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do tipo Statement para ajudar na Query
Statement st01 = con.createStatement();
%>

<%
//Instancia um Objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
%>

<%
//Pesquisa informações relacionadas à Empresa
rs01 = st01.executeQuery(empresa.dadosEmpresa());
%>


<%
//Verifica se a consulta retornou algum valor e atribui às Variaveis
String nomeFantasia = "";
String endereco = "";
String bairro = "";
String cidade = "";
String telefone = "";

	if(rs01.next()){
		nomeFantasia = rs01.getString("nomeFantasia");
		endereco = rs01.getString("rua")+", "+rs01.getString("numero");
		bairro = rs01.getString("bairro");
		cidade = rs01.getString("cidade");
		telefone = rs01.getString("telefone");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> - </title>

<style type="text/css">
 body, html{
	 margin:0px;
	 border:0px;
	 font-family:Arial, Helvetica, sans-serif;
	 font-size:12px;
 }
 
 .borda{
	border:1px dashed #666; 
	text-align:left;
	height:18px;
	padding:2px;
 }
</style>

</head>
<body>

<!-- PRIMEIRA PÁGINA -->
<table align="center" cellpadding="0" cellspacing="0" width="630" height="980" style="1px solid border:#000000">
 <tr>
  <td align="center" valign="middle">
  
  <!-- Borda 1 -->
   <table width="590" height="950" cellpadding="0" cellspacing="0" style="border:1px solid none" align="center">
    <tr>
     <td align="center" valign="top" height="120">
      <!-- Esse é o espaço para que apareça o cabeçalho -->
      <table width="585" height="120" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - FORNECEDORES</strong></td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
     </td>
    </tr>
    <tr>
     <td align="center" valign="top">
     
     <!-- ##########################   INICIO DO RELATORIO ######################## -->
      <table border="0" cellpadding="0" cellspacing="0" width="585" align="center">
      <%
      int i = 1;
      int ln = 1;
      while(i <= 5400){
      %>
      <%
      //Verifica se ja preecheu as 54 linhas e da um espaçamento
      if(ln == 55){
      %>
      <tr>
       <td colspan="4" height="170" valign="bottom">
       
       <table width="585" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td colspan="4" height="32"></td>
       </tr>
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - FORNECEDORES</strong></td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
       
       </td>
      </tr>
      <%
      //Se ja tiver preenchido reinicializa o valor do contador
      ln = 1;
      }
      %>
       <tr>
        <td height="15" align="left"><%=i %></td>
        <td align="left">oi</td>
        <td align="left"></td>
        <td align="left"></td>
       </tr>
      <%ln++; %>
      <%i++; %>
      <%} %>
       </table>
     <!-- ##########################     FIM DO RELATORIO ######################### -->
     
     </td>
    </tr>
   </table>
  <!-- Fim da Borda -->
  
  </td>
 </tr>
</table>
<!-- Fim da Primeira Página -->



</body>
</html>