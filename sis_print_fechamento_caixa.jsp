<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="lancamento" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<jsp:useBean id="retirada" class="caixaloja.Retiradas" scope="page"></jsp:useBean>

<jsp:useBean id="funcionario" class="cadastro.Funcionario" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.ServicoFechado" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
Statement st07 = con.createStatement();
Statement st08 = con.createStatement();
Statement st09 = con.createStatement();
Statement st010 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
ResultSet rs06 = null;
ResultSet rs07 = null;
ResultSet rs08 = null;
ResultSet rs09 = null;
ResultSet rs010 = null;
%>

<%
//Recupera o Id do Caixa ou manda para a página MENU 
if(request.getParameter("caixaID")!=null && request.getParameter("caixaID")!=""){
	caixa.caixaID = Integer.parseInt(request.getParameter("caixaID"));
}else{
	response.sendRedirect("sis_menu.jsp");
}
%>

<%
//Pesquisa informações sobre a Abertura e Fechamento desse Caixa
rs = st.executeQuery(caixa.caixaPorID());
%>

<%
//Variaveis que serão usadas após a pesquisa
String dataInicial = "";
String horaInicial = "";
String dataFinal = "";
String horaFinal = "";
%>

<%
//Atribui os valores da pesquisa ao objeto caixa
if(rs.next()){
	caixa.usuario.login = rs.getString("usuario");
	caixa.funcionario.funcionarioID = rs.getInt("funcionario");
	caixa.valorInicial = rs.getFloat("valorInicial");
	caixa.valorFinal = rs.getFloat("valorFinal");
	caixa.vendaInicial = rs.getInt("vendaInicial");
	caixa.vendaFinal = rs.getInt("vendaFinal");
	caixa.servicoInicial = rs.getInt("servicoInicial");
	caixa.servicoFinal = rs.getInt("servicoFinal");
	caixa.lancamentoInicial = rs.getInt("lancamentoInicial");
	caixa.lancamentoFinal = rs.getInt("lancamentoFinal");
	caixa.retiradaInicial = rs.getInt("retiradaInicial");
	caixa.retiradaFinal = rs.getInt("retiradaFinal");
	
	dataInicial = String.valueOf(rs.getDate("dataInicio"));
	horaInicial = String.valueOf(rs.getTime("dataInicio"));
	dataFinal = String.valueOf(rs.getDate("data"));
	horaFinal = String.valueOf(rs.getTime("data"));
}
%>

<%
//Pesquisa a soma de todas as vendas desse usuário enquanto esse caixa estava aberto
venda.usuario.login = caixa.usuario.login;
rs01 = st01.executeQuery(venda.somaVendas(caixa.vendaInicial, caixa.vendaFinal));

	//Atribui o valor da Pesquisa à Variável
	float totalVenda = 0;
	if(rs01.next()){
		totalVenda = rs01.getFloat("totalVendas");
	}

	
	
	
	
//Pesquisa a soma das vendas de acordo com Suas formas de Pagamento
rs02 = st02.executeQuery(venda.somaVendaFormaPgto(caixa.vendaInicial, caixa.vendaFinal));





//Pesquisa a soma de todos os lançamentos do tipo 'R' (Recebimento) , com forma de pagamento 7, 6, 5 e 4 e do tipo 'S' (Serviço)
//realizados por esse usuário do Sistema, dentro desse periodo entre o lançamento inicial e o final
lancamento.usuario.login = caixa.usuario.login;
rs03 = st03.executeQuery(lancamento.somaLancamentos(caixa.lancamentoInicial, caixa.lancamentoFinal));

	//Atribui o valor da Pesquisa à Variável	
	float totalLancamento = 0;
	if(rs03.next()){
		totalLancamento = rs03.getFloat("totalLancamentos");
	}

	
	
	
//Pesquisa a soma de todos os lançamentos do tipo 'R' (Recebimento) , com forma de pagamento 7,
//e que no momento de receber foram pagas com um cheque.
rs04 = st04.executeQuery(lancamento.somaLancamentosCheque(caixa.lancamentoInicial, caixa.lancamentoFinal));

	//Atribui o valor da Pesquisa à Variável
	float lancamentosCheque = 0;
	if(rs04.next()){
		lancamentosCheque = rs04.getFloat("totalLancamentos");
	}

	
	
//Subtrai o Total de Lançamentos pelo Total de Lançamentos com Cheque para obter o Total em Dinheiro
float lancamentoEmDinheiro = (totalLancamento-lancamentosCheque);




