<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<%
//Trata erros
//Variaveis que serăo utilizadas no tratamento
String erro = "";
int numeroErro;

//verifica se foi mandada alguma mensagem de erro na URL
if(request.getParameter("erro") != null){
	numeroErro = Integer.parseInt(request.getParameter("erro"));
	//Depois de passado pelo metodo é atribuido a mensagem de erro ŕ variavel
	erro = usuario.erro(numeroErro);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){

	if(document.form1.administrador.value == ""){
		alert("Informe o Login!");
		document.form1.administrador.focus();
		return false;
	}
	
	if(document.form1.senha.value == ""){
		alert("Informe a Senha");
		document.form1.senha.focus();
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

</head>

<body onload="javascript: document.form1.administrador.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
  <td height="25" bgcolor="#EEEEEE">
    <input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" />
    </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
  <td align="center" valign="top" bgcolor="#FFFFFF">
    
    <form name="form1" action="sis_permitir_manager_retirada.jsp" onsubmit="return verForm(this)">
      <table align="center" style="width:350px; height:245px; border:1px solid #333">
      <tr>
      <td>
      
      <table width="317" align="center" cellpadding="5" cellspacing="0">
        <tr bgcolor="#DDDDDD">
          <td height="25" colspan="2" align="center"><strong>&Aacute;REA RESTRITA</strong></td>
          </tr>
        <tr bgcolor="#010000">
          <td colspan="2" align="center"><!--<img src="images/atencao.jpg" width="132" height="132" />--><img src="images/alerta.gif" width="96" height="67" /></td>
          </tr>
        <tr bgcolor="#FFFFFF">
          <td colspan="2" align="center">PARA REALIZAR UMA RETIRADA NO CAIXA &Eacute; NECESS&Aacute;RIO O LOGIN E SENHA DE ADMINISTRADOR.</td>
          </tr>
        <tr bgcolor="#EEEEEE">
          <td width="56" align="left">Login</td>
          <td width="239" align="left"><input name="administrador" type="text" size="30" maxlength="20" /></td>
          </tr>
        <tr bgcolor="#EEEEEE">
          <td align="left">Senha</td>
          <td align="left"><input name="senha" type="password" size="30" maxlength="20" /></td>
          </tr>
        <tr>
          <td colspan="2" align="center" bgcolor="#FFFFFF">
          <input name="CADASTRAR" type="submit" class="botao" value="Logar" />&nbsp;
          <input type="button" class="botao" onclick="javascript: history.go(-1)" value="Cancelar" />
          </td>
        </tr>
        <tr>
         <td colspan="2" align="center"><font color="#ff0000"><%=erro%></font></td>
        </tr>
        </table>
        
        
        </td>
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