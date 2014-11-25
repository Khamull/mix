<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<%
//Verifica se foi passado parametro e atribui o valor ao ID do caixa
if(request.getParameter("livroID")!=null){
	caixa.livroID = Integer.parseInt(request.getParameter("livroID"));
}
%>

<%
//Pesquisa informações do Banco
rs = st.executeQuery(caixa.bancoPorID());
%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = caixa.mensagem(numeroMsg);
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
	
	if(document.form1.banco.value == ""){
		alert("Informe o nome do Banco para ser Cadastrado!");
		document.form1.banco.focus();
		return false;
	}
	
	if(document.form1.valorInicial.value == ""){
		document.form1.valorInicial.value = "0,00";
	}
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

<body onload="javascript: document.form1.banco.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_livro_caixa.jsp'" value="Lista de Bancos" />
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_livro_caixa.jsp'" value="+ Novo Banco" />
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

	<form name="form1" method="post" action="sis_update_manager_livro_caixa.jsp" onsubmit="return verForm(this)">
	<table width="540" align="center">
     <%if(request.getParameter("msg") != null){ %>
  	 <tr>
   	  <td colspan="4" align="center" bgcolor="#FF0000"><font color="#ffffff"><strong><%=msg %></strong></font></td>
     </tr>
 	 <%} %>
     <tr>
      <td colspan="4" align="center"><strong>CADASTRO DE BANCO</strong></td>
     </tr>
     <tr>
       <td height="15" align="left"><input type="hidden" name="livroID" value="<%=rs.getString("livroID")%>" /></td>
       <td align="left">&nbsp;</td>
       <td align="left">&nbsp;</td>
       <td align="left">&nbsp;</td>
     </tr>
     <tr>
      <td width="99" align="left">Nome do Banco</td>
      <td width="228" align="left"><input name="banco" type="text" size="40" maxlength="50" value="<%=rs.getString("banco") %>" /></td>
      <td width="69" align="left">Valor Inicial</td>
      <%
      //Trata o Valor
      String valorInicial = rs.getString("valorInicial");
      valorInicial = valorInicial.replace(".",",");
      %>
      <td width="124" align="left"><input name="valorInicial" type="text" onKeyPress="return numero(this)" value="<%=valorInicial %>" maxlength="10" readonly="readonly" /></td>
     </tr>
     <tr>
      <td align="left" colspan="4">Descri&ccedil;&atilde;o</td>
     </tr>
     <tr>
      <td align="left" colspan="4"><textarea name="descricao" style="width:530px; border:1px solid #000"><%=rs.getString("descricao") %></textarea></td>
     </tr>
     <tr>
      <td align="left" colspan="4"><input name="CADASTRAR" type="submit" class="botao" value="Salvar" /></td>
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