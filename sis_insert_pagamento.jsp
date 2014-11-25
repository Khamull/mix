<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="pagar" class="financeiro.Pagar" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na Query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>

<%
//Recupera o ID do pagar
pagar.pagarID = Integer.parseInt(request.getParameter("pagarID"));
%>


<%
//Pesquisa dados do Pagamento
rs = st.executeQuery(pagar.pagarPorID());
%>

<%
//Pesquisa os Bancos Cadastrados no Livro Caixa
rs01 = st01.executeQuery(caixa.listaBancos());
%>


<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = pagar.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	if(document.form1.livroID.value == "0"){
		alert("Informe o Banco que será Descontado esse Valor!");
		document.form1.livroID.focus();
		return false;
	}else{
		alert("Pagamento Realizado com Sucesso!");	
	}
	
}


function validaDat(campo,valor) {
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
	return true;
}

</script>

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" src="js/interface.js"></script>

<script type="text/javascript" src="js/MascaraValidacao.js"></script> 

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->   

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}

</script>

</head>


<body onload="javascript: document.form1.livroID.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_conta_pagar_separada.jsp'" value="Contas a Pagar" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
<table align="center" style="width:450px; height:200px; border:1px solid #333">
 <tr>
 <td>
  
 <form name="form1" method="post" action="sis_insert_manager_pagamento.jsp" onsubmit="return verForm(this)">
 <table width="400" align="center">
 <%if(request.getParameter("msg") != null){ %>
  <tr>
   <td colspan="4" align="center"><font color="#ff0000"><strong><%=msg %></strong></font></td>
  </tr>
 <%} %>
  <tr>
   <td colspan="4" align="center"><strong>PAGAR ESSA CONTA</strong></td>
  </tr>
  <tr>
    <td colspan="4" align="center"><hr /></td>
  </tr>
  <%if(rs.next()){ %>
  
  <%
  //Trata valor
  String valor = "0";
  valor = formato.format(rs.getDouble("valor"));
  
  //Trata data
  String dataRecebimento = "";
  dataRecebimento = data.converteDeData(rs.getString("vencimento"));
  %>
  
  <tr>
    <td width="76" align="left">Favorecido</td>
    <td colspan="3" align="left"><%=rs.getString("favorecido") %></td>
    </tr>
  <tr>
    <td align="left" valign="top">N&deg; da Conta</td>
    <td width="79" align="left"><font color="#000099"><%=rs.getString("contapagarID") %></font></td>
    <td width="67" align="left">Forma Pgto</td>
    <td width="158" align="left"><font color="#000099"><%=rs.getString("descricao") %></font></td>
  </tr>
  <tr>
    <td align="left" valign="top">Valor</td>
    <td align="left"><font color="#000099"><%=valor%></font></td>
    <td align="left">Vencimento</td>
    <td align="left"><font color="#000099"><%=dataRecebimento%></font></td>
  </tr>
  <tr>
   <td colspan="4" height="10">
   <input type="hidden" name="valor" value="<%=rs.getString("valor")%>" />
   <input type="hidden" name="pagarID" value="<%=request.getParameter("pagarID")%>" />
   <input type="hidden" name="contapagarID" value="<%=rs.getString("contapagarID") %>" />
   <input type="hidden" name="formID" value="<%=rs.getString("formID") %>" />
   </td>
  </tr>
  <%} %>
  <tr bgcolor="#CCCCCC">
    <td colspan="4" align="center" valign="top"><strong>INFORME DE QUAL BANCO SERÁ DESCONTADO ESSE VALOR</strong></td>
    </tr>
  <tr>
    <td align="left" valign="top">Banco</td>
    <td colspan="3" align="left">
    <select name="livroID" style="width:274px">
     <option value="0" selected="selected">Selecione um Banco . . .</option>
     <%while(rs01.next()){ %>
      <option value="<%=rs01.getString("livroID")%>"><%=rs01.getString("banco") %></option>
     <%} %>
    </select>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top"></td>
    <td colspan="3" align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td colspan="3" align="left">&nbsp;</td>
  </tr>
  <tr bgcolor="#6699CC">
    <td align="center">Desconto</td>
    <td align="left"><input type="text" name="desconto" maxlength="10" size="15" onKeyPress="return numero(this)" /></td>
    <td align="center">Acr&eacute;scimo</td>
    <td align="left"><input type="text" name="acrescimo" maxlength="10" size="15" onKeyPress="return numero(this)" /></td>
  </tr>
  <tr>
    <td align="left"></td>
    <td colspan="3" align="left">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="top">Observa&ccedil;&otilde;es</td>
    <td colspan="3" align="left" valign="top"><input type="text" name="observacao" maxlength="82" style="width:270px; height:60px" /> </td>
  </tr>
  <tr>
    <td align="left"></td>
    <td colspan="3" align="left">&nbsp;</td>
  </tr>
  <tr>
   <td colspan="4" align="left"><input name="CADASTRAR" type="submit" class="botao" value="Cadastrar Pagamento" /></td>
   </tr>
 </table>
 </form>
 
 
 </td>
</tr>
</table>
 
 </td>
</tr>
</table>
</div>


<div id="rodape"><jsp:include page="inc/rodape.jsp" /></div>

</div>

<script type="text/javascript">
	
	$(document).ready(
		function()
		{
			$('#dock').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 50,
					halign : 'center'
				}
			)
		}
	);

</script>

</body>

</html>