//Pesquisa a soma de todas as retiradas com caixaID igual ao do que está aberto
retirada.caixa.caixaID = caixa.caixaID;
rs05 = st05.executeQuery(retirada.somaRetiradas());

	//Atribui o valor da Pesquisa à Variável
	float totalRetirada = 0;
	if(rs05.next()){
		totalRetirada = rs05.getFloat("totalRetiradas");
	}

	
	

//Pesquisa a soma de todos os serviços que foram fechados hoje
servico.usuario.usuarioID = Integer.parseInt((String)session.getAttribute("usuarioID"));
rs07 = st07.executeQuery(servico.somaServicos(caixa.servicoInicial, caixa.servicoFinal));
	
	//out.println(caixa.servicoInicial);
	//out.println(caixa.servicoFinal);

	//Atribui o valor da Pesquisa à Variável
	float totalServico = 0;
	if(rs07.next()){
		//out.println("chegou até aqui");
		totalServico = rs07.getFloat("totalServicos");
		//out.println(totalServico);
	}

//Pesquisa a soma dos serviços de acordo com suas formas de pagamento
rs08 = st08.executeQuery(servico.somaServicoFormaPgto(caixa.servicoInicial, caixa.servicoFinal));
	

//Pesquisa a soma dos serviços pagos em Dinheiro
rs09 = st09.executeQuery(servico.somaServicosDinheiro(caixa.servicoInicial, caixa.servicoFinal));

	//Atribui o valor da Pesquisa à Variável
	float totalServicoDinheiro = 0;
	if(rs09.next()){
		//out.println("serviços em dinheiro:");
		totalServicoDinheiro = rs09.getFloat("totalServicos");
		//out.println(totalServicoDinheiro);
	}

%>

<%
//Soma o Total que entrou no Caixa (Dinheiro vendas + Cheque dos recebimentos + Dinheiro dos recebimentos)
//float totalGeral = (caixa.valorFinal+lancamentosCheque+totalVenda);
float totalGeral = (totalVenda+totalLancamento+caixa.valorInicial+totalServico-totalRetirada);
%>


<%
//Pesquisa os dados da Empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
rs06 = st06.executeQuery(empresa.dadosGerais());
%>


<%
//Pesquisa o Nome do Funcionário logado no Sistema
funcionario.funcionarioID = caixa.funcionario.funcionarioID;
rs010 = st010.executeQuery(funcionario.funcionarioPorId());

String funcionarioLogado = "";
if(rs010.next()){
	funcionarioLogado = rs010.getString("funcionarioNome");
}
%>


<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<%
//Formata todos os Valores para Tipo Moeda
String totalVendaB = formato.format(totalVenda);
String totalLancamentoB = formato.format(totalLancamento);
String lancamentosChequeB = formato.format(lancamentosCheque);
String lancamentoEmDinheiroB = formato.format(lancamentoEmDinheiro);
String totalRetiradaB = formato.format(totalRetirada);
String valorInicialB = formato.format(caixa.valorInicial);
String totalGeralB = formato.format(totalGeral);
String valorFinalB = formato.format(caixa.valorFinal+totalServicoDinheiro);
String totalServicoB = formato.format(totalServico);

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fechamento</title>

<style type="text/css">

body{
	font-family:"Courier New", Courier, monospace;
	font-size:15px;
	background-color:#DEDEDE;
}

</style>

</head>
<body>

<div id="cupom" style="background-color:#FFFFFF; width:500px; font-family:'Courier New', Courier, monospace; margin-left:auto; margin-right:auto">
<table width="479" align="center">
<tr>
 <td width="232" align="left"><a href="javascript: window.location.href='sis_abrir_caixa.jsp'"> [Fechar] </a></td>
 <td width="235" align="right"><a href="javascript: window.print() "> [Imprimir] </a></td>
</tr>
<tr>
 <td align="center" colspan="2"><hr></td>
</tr>
<tr>
 <td align="center" colspan="2"><strong>FECHAMENTO DE CAIXA</strong></td>
</tr>
<tr>
 <td align="center" colspan="2"><hr></td>
</tr>
<%if(rs06.next()){ %>
<tr>
 <td align="center" colspan="2"><%=rs06.getString("nomeFantasia")%></td>
</tr>
<tr>
 <td align="left" colspan="2">End: <%=rs06.getString("rua") %>, <%=rs06.getString("numero") %></td>
</tr>
<tr>
 <td align="left" colspan="2">Bairro: <%=rs06.getString("bairro") %></td>
</tr>
<tr>
 <td align="left" colspan="2">Cidade: <%=rs06.getString("cidade") %> - <%=rs06.getString("uf") %></td>
</tr>
<tr>
 <td align="left" colspan="2">Tel: <%=rs06.getString("telefone") %></td>
</tr>
<tr>
 <td align="left" colspan="2">CNPJ: <%=rs06.getString("cnpj") %></td>
</tr>
<tr>
 <td align="left" colspan="2">Insc. Estadual: <%=rs06.getString("inscEstadual") %></td>
</tr>
<%} %>
<tr>
 <td align="center" colspan="2"><hr></td>
