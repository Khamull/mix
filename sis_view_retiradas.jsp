<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="retirada" class="caixaloja.Retiradas" scope="page"></jsp:useBean>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>


<%
//Recupera o Parametro via URL e Atribui ao objeto caixa
if(request.getParameter("caixaID")!=null && request.getParameter("caixaID")!=""){
	retirada.caixa.caixaID = Integer.parseInt(request.getParameter("caixaID"));
}else{
	response.sendRedirect("sis_menu.jsp");
}
%>

<%
//Consulta as Retiradas feitas nesse caixa
rs = st.executeQuery(retirada.buscaRetiradas());
%>


<%
//Utilizado para Formatar o valor para estilo moeda

Currency currency = Currency.getInstance("BRL");

DecimalFormat formatar = new DecimalFormat("R$ #,##0.00");
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
 <input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_abrir_caixa.jsp'" value="Caixa" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">

 <table width="900" align="center" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCCC">
   <td height="25" colspan="8" align="center" valign="middle" bgcolor="#003366"><strong><font color="#FFFFFF">LISTA DE RETIRADAS</font></strong></td>
  </tr>
  <tr>
   <td colspan="8" height="20"></td>
  </tr>
 
  <%while(rs.next()){ %>
  
  <%
  //Trata o valor para Estilo moeda
  String valorRetirado = formatar.format(rs.getDouble("valor"));
  %>
  
  <%
  //Pesquisa o nome do Operador logado no Sistema
  usuario.login = rs.getString("usuario");
  rs01 = st01.executeQuery(usuario.usuarioPorLogin());
  String operador = "";//String que irá receber o valor da consulta
  if(rs01.next()){
	  operador = rs01.getString("usuarioNome");
  }
  %>
  
  <tr align="left">
   <td width="66" bgcolor="#DFDFDF">Operador</td>
   <td width="215"><%=operador %></td>
   <td width="75" bgcolor="#DFDFDF">Respons&aacute;vel</td>
   <td width="215"><%=rs.getString("responsavel") %></td>
   <td width="44" bgcolor="#DFDFDF">Valor</td>
   <td width="95"><%=valorRetirado %></td>
   <td width="50" bgcolor="#DFDFDF">Horario</td>
   <td width="88"><%=rs.getTime("data") %></td>
  </tr>
  <tr bgcolor="#DFDFDF">
   <td colspan="8" align="left">Motivo</td>
  </tr>
  <tr>
   <td colspan="8" align="left"><%=rs.getString("observacao") %></td>
  </tr>
  <tr>
   <td colspan="8" align="left" height="30"><hr style="border:1px solid #333333" /></td>
  </tr>
  <%} %>
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