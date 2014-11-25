<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera o ID do receber
receber.receberID = Integer.parseInt(request.getParameter("receberID"));
%>

<%
//Pesquisa os dados do receber através do ID
rs = st.executeQuery(receber.receberPorID());
%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = receber.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	if(document.form1.valor.value == ""){
		alert("Informe um Valor!");
		document.form1.valor.focus();
		return false;
	}
	
	if(document.form1.vencimento.value == ""){
		alert("Informe a Data de Vencimento!");
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

<%if(rs.next()){ %>

<%
//Trata a Data
String dataVencimento = data.converteDeData(rs.getString("vencimento"));
//Trata Valor
String v = rs.getString("valor");
String valor = v.replace(".", ",");
%>

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_conta_receber.jsp'" value="Contas a Receber" />
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
  
 <form name="form1" method="post" action="sis_update_manager_conta_receber.jsp" onsubmit="return verForm(this)">
 <table width="400" align="center">
 <%if(request.getParameter("msg") != null){ %>
  <tr>
   <td colspan="2" align="center"><font color="#ff0000"><strong><%=msg %></strong></font></td>
  </tr>
 <%} %>
  <tr>
   <td colspan="2" align="center"><strong>EDITAR CONTA A RECEBER</strong></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><hr /></td>
    </tr>
  <tr>
    <td width="99" align="left">Cliente</td>
    <td width="289" align="left">
	<%
	//Verifica se ele vendeu para um Cliente Cadastrado ou nao e trata a informaçao
    if(rs.getString("clienteNomeFantasia")==null){
    %>
    <font color="#666666">N&Atilde;O CADASTRADO</font>
    <%}else{ %>
    <%=rs.getString("clienteNomeFantasia") %>
    <%} %>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">N&deg; Venda/O.S.</td>
    <td align="left"><%=rs.getString("vendaID")%></td>
  </tr>
  <tr>
    <td align="left" valign="top">Forma Pgto</td>
    <td align="left"><%=rs.getString("descricao")%></td>
  </tr>
  <tr>
    <td align="left" valign="top">Valor</td>
    <td align="left"><input name="valor" type="text" onKeyPress="return numero(this)" value="<%=valor%>" maxlength="10" /></td>
  </tr>
  <tr>
    <td align="left" valign="top">Vencimento</td>
    <td align="left"><input name="vencimento" type="text" onblur="validaDat(this, this.value)" onkeypress="MascaraData(form1.vencimento)" value="<%=dataVencimento%>" maxlength="10" /></td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <input type="hidden" name="receberID" value="<%=rs.getString("receberID")%>" />
    </td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left"></td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
   <td align="left"><input name="CADASTRAR" type="submit" class="botao" value="Salvar" /></td>
   <td align="left"></td>
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
<%} %>
</html>

<%
//fecha conexao
rs.close();
st.close();
%>