</tr>
<tr bgcolor="#EEEEEE">
 <td align="left">TOTAL DE VENDAS</td>
 <td align="right"><%=totalVendaB %></td>
</tr>
<tr>
 <td colspan="2" align="center"><hr></td>
</tr>
<%
//Carrega o laço de repetição para Total de Vendas de acordo com Forma de Pagamento
while(rs02.next()){
	//Formata o valor
	String totalVendasB = formato.format(rs02.getDouble("totalVendas"));
%>
<tr>
 <td align="left"><%=rs02.getString("descricao") %></td>
 <td align="right"><%=totalVendasB %></td>
</tr>
<%}%>
<tr>
 <td colspan="2" height="40"></td>
</tr>
<tr>
 <td align="center" colspan="2"><hr></td>
</tr>
<tr bgcolor="#EEEEEE">
 <td align="left">TOTAL DE SERVICOS</td>
 <td align="right"><%=totalServicoB %></td>
</tr>
<tr>
 <td colspan="2" align="center"><hr></td>
</tr>
<%
//Carrega o laço de repetição para Total de Serviços de acordo com Forma de Pagamento
while(rs08.next()){
	//Formata o valor
	String totalServicosB = formato.format(rs08.getDouble("totalServicos"));
%>
<tr>
 <td align="left"><%=rs08.getString("descricao") %></td>
 <td align="right"><%=totalServicosB %></td>
</tr>
<%}%>
<tr>
 <td colspan="2" height="40"></td>
</tr>
<tr>
 <td align="center" colspan="2"><hr></td>
</tr>
<tr bgcolor="#EEEEEE">
 <td align="left">TOTAL RECEBIMENTOS</td>
 <td align="right"><%=totalLancamentoB %></td>
</tr>
<tr>
 <td colspan="2" align="center"><hr></td>
</tr>
<tr>
 <td align="left">Recebimentos (Cheque)</td>
 <td align="right"><%=lancamentosChequeB %></td>
</tr>
<tr>
 <td align="left">Recebimentos (Dinheiro)</td>
 <td align="right"><%=lancamentoEmDinheiroB %></td>
</tr>
<tr>
 <td colspan="2" height="40"></td>
</tr>
<tr>
 <td align="center" colspan="2"><hr></td>
</tr>
<tr bgcolor="#EEEEEE">
 <td align="left">TOTAL RETIRADAS</td>
 <td align="right"><%=totalRetiradaB %></td>
</tr>
<tr>
 <td align="center" colspan="2"><hr></td>
</tr>
<tr>
 <td colspan="2" height="40"></td>
</tr>
<tr>
 <td colspan="2" align="center"># # # # # # # # #  &nbsp;RESUMO&nbsp;   # # # # # # # # # #</td>
</tr>
<tr>
 <td align="left">Valor Inicial</td>
 <td align="right" bgcolor="#F7F8F9"><%=valorInicialB %></td>
</tr>
<tr>
 <td align="left">Valor Final Total</td>
 <td align="right" bgcolor="#F0F0F0"><%=totalGeralB %></td>
</tr>
<tr>
 <td align="left">Valor Final (Dinheiro)</td>
 <td align="right" bgcolor="#E3E3E3"><%=valorFinalB %></td>
</tr>
<tr>
 <td align="left">Caixa Aberto</td>
 <td align="right"><%=data.converteDeData(dataInicial) %> as <%=horaInicial %> </td>
</tr>
<tr>
 <td align="left">Caixa Fechado</td>
 <td align="right"><%=data.converteDeData(dataFinal) %> as <%=horaFinal %> </td>
</tr>
<tr>
 <td align="left">Operador</td>
 <td align="right"><%=funcionarioLogado %></td>
</tr>
<tr>
 <td colspan="2" align="center"><hr></td>
</tr>
<tr>
 <td colspan="2" height="40"></td>
</tr>
<tr>
 <td colspan="2" align="center">___________________________</td>
</tr>
<tr>
 <td colspan="2" align="center">Assinatura do Gerente</td>
</tr>
<tr>
 <td colspan="2" height="160"></td>
</tr>
<tr>
 <td colspan="2">--</td>
</tr>
</table>
</div>

</body>
</html>