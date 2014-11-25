<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>


<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<jsp:useBean id="funcionario" class="cadastro.Funcionario" scope="page"></jsp:useBean>

<jsp:useBean id="datas" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>

<%
//Atribui o nome do usuario ao objeto caixa para realizar
//a consulta posteriormente
caixa.usuario.login = (String)session.getAttribute("usuario");

//Faz a consulta na Base de Dados
//Verificando se já existe um caixa aberto para esse usuário
rs = st.executeQuery(caixa.verificaCaixa());

//Caso exista será redirecionado para a página de fechamento de caxa
if(rs.next()){
	response.sendRedirect("sis_fechar_caixa.jsp");
}
%>

<%
//Recupera o usuário da sessão para fazer uma busca
usuario.usuarioID = Integer.parseInt((String)session.getAttribute("usuarioID"));

//Pesquisa as informações sobre o usuário logado no sistema 
rs01 = st01.executeQuery(usuario.usuarioPorID());
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
	
	if(document.form1.funcionarioNome.value == "0"){
		alert("Favor informar seu Nome!");
		document.form1.funcionarioNome.focus();
		return false;
	}
	
	if(document.form1.valor.value == ""){
		alert("Informe quanto Dinheiro tem em seu Caixa\nantes de abrir no Sistema!");
		document.form1.valor.focus();
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

<body onload="javascript: document.form1.valor.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" onclick="javascript: window.location.href='sis_view_fechamentos.jsp'" class="botao" value="Fechamentos" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <form name="form1" method="post" action="sis_abrir_manager_caixa.jsp" onsubmit="return verForm(this)" >
 <table width="299" align="center" cellpadding="4" cellspacing="4" style="border:1px solid #333">
 <%if(request.getParameter("msg") != null){%>
  <tr>
    <td colspan="2" align="center"><font color="#FF0000"><%=msg%></font></td>
  </tr>
 <%}%>
  <tr bgcolor="#DDDDDD">
   <td colspan="2" align="center"><strong>ABERTURA DE CAIXA</strong></td>
  </tr>
  <tr>
   <td width="87" align="left">Funcionário:</td>
   <td width="182" align="left">
   <%if(rs01.next()){ %>
    <input type="hidden" name="funcionarioNome" value="<%=rs01.getString("funcionarioID") %>">
    <%=rs01.getString("usuarioNome")%>
   <%} %>
   </td>
  </tr>
  <tr>
   <td align="left">Data:</td>
   <td align="left"><%=datas.dataAtual() %></td>
  </tr>
  <tr>
    <td align="left">Valor Inicial:</td>
    <td align="left"><input name="valor" type="text" onKeyPress="return numero(this)" value="0,00" maxlength="10" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input name="CADASTRAR" type="submit" class="botao" value="Abrir Caixa" /></td>
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