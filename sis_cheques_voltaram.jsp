<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="cheque" class="financeiro.Cheques" scope="page"></jsp:useBean>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>

<%
//Pesquisa os Clientes Ativos
rs01 = st01.executeQuery(cliente.listaClientesaAtivos());
%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = cheque.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	if(document.form1.clienteID.value == "0"){
		alert("Informe o Cliente que pagou com esse Cheque!");
		document.form1.clienteID.focus();
		return false;
	}
	
	if(document.form1.valor.value == ""){
		alert("Informe o Valor do Cheque!");
		document.form1.valor.focus();
		return false;
	}
	
	if(document.form1.numeroCheque.value == ""){
		alert("Informe o Numero do Cheque!");	
		document.form1.numeroCheque.focus();
		return false;
	}
	
	if(document.form1.vencimento.value == ""){
		alert("Informe a Data da Vencimento!");
		document.form1.vencimento.focus();
		return false;
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

<script type="text/javascript" src="js/MascaraValidacao.js"></script> 


<script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.pstrength-min.1.2.js"></script>
        <script>
        	$(document).ready(function(){
				$('.password').pstrength();
			});
        </script>

<script type="text/javascript" src="js/interface.js"></script>

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

<body onload="javascript: document.form1.clienteID.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" onclick="javascript: history.go(-1)" class="botao" value="&lt;&lt; Voltar" />&nbsp;
 <input type="button" onclick="javascript: window.location.href='sis_view_cheques_voltaram.jsp'" class="botao" value="Lista de Cheques que Voltaram" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <form name="form1" method="post" action="sis_insert_manager_cheques_voltaram.jsp" onsubmit="return verForm(this)">
 <table width="366" align="center" cellpadding="4" cellspacing="4" style="border:1px solid #333333">
  <%if(request.getParameter("msg") != null){%>
  <tr>
   <td colspan="2" align="center"><font color="#FF0000"><%=msg%></font></td>
  </tr>
  <%}%>
  <tr bgcolor="#EEEEEE">
   <td colspan="2" align="center"><strong>CADASTRO DE CHEQUE DEVOLVIDO</strong></td>
  </tr>
  <tr>
   <td width="105" align="left">Cliente:</td>
   <td width="249" align="left">
   <select name="clienteID">
    <option value="0">Selecione . . .</option>
    <%while(rs01.next()){ %>
     <option value="<%=rs01.getString("clienteID") %>"><%=rs01.getString("clienteNomeFantasia") %></option>
    <%} %>
   </select>
   </td>
  </tr>
  <tr>
   <td align="left">Valor Cheque:</td>
   <td align="left"><input name="valor" type="text" onKeyPress="return numero(this)" maxlength="10" /></td>
  </tr>
  <tr>
   <td align="left">N&deg; Cheque:</td>
   <td align="left"><input type="text" maxlength="20" name="numeroCheque" onKeyPress="return numero(this)" /></td>
  </tr>
  <tr>
   <td align="left">Data Vencimento:</td>
   <td align="left"><input type="text" name="vencimento" onblur="validaDat(this, this.value)" onkeypress="MascaraData(form1.vencimento)" maxlength="10"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Observa&ccedil;&atilde;o</td>
    <td align="left" valign="top"><textarea name="observacao" style="width:190px; height:50px; border:1px solid #111111"></textarea></td>
  </tr>
  <tr>
   <td colspan="2" align="center"><input name="CADASTRAR" type="submit" class="botao" value="Cadastrar" /></td>
   </tr>
 </table>
 </form>
 
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