<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera o ID trazido via URL e atribui ao objeto produto
if(request.getParameter("produtoID")!=null && request.getParameter("produtoID")!=""){
	produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));
}else{
	response.sendRedirect("sis_menu.jsp");
}
%>


<%
//Pesquisa dados referentes a esse produto
rs = st.executeQuery(produto.listaProdutosPorID());

//Variaveis
String unidadeMedida = "";
String nomeProduto = "";
String tipoProduto = "";
String quantidadeEstoque = "";

//Verifica se a pesquisa trouxe algum resultado e Atribui à variavel
if(rs.next()){
	tipoProduto = rs.getString("tipo");
	nomeProduto = rs.getString("nome");
	unidadeMedida = rs.getString("unidade");
	quantidadeEstoque = rs.getString("estoque");
}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	if(document.form1.quantidade.value == ""){
		alert("Informe a quantidade a ser retirada do Estoque.");
		document.form1.quantidade.focus();
		return false;
	}
	
	if(document.form1.motivo.value == ""){
		alert("Informe qual é o motivo da Retirada.");
		document.form1.motivo.focus();
		return false;
	}
	
}


function verificaEstoque(){
	
	var qtdEstoque = document.form1.quantidadeEstoque.value;
	var qtdRetirar = document.form1.quantidade.value;
	
	qtdEstoque = qtdEstoque.replace(",",".");
	qtdRetirar = qtdRetirar.replace(",",".");
	
	
	qtdEstoque = parseFloat(qtdEstoque);
	qtdRetirar = parseFloat(qtdRetirar);
	
	if(qtdRetirar > qtdEstoque){
		alert("Impossivel retirar essa quantidade,\nPois o estoque nao possui essa quantidade!");
		document.form1.quantidade.value = qtdEstoque;
		document.form1.quantidade.focus();
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

<body onload="javascript: document.form1.quantidade.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_retiradas_estoque.jsp?produtoID=<%=produto.produtoID%>'" value="Hitorico de Retiradas" title="Historico de Retiradas desse Produto" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 <form name="form1" method="post" action="sis_insert_manager_retirada_estoque.jsp" onsubmit="return verForm(this)">
 <table width="366" align="center" cellpadding="4" cellspacing="4" style="border:1px solid #666666">
  <tr bgcolor="#EEEEEE">
   <td colspan="2" align="center"><strong>Retirar Estoque de: <font color="#4444DD"><%=tipoProduto %> <%=nomeProduto %></font> </strong></td>
  </tr>
  <tr bgcolor="#669966">
    <td colspan="2" align="center" bgcolor="#99CC99">Atualmente esse produto tem <%=quantidadeEstoque.replace(".",",")%> <%=unidadeMedida%> em Estoque</td>
    </tr>
  <tr>
   <td width="168" align="left">Quantidade a ser retirada</td>
   <td width="170" align="left"><input type="text" name="quantidade" onKeyPress="return numero(this)" onblur="verificaEstoque()" size="20" maxlength="10" /> 
   <%=unidadeMedida %></td>
  </tr>
  <tr>
   <td align="left">Motivo da Retirada</td>
   <td align="left">
   <input type="hidden" name="produtoID" value="<%=produto.produtoID %>">
   <input type="hidden" name="quantidadeEstoque" value="<%=quantidadeEstoque %>">
   </td>
  </tr>
  <tr>
   <td align="left" colspan="2"><input type="text" name="motivo" maxlength="82" size="70" style="height:80px; text-align:left"/></td>
  </tr>
  <tr>
   <td align="center" colspan="2"><input name="CADASTRAR" type="submit" class="botao" value="Retirar" /></td>
  </tr>
 </table>
 </form>
 </td>
</tr>
<tr>
 <td align="center"></td>
</tr>
<tr>
 <td align="center"></td>
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