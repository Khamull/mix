<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="item" class="pdv.VendaItem" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoItem" class="servico.ServicoItem" scope="page"></jsp:useBean>

<jsp:useBean id="servicoProduto" class="servico.ServicoProduto" scope="page" ></jsp:useBean>

<jsp:useBean id="formatar" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="forma" class="pdv.FormaPagamento" scope="page"></jsp:useBean>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statemenet para auxiliar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
Statement st07 = con.createStatement();
Statement st08 = con.createStatement();
Statement st09 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
ResultSet rs06 = null;
ResultSet rs07 = null;
ResultSet rs09 = null;

%>

<%
//Verifica se foi passado vendaID como parametro via URL
if(request.getParameter("servicoID")!=null){
	servicoItem.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
	servicoProduto.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
	servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
	servicoproduto.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
	//st08.execute(servico.atualizaServico_nivelUsuario());
}else{
	response.sendRedirect("sis_menu.jsp");
}
String altura = "";
String largura ="";
%>

<%
//Usado para formatar Valores
Currency currency = Currency.getInstance("BRL");     
DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<%
String OS = request.getParameter("OS");
String Ano  = request.getParameter("Ano");
//Pesquisa os produtos adicionados à O.S.
//rs = st.executeQuery(item.listaItensPorID());
rs = st.executeQuery(servicoProduto.listaProdutosOS(OS, Ano));
rs09 = st09.executeQuery(servicoProduto.listaProdutosOS(OS, Ano));
%>

<%
//Pesquisa os serviços adicionados à O.S.
rs06 = st06.executeQuery(servicoItem.listaItens());
%>

<%
//Pesquisa os dados da Empresa para colocar no Cupom
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
rs01 = st01.executeQuery(empresa.dadosGerais());
%>

<%
//Pesquisa dados do Serviço
//rs02 = st02.executeQuery(venda.dadosVenda());
rs02 = st02.executeQuery(servico.pesquisaServico());
%>

<%
//Pesquisa o nome do Operador que está Logado
if(rs02.next()){
	usuario.usuarioID = rs02.getInt("usuario");
	cliente.nomeFantasia = rs02.getString("clienteNomeFantasia");
	servico.descricao = rs02.getString("descricao");
	cliente.telefone = rs02.getString("clienteTelefone");
	cliente.celular = rs02.getString("clienteCelular"); 
	cliente.operadoraCelular = rs02.getString("operadoraCelular");
}
rs04 = st04.executeQuery(usuario.usuarioPorID());
%>

<%
//Pesquisa dados do Cliente
cliente.clienteID = Integer.parseInt(rs02.getString("clienteID"));

//Variaveis que irá receber os dados do Cliente
String nome = "";
String cpf = "";

rs05 = st05.executeQuery(cliente.clienteID());

//Atribui os valores às variaveis

if(rs05.next()){
	nome = rs05.getString("clienteNomeFantasia");
	cpf = rs05.getString("clienteCnpj");
}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Imprimir Cupom</title>

<script type="text/javascript">

function imprimirCupom(){
	window.print();
	fechar();
}

function fechar(){
	window.location.href="sis_view_servicos.jsp";	
}

</script>

</head>
<body bgcolor="#EEEEEE" onLoad="javascript: imprimirCupom()">

<div id="cupom" style="background-color:#FFFFFF; width:500px; font-family:'Courier New', Courier, monospace; margin-left:5px; margin-right:auto">

<table width="485" align="center">

<tr>
 <td colspan="3" height="20"></td>
</tr>

<%
String dataSemFormatacao = String.valueOf(rs02.getDate("dataFim"));
String data = formatar.converteDeData(dataSemFormatacao);

String dataPrevicao = String.valueOf(rs02.getDate("dataPrevista"));
String dtPrevi = formatar.converteDeData(dataPrevicao);
String dtfim = "";
%>
<%if(rs02.getInt("tipo") != 0) {

%>
<tr>
	<td>
		<h1>ORÇAMENTO</h1>
	</td>
</tr>	
<%} %>
<tr>
 <td width="152" align="left">N&deg; O.S. <%=rs02.getString("OS") %>/<%=rs02.getString("anoServico").substring(0,4) %></td>
 <td width="158" align="center"><%=data%></td>
 <td width="159" align="left"><%=rs02.getTime("datafim") %></td>
 
</tr>
<tr>
<td align="left">Para:</td>
 <td align="left"><%=dtPrevi %></td>
</tr>
<tr>
 <td align="left" colspan="3" height="15"></td>
