<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//VERIFICA SE HÁ UM ADMINISTRADOR LOGADO
if(session.getAttribute("adm") == "" || session.getAttribute("adm") == null){
	response.sendRedirect("sis_menu.jsp");
}
%>

<%
//Recupera o login do Usuário que está logado e atribui ao objeto caixa
caixa.usuario.login = (String)session.getAttribute("usuario");
%>

<%
//Pesquisa qual é o ID do caixa onde será realizado essa Retirada
String caixaID = "0";

rs = st.executeQuery(caixa.verificaCaixa());

if(rs.next()){
	caixaID = rs.getString("caixaID");
}
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	if(document.form1.valor.value == ""){
		alert("Informe o Valor que foi retirado do Caixa");
		document.form1.valor.focus();
		return false;
	}
	
	if(document.form1.observacao.value == ""){
		alert("Explique em poucas palavras o motivo da Retirada");
		document.form1.observacao.focus();
		return false;
	}
	
}
</script>

<script type="text/javascript" src="js/jquery.js"></script>


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

<body onload="document.form1.valor.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE"></td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <form name="form1" method="post" action="sis_insert_manager_retirada.jsp" onsubmit="return verForm(this)">
 <table width="311" cellpadding="4" cellspacing="4" style="border:1px solid #333">
  <tr bgcolor="#DDDDDD">
   <td colspan="2" align="center"><strong>Retirada do Caixa</strong></td>
  </tr>
  <tr>
   <td height="33" colspan="2" align="center">Declare abaixo o valor que foi retirado do seu caixa</td>
  </tr>
  <tr>
   <td width="37" align="left">Valor</td>
   <td width="301" align="left"><input name="valor" onKeyPress="return numero(this)" type="text" size="20" maxlength="10" /></td>
  </tr>
  <tr>
   <td colspan="2" align="left">Especifique o Motivo da retirada <input type="hidden" name="caixaID" value="<%=caixaID%>" /></td>
  </tr>
  <tr>
   <td colspan="2" align="left"><input name="observacao" type="text" style="width:350px; height:100px" maxlength="82" /></td>
  </tr>
  <tr>
   <td colspan="2" align="center"><input name="CADASTRAR" type="submit" class="botao" value="Cadastrar Retirada" /></td>
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