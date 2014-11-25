<%@ page errorPage="index.jsp?erro=3" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="tipo" class="cadastro.TipoProduto" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera o ID do cargo
tipo.tipoProdutoID = Integer.parseInt(request.getParameter("tipoprodutoID"));
%>

<%
//Pesquisa Dados do cargo
rs = st.executeQuery(tipo.tipoPorId());
%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = tipo.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	if(document.form1.tipo.value == ""){
		alert("Tipo de Produto é Obrigatório!");
		document.form1.tipo.focus();
		return false;
	}
	
}
</script>

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" src="js/interface.js"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->   

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>

<%if(rs.next()){ %>

<body onload="javascript:document.form1.tipo.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_tipos.jsp'" value="Lista Tipos de Produto" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_produtos.jsp'" value="Lista Produtos" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_produto.jsp'" value="+ Novo Produto" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_estoque.jsp'" value="Alimentar Estoque" /> </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
<table style="border:1px solid #333">
<tr>
<td> 
 
 <form name="form1" method="post" action="sis_update_manager_tipo.jsp" onsubmit="return verForm(this)">
 
 <table width="450" align="center">
 <%if(request.getParameter("msg") != null){ %>
  <tr>
   <td colspan="2" align="center" bgcolor="#ff0000"><font color="#ffffff"><strong><%=msg %></strong></font></td>
  </tr>
 <%} %>
  <tr>
   <td colspan="2" align="center"><strong>EDITAR TIPO DE PRODUTO</strong></td>
  </tr>
  <tr>
    <td colspan="2" align="left">&nbsp;</td>
    </tr>
  <tr>
    <td width="127" align="center">Tipo de Produto</td>
    <td width="311" align="left"><input type="text" name="tipo" maxlength="100" size="55" value="<%=rs.getString("tipo") %>" /></td>
  </tr>
  <tr>
    <td align="left"><input type="hidden" name="tipoprodutoID" value="<%=rs.getString("tipoprodutoID") %>" /></td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
   <td colspan="2" align="center">
   <input name="CADASTRAR" type="submit" class="botao" value="Salvar" /></td>
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