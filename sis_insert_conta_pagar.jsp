<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="pagar" class="financeiro.Pagar" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="formas" class="pdv.FormaPagamento" scope="page"></jsp:useBean>

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
//Pesquisa as formas de Pagamento
rs = st.executeQuery(formas.listaFormasPagamento());
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
	
	var contador = 0;
	
	if(document.form1.valor.value == ""){
		alert("Informe o Valor a ser Pago!");
		document.form1.valor.focus();
		contador = 1;
		return false;
	}
	
	if(document.form1.favorecido.value == ""){
		alert("Informe o Nome do Favorecido!");
		document.form1.favorecido.focus();
		contador = 1;
		return false;
	}
	
	if(document.form1.vencimento.value == ""){
		alert("Informe a data de Vencimento da primeira parcela!");
		document.form1.vencimento.focus();
		contador = 1;
		return false;
	}
	
	if(document.form1.intervalo.value == ""){
		alert("Informe o intervalo de dias entre as parcelas!");
		document.form1.intervalo.focus();
		contador = 1;
		return false;
	}
	
	if(contador == 0){
		alert("Conta a Pagar Cadastrada com Sucesso!");	
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

function apenasNumero()	{
if (event.keyCode<48 || event.keyCode>57){return false;} 
}

</script>

</head>


<body onload="javascript: document.form1.valor.focus()">

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
  
 <form name="form1" method="post" action="sis_insert_manager_conta_pagar.jsp" onsubmit="return verForm(this)">
 <table width="390" align="center" cellpadding="5" cellspacing="0">
 <%if(request.getParameter("msg") != null){ %>
  <tr>
   <td colspan="2" align="center"><font color="#ff0000"><strong><%=msg %></strong></font></td>
  </tr>
 <%} %>
  <tr>
    <td colspan="2" align="center"><strong>CADASTRAR NOVA CONTA A PAGAR</strong></td>
  </tr>
  <tr bgcolor="#CCCCCC">
    <td width="145" align="left">Valor a Pagar</td>
    <td width="214" align="left"><input name="valor" type="text" size="20" maxlength="10" onkeypress="return numero(this)" /></td>
  </tr>
  <tr bgcolor="#CCCCCC">
    <td align="left">Favorecido</td>
    <td align="left"><input name="favorecido" type="text" size="50" maxlength="100" /></td>
  </tr>
  <tr>
   <td align="left" bgcolor="#E4E4E4">Forma de Pgto</td>
   <td align="left" bgcolor="#E4E4E4">
   <select name="formID">
    <%while(rs.next()){ %>
     <%
	  //Verifica forma de Pagamento
	  int formaPag = rs.getInt("formID");
	 %>
     <%if(formaPag != 5 && formaPag != 7){%>
      <option value="<%=rs.getString("formID") %>"><%=rs.getString("descricao") %></option>
     <%} %>
    <%} %>
   </select>
   </td>
  </tr>
  <tr>
   <td align="left" bgcolor="#E4E4E4">Vezes</td>
   <td align="left" bgcolor="#E4E4E4">
   <select name="vezes" style="width:75px;">
     <option value="1" selected="selected">A Vista</option>
     <option value="2">2 x</option>
     <option value="3">3 x</option>
     <option value="4">4 x</option>
     <option value="5">5 x</option>
     <option value="6">6 x</option>
     <option value="7">7 x</option>
     <option value="8">8 x</option>
     <option value="9">9 x</option>
     <option value="10">10 x</option>
     <option value="11">11 x</option>
     <option value="12">12 x</option>
     <option value="13">13 x</option>
     <option value="14">14 x</option>
     <option value="15">15 x</option>
     <option value="16">16 x</option>
     <option value="17">17 x</option>
     <option value="18">18 x</option>
   </select>
   </td>
  </tr>
  <tr>
   <td align="left" bgcolor="#F5F5F5"><p>Vencimento<br />
1&ordf; Parcela</p></td>
   <td align="left" bgcolor="#F5F5F5"><input name="vencimento" type="text" size="20" maxlength="10" onblur="validaDat(this, this.value)" onkeypress="MascaraData(form1.vencimento)" /></td>
  </tr>
  <tr>
   <td align="left" bgcolor="#F5F5F5">Intevalo entre parcelas</td>
   <td align="left" bgcolor="#F5F5F5"><input name="intervalo" type="text" onkeypress="return apenasNumero(this)" value="30" size="10" maxlength="2" /> 
     &nbsp;dias</td>
  </tr>
  <tr>
   <td align="left" colspan="2"><input type="submit" class="botao" name="CADASTRAR" value="Gerar Conta" /></td>
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