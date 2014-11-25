<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<jsp:useBean id="datas" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Variavel que recebe o nivel do Usuário
String nivelUsuario = String.valueOf(session.getAttribute("nivel"));;

//Se o nivel for restrito enviar para a página de erro
if(nivelUsuario.equals("3") || nivelUsuario.equals("4") || nivelUsuario.equals("5") || nivelUsuario.equals("6")){
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
//Pesquisa os clientes Ativos Ordenando por Nome Fantasia
rs02 = st02.executeQuery(cliente.listaClientesOrdenados());
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" align="left"><strong>Data de Cadastro</strong></td>
        <td align="left"></td>
        <td align="left">
        <%if(rs02.getString("tipoPessoa").equals("0")){%>
         Pessoa Fisica
        <%}else{ %>
         Pessoa Juridica
        <%} %>
        </td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" align="left"><%=datas.converteDeData(String.valueOf(rs02.getDate("clienteData"))) %></td>
        <td align="left"></td>
        <td align="left"></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
       
       
       
       
       
       
     <!-- ******************************************************************************* -->  
      
     <tr>
        <td height="15" colspan="2" align="left"><strong>Nome Fantasia</strong></td>
        <td align="left" colspan="2"><strong>Razao Social</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="2" align="left"><%=rs02.getString("clienteNomeFantasia")%></td>
        <td align="left" colspan="2"><%=rs02.getString("clienteRazaoSocial")%></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="1" align="left"><strong>Insc. Estadual</strong></td>
        <td align="left" colspan="2">
        <%if(rs02.getString("tipoPessoa").equals("0")){ %>
         <strong>CPF</strong>
        <%}else{ %>
         <strong>CNPJ</strong>
        <%} %>
        </td>
        <td align="left" colspan="1"><strong>Insc. Municipal</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="1" align="left"><%=rs02.getString("clienteInscEstadual")%></td>
        <td align="left" colspan="2"><%=rs02.getString("clienteCnpj")%></td>
        <td align="left" colspan="1"><%=rs02.getString("clienteInscMunicipal")%></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="3" align="left"><strong>Endereco</strong></td>
        <td align="left"><strong>Numero</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="3" align="left"><%=rs02.getString("clienteEndereco")%></td>
        <td align="left"><%=rs02.getString("clienteNumero")%></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="3" align="left"><strong>Bairro</strong></td>
        <td align="left"><strong>CEP</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="3" align="left"><%=rs02.getString("clienteBairro")%></td>
        <td align="left"><%=rs02.getString("clienteCep")%></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="3" align="left"><strong>Cidade</strong></td>
        <td align="left"><strong>UF</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="3" align="left"><%=rs02.getString("clienteCidade")%></td>
        <td align="left"><%=rs02.getString("clienteUf")%></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="4" align="left"><strong>Complemento</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="4" align="left"><%=rs02.getString("clienteComplemento")%></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="2" align="left"><strong>Contato</strong></td>
        <td align="left"><strong>Telefone</strong></td>
        <td align="left"><strong>Fax</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="2" align="left"><%=rs02.getString("clienteContato")%></td>
        <td align="left"><%=rs02.getString("clienteTelefone")%></td>
        <td align="left"><%=rs02.getString("clienteFax")%></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" align="left"><strong>Celular</strong></td>
        <td align="left"><strong>Operadora</strong></td>
        <td align="left" colspan="2"><strong>E-mail</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" align="left"><%=rs02.getString("clienteCelular") %></td>
        <td align="left"><%=rs02.getString("operadoraCelular") %></td>
        <td align="left" colspan="2"><%=rs02.getString("clienteEmail") %></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="4" align="left"><strong>Site</strong></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Imprimir Relatorio"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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
        <td height="15" colspan="4" align="left"><%=rs02.getString("clienteSite") %></td>
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
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0"></a></td>
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
        <td height="15" colspan="3" align="center"><strong>RELATORIO - CLIENTES</strong></td>
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