</tr>
<%if(rs01.next()){ %>
<tr>
 <td align="center" colspan="7"><strong><%=rs01.getString("nomeFantasia") %></strong></td>
</tr>
<tr>
 <td align="left" colspan="7">End: <%=rs01.getString("rua") %>, <%=rs01.getString("numero") %></td>
</tr>
<tr>
 <td align="left" colspan="7">Bairro: <%=rs01.getString("bairro") %></td>
</tr>
<tr>
 <td align="left" colspan="7">Cidade: <%=rs01.getString("cidade") %> - <%=rs01.getString("uf") %></td>
</tr>
<tr>
 <td align="left" colspan="7">Tel: <%=rs01.getString("telefone") %></td>
</tr>
<tr>
 <td align="left" colspan="7">CNPJ: <%=rs01.getString("cnpj") %></td>
</tr>
<tr>
 <td align="left" colspan="7">Insc. Estadual: <%=rs01.getString("inscEstadual") %></td>
</tr>
<tr>
 <td align="left" colspan="7">e-mail <%=rs01.getString("email") %></td>
</tr>

<tr>
 <td align="left" colspan="7" height="30"></td>
</tr>
<%if(rs04.next()){ %>
<tr>
  <td align="left" colspan="7">Operador: <%=rs04.getString("usuarioNome") %></td>
</tr>
<%} %>

<%} %>
<tr>
  <td align="left" colspan="7">Cliente: <%=cliente.nomeFantasia%></td>
</tr>
<tr>
  <td align="left" colspan="7">Tel: <%=cliente.telefone%>  Cel: <%=cliente.celular%> <%=cliente.operadoraCelular%></td>
</tr>
<tr>
  <td align="center" colspan="7">&nbsp;</td>
</tr>
<tr>
 <td align="center" colspan="7">Descricao do servico</td>
</tr>
<tr>
 <td align="center" valign="baseline" height="100" colspan="3">
 <%=servico.descricao%><br> </td>
</tr>
<td align="center" valign="baseline" height="100" colspan="3">
 <%if(rs09.next()){%>
   <strong>Valor Total: R$ <%=rs09.getString("val")%></strong>
 <%} %>
 </td>
</tr>
 <td align="left" colspan="7">Produtos</td>
</tr>
<%
String prd = "";
//Enquanto não for final de arquivo lista os produtos adicionados à O.S.
while(rs.next()){
%>

  <%
  
  	altura = rs.getString("altura");
  	largura = rs.getString("largura");
    String preco = null;
	String total = null;
          
            
 	preco = formato.format(rs.getDouble("valor"));
	//total = formato.format(rs.getDouble("val"));
	//total = "0";
   prd = rs.getString("nome");
  %>
 <tr>
  <td colspan="2" align="left"><strong><%=prd %></strong></td><td><%=preco%></td>
 </tr>
 <tr>
  <td colspan="2" align="left"><strong>Quantidade: <%=rs.getString("qtdPRoduto")%></strong></td>
 </tr>
 <tr>
  <td colspan="2" align="left"><strong>Altura: <%=rs.getString("altura")%></strong></td>
 </tr>
 <tr>
  <td colspan="2" align="left"><strong>Largura: <%=rs.getString("largura")%></strong></td>
 </tr>
 <hr></hr>
<%} %>	 
	


<tr>
 <td align="left" colspan="3"><hr></td>
</tr>
<tr>
 <td align="left" colspan="3" height="30"></td>
</tr>
<tr>
  <td height="100" colspan="3" align="left"><font size="2">Obs: Qualquer alteracao no servico acima descrito, entraremos em contato para autorizacao do cliente.
  <p>
  Obs: Nao nos responsabilizamos por possíveis erros em artes aprovadas.</font></td>
</tr>
<tr>
<td colspan="3" height="100"></td>
</tr>
<tr>
<td colspan="10"><hr></hr></td>
</tr>
<tr>
</tr>
<tr>
<td>N&deg; OS </td><td><%=rs02.getString("OS") %>/<%=rs02.getString("anoServico").substring(0,4)%></td>
</tr>
<tr>
       	<td colspan="4"><%=nome%></td>
        
</tr>
<tr>
	<td align="left">Para:</p>
	<%=dtPrevi  %></td>
	<td align="left">Tel:</p>
          <%=cliente.telefone %></td>
        

</tr>
<tr>
<td>Prd: <%=prd %></td>
	<td>Dimen.</p><%=altura%> X <%=largura %></td>
</tr>
</table>

</div>

</body>
</html>					