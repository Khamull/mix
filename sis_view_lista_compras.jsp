<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="compra" class="cadastro.Compras" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Pesquisa todos os itens da tabela compras
rs = st.executeQuery(compra.listaItens());
%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = compra.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
}


function excluir(compraID){
	if(confirm("Tem certeza que deseja excluir esse item da compra?")){
		window.location.href="sis_delete_manager_item_compra.jsp?compraID="+compraID;
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
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_produtos_separados.jsp'" value="Lista de Produtos" />
 </td>
</tr>
<tr>
 <td height="25" align="center"><strong>LISTA DE COMPRAS</strong></td>
</tr>
<tr>
 <td valign="top" align="center">
 <br />
 <table align="center" width="650" cellpadding="2" cellspacing="2" border="0">
  <tr>
   <td align="left">
   	<a href="javascript: window.open('sis_add_compra.jsp', 'Adicionar', 'width=500px, height=250px')" ><img src="ico/ico_add.png" width="20" height="20" title="Adicionar Produto" border="0"  /></a> &nbsp;&nbsp;
    <a href="javascript: window.open('sis_print_compras.jsp', 'Adicionar', 'width=600px, height=600px')" ><img src="ico/ico_print.png" width="20" height="20" title="Imprimir Lista de Compras" border="0" /></a>
    </td>
   <td align="left"></td>
   <td align="left"></td>
   <td align="left"></td>
  </tr>
  <tr bgcolor="#EEEEEE">
   <td width="327" align="left"><strong>Produto</strong></td>
   <td width="145" align="left"><strong>Quantidade</strong></td>
   <td width="92" align="left"><strong>Data</strong></td>
   <td width="60" align="center"><strong>Ex</strong></td>
  </tr>
  <%while(rs.next()){ %>
  <tr>
   <td width="327" align="left"><%=rs.getString("nome") %></td>
   <td width="145" align="left"><%=rs.getString("quantidade") %></td>
   <td width="92" align="left"><%=data.converteDeData(String.valueOf(rs.getDate("data"))) %></td>
   <td align="center"><a href="javascript: excluir(<%=rs.getString("compraID")%>)"><img src="ico/ico_excluir.png" width="20" height="20" title="Excluir Item" border="0" /></a></td>
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