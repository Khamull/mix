<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<jsp:useBean id="datas" class="formatar.Datas" scope="page" ></jsp:useBean>

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
//Atribui o valor de usuário logado ao objeto caixa
caixa.usuario.login = (String)session.getAttribute("usuario");

//Pesquisa informações do Caixa Aberto
rs = st.executeQuery(caixa.verificaCaixa());
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
	if(confirm("Tem certeza que Deseja Fechar Esse Caixa?")){
		return true;
	}else{
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

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" onclick="javascript: window.location.href='sis_view_fechamentos.jsp'" class="botao" value="Fechamentos" />&nbsp;
 <input type="button" onclick="javascript: window.location.href='sis_permitir_retirada.jsp'" class="botao" value="Retirada" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <%if(rs.next()){ %>
 
 <form name="form1" method="post" action="sis_fechar_manager_caixa.jsp" onsubmit="return verForm(this)">
 <table width="300" align="center" cellpadding="4" cellspacing="4" style="border:1px solid #333">
  <tr bgcolor="#DCDCDC">
   <td colspan="4" align="center"><strong>FECHAR CAIXA</strong></td>
  </tr>
  <tr>
    <td width="84" align="right">Caixa Aberto:</td>
    <td width="75" align="left"><%= datas.converteDeData(String.valueOf(rs.getDate("dataInicio"))) %></td>
    <td width="25" align="center">as</td>
    <td width="62" align="left"><%=rs.getTime("dataInicio") %></td>
  </tr>
  <tr>
    <td colspan="4" align="center"><input name="CADASTRAR" type="submit" class="botao" value="Fechar Caixa" /></td>
  </tr>
  <%if(request.getParameter("msg") != null){%>
  <tr>
   <td align="center" colspan="4"><font color="#FF0000"><strong><%=msg%></strong></font></td>
  </tr>
  <%}%>
 </table>
 </form>
 
 <%} %>
 
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