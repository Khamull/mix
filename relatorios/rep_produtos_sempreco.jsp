<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<%
//Variavel que recebe o nivel do Usuário
String nivelUsuario = String.valueOf(session.getAttribute("nivel"));;

//Se o nivel for restrito enviar para a página de erro
if(nivelUsuario.equals("3") || nivelUsuario.equals("4") || nivelUsuario.equals("5")){
	response.sendRedirect("forbiden.jsp");
}
%>

<%
//Instancia um Objeto do tipo Statement para ajudar na Query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um Objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Pesquisa informações relacionadas à Empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
rs01 = st01.executeQuery(empresa.dadosGerais());
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


<%

//Atribui os parametros ao Objeto produto
produto.fornecedor.fornecedorID = Integer.parseInt(request.getParameter("fornecedorID"));
produto.tipo.tipoProdutoID = Integer.parseInt(request.getParameter("tipoID"));

	//Converte para String
	String fornID = String.valueOf(produto.fornecedor.fornecedorID);
	String tipoID = String.valueOf(produto.tipo.tipoProdutoID);


//verifica se foi passado uma forma de pagamento e um cliente especifico
if(fornID.equals("0")){

	if(tipoID.equals("0")){
		rs02 = st02.executeQuery(produto.listaProdutosAtivos());
	}else{
		rs02 = st02.executeQuery(produto.produtoPorT());
		
	}
	
}else{
	
	if(tipoID.equals("0")){
		rs02 = st02.executeQuery(produto.produtoPorF());
	}else{
		rs02 = st02.executeQuery(produto.produtoPorFT());
	}
	
}

%>

<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
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
<body bgcolor="#CCCCCC">

<!-- PRIMEIRA PÁGINA -->
<table align="center" cellpadding="0" cellspacing="0" width="630" height="980" style="1px solid border:#000000; background-color:#FFFFFF">
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - PRODUTOS</strong></td>
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
      int ln = 1;
      while(rs02.next()){
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - PRODUTOS</strong></td>
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
       <tr bgcolor="#FFEEBB">
        <td height="15" align="left"><strong>Codigo</strong></td>
        <td align="left"><strong>Fornecedor</strong></td>
        <td align="left"><strong>Tipo / Produto</strong></td>
        <td align="left"><strong>Descricao</strong></td>
       </tr>
     <%ln++; %>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - PRODUTOS</strong></td>
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
       <tr bgcolor="#FFEEBB">
        <td height="15" align="left"><%=rs02.getString("codigo") %></td>
        <td align="left"><%=rs02.getString("fornNomeFantasia") %></td>
        <td align="left"><%=rs02.getString("tipo") %></td>
        <td align="left"><%=rs02.getString("nome") %></td>
       </tr> 
    <%ln++; %>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - PRODUTOS</strong></td>
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
         <td height="15" align="left"><strong>Unid. Medida</strong></td>
         <td align="left"><strong>Estoque Minimo</strong></td>
         <td align="left"><strong>Qtd. em Estoque</strong></td>
         <td align="left"><strong></strong></td>
        </tr>
     <%ln++; %>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - PRODUTOS</strong></td>
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
         <td height="15" align="left"><%=rs02.getString("unidade") %></td>
         <td align="left"><%=rs02.getString("estoqueMinimo") %></td>
         <td align="left"><%=rs02.getString("estoque") %> <%=rs02.getString("unidade") %></td>
         <td align="left"></td>
        </tr>
      <%ln++; %>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - PRODUTOS</strong></td>
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
         <td height="15" align="left"><strong>Preco Venda</strong></td>
         <td align="left"><strong>Margem Lucro</strong></td>
         <td align="left">&nbsp;</td>
         <td align="left">&nbsp;</td>
        </tr>
     <%ln++; %>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - PRODUTOS</strong></td>
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
         <td height="15" align="left"><%=formato.format(rs02.getDouble("preco")) %></td>
         <td align="left"><strong><%=rs02.getString("lucro") %></strong>%</td>
         <td align="left">&nbsp;</td>
         <td align="left">&nbsp;</td>
        </tr>
      <%ln++; %>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - PRODUTOS</strong></td>
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
        <td height="15" colspan="4" align="center"> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </td>
       </tr>
      <%ln++; %>
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