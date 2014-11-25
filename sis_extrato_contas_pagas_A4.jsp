<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="lancamentos" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na Query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Variaveis para receber os valores
String clienteID = request.getParameter("clienteID");
String dataBusc = "";


//Trata Data
if(request.getParameter("BUSCAR")!=null){
	dataBusc = request.getParameter("data");
}else{
	dataBusc = data.dataAtual();
}


//Transforma a Data para tipo DATE no BANCO DE DADOS
String dataBusca = data.converteParaData(dataBusc);


//Faz a Busca dos Lançamentos Realizados nessa Data
rs = st.executeQuery(lancamentos.dividasQuitadasTotal(dataBusca, clienteID));
rs01 = st01.executeQuery(lancamentos.dividasQuitadas(dataBusca, clienteID));

%>

<%
//Pesquisa os dados da Empresa para colocar no Cupom
rs02 = st02.executeQuery(empresa.dadosEmpresa());
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
<title>Contas Pagas</title>

<script type="text/javascript">

function verForm(){
	
	if(document.form1.data.value == ""){
		alert("Para realizar a Busca é necessário\nPreencher uma Data!");
		document.form1.data.focus();
		return false;
	}
	
}

function validaDat(campo,valor) {
	
if(valor!=""){	
	var date=valor;
	var ardt=new Array;
	var ExpReg=new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
	ardt=date.split("/");
	erro=false;
	if ( date.search(ExpReg)==-1){
		erro = true;
		}
	else if (((ardt[1]==4)||(ardt[1]==6)||(ardt[1]==9)||(ardt[1]==11))&&(ardt[0]>30))
		erro = true;
	else if ( ardt[1]==2) {
		if ((ardt[0]>28)&&((ardt[2]%4)!=0))
			erro = true;
		if ((ardt[0]>29)&&((ardt[2]%4)==0))
			erro = true;
	}
	if (erro) {
		alert("\"" + valor + "\" nao é uma data válida!!!");
		campo.focus();
		campo.value = "";
		return false;
	}
}
	return true;
}

</script>

<script type="text/javascript" src="js/MascaraValidacao.js"></script> 

<style type="text/css">

body{
	font-family:Verdana, Geneva, sans-serif;
	font-size:11px;	
	background-color:#EEEEEE;
}

</style>

</head>
<body onLoad="javascript: document.form1.data.focus()">

<table align="center" width="590" bgcolor="#FFFFFF">
 <tr>
  <td align="center">
  
  <form method="post" name="form1" action="sis_extrato_contas_pagas.jsp?clienteID=<%=request.getParameter("clienteID")%>" onSubmit="return verForm(this)">
  <table align="center" width="340">
   <tr bgcolor="#CCCCCC">
    <td align="center"><input type="text" name="data" id="data" size="10" maxlength="10" onblur="validaDat(this, this.value)" onkeypress="MascaraData(form1.data)"></td>
    <td align="center"><input type="submit" name="BUSCAR" value="Buscar"></td>
    <td align="center"><input type="button" name="Imprimir" onClick="javascript: window.print() " value="Imprimir"></td>
   </tr>
  </table>
  </form>
  
  </td>
 </tr>
 <tr bgcolor="#CCCCCC">
  <td align="center"><font size="5"><strong>COMPROVANTE DE PAGAMENTO</strong></font></td>
 </tr>
 <tr>
  <td height="30" align="center"><hr></td>
 </tr>
 <tr>
  <td align="center">
  <%if(rs02.next()){%>
  <table align="center" width="548" cellpadding="0" cellspacing="0">
   <tr>
  <td width="170" height="20" rowspan="7" align="left" valign="top"><img src="relatorios/images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></td>
  <td width="376" height="9" colspan="2" align="center"><strong><%=rs02.getString("nomeFantasia") %></strong></td>
  </tr>
<tr>
  <td height="9" colspan="2"><%=rs02.getString("rua") %>, <%=rs02.getString("numero") %></td>
  </tr>
<tr>
  <td height="9" colspan="2"><%=rs02.getString("bairro") %></td>
  </tr>
<tr>
  <td height="20" colspan="2"><%=rs02.getString("cidade") %> - <%=rs02.getString("uf") %></td>
  </tr>
<tr>
  <td height="20" colspan="2"><%=rs02.getString("telefone") %></td>
  </tr>
<tr>
  <td height="20" colspan="2">CNPJ: <%=rs02.getString("cnpj") %></td>
  </tr>
<tr>
  <td height="20" colspan="2">Insc. Estadual: <%=rs02.getString("inscEstadual") %></td>
</tr>
   <tr>
    <td height="25" colspan="3"></td>
   </tr>
  </table>
  <%}%>
  </td>
 </tr>
 <tr>
   <td align="center"><hr></td>
 </tr>
 <tr>
  <td align="center">COMPROVAMOS QUE DIA: <%=dataBusc %></td>
 </tr>
 <%if(rs.next()){ %>
 <%
 //Trata valor
 String total = formato.format(rs.getDouble("total"));
 %>
 <%
 //Verifica se foi recebido Algum valor no dia passado por Parametro
 if(total.equals("R$ 0,00")){
 %>
 <tr>
  <td align="center">N&Atilde;O FOI RECEBIDO NENHUM VALOR</td>
 </tr>
 <%}else{ %>
 <tr>
  <td align="center">RECEBEMOS: <strong><%=total %></strong></td>
 </tr>
 <%} %>
 <tr>
  <td align="center">DE: <%=rs.getString("clienteNomeFantasia") %></td>
 </tr>
 <%} %>
 <tr>
  <td align="center" height="35"><hr></td>
 </tr>
 <tr>
  <td align="center">REFERENTE AS SEGUINTES D&Iacute;VIDAS</td>
 </tr>
 <tr>
  <td align="center" height="35"><hr></td>
 </tr>
 <tr>
  <td align="center">
  
  <table align="center" width="553">
   <tr bgcolor="#EEEEEE">
    <td width="172" align="left"><strong>N&deg; Venda</strong></td>
    <td width="193" align="center"><strong>Data Venda</strong></td>
    <td width="159" align="right"><strong>Valor</strong></td>
   </tr>
   
   <%while(rs01.next()){ %>
   <tr>
    <td align="left"><%=rs01.getString("vendaID") %></td>
    <td align="center"><%=data.converteDeData(String.valueOf(rs01.getDate("dataVenda"))) %></td>
    <td align="right"><%=formato.format(rs01.getDouble("valor")) %></td>
   </tr>
   <%} %>
   
  </table>
   
  </td>
 </tr>
</table>

</body>
</html>