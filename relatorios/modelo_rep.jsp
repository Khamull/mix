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
      <img src="images/cab_rep_fornecedores_relacao.png">
     </td>
    </tr>
    <tr>
     <td align="center" valign="top">
     
     <!-- ##########################   INICIO DO RELATORIO ######################## -->
      <table border="0" cellpadding="0" cellspacing="0" width="585" align="center">
      <%
      int i = 1;
      int ln = 1;
      while(i <= 540){
      %>
      <%
      //Verifica se ja preecheu as 54 linhas e da um espaçamento
      if(ln == 55){
      %>
      <tr>
       <td colspan="4" height="170"><img src="images/cab_rep_fornecedores_relacao.png"></td>
      </tr>
      <%
      //Se ja tiver preenchido reinicializa o valor do contador
      ln = 1;
      }
      %>
       <tr>
        <td align="left"><%=i %></td>
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