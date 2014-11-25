<%@ page errorPage="index.jsp?erro=3" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="produtos" class="cadastro.Produtos" scope="page"></jsp:useBean>

<%
//Instancia objeto do tipo Statment
Statement st01 = con.createStatement();
%>

<%
//Instancia objetos do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>

<%

%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = produtos.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	verPonto();
	
	//if(document.form1.tipoprodutoID.value == ""){
    //	alert("Selecione um Tipo de Produto!");
	//	document.form1.tipoprodutoID.focus();
	//	return false;
	//}
	
	//if(document.form1.fornecedorID.value == ""){
	//	alert("Selecione um Fornecedor!");
	//	document.form1.fornecedorID.focus();
	//	return false;
	//}
	
	if(document.form1.nome.value == ""){
		alert("Informe um Nome para o Produto!");
		document.form1.nome.focus();
		return false;
	}
	
	
	if(document.form1.codigo.value == ""){
		alert("Cadastre um Código para identificaçao do Produto!");
		document.form1.codigo.focus();
		return false;
	}
	
	//if(document.form1.unidade.value == ""){
	//	alert("Informe a unidade de Medida!");
	//	document.form1.unidade.focus();
	//	return false;
	//}
	
	//if(document.form1.precoCusto.value == "0.00"){
	//	alert("Informe o preço de Compra!");
	//	document.form1.precoCusto.focus();
	//	return false;
	//}
	
	//if(document.form1.precoVenda.value == "0.00"){
	//	alert("Informe o preço a ser Vendido!");
	//	document.form1.precoVenda.focus();
	//	return false;
	//}
	
	//if(document.form1.estoqueMinimo.value == ""){
	//	alert("Qual será o valor Mínimo em Estoque?");
	//	document.form1.estoqueMinimo.focus();
	//	return false;
	//}
	
	
}

function numero(){
if (event.keyCode<48 || event.keyCode>57){return false;}
}

//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numeroVirgula(){
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}


function verMargem(){
var c = document.form1.precoCusto.value;
var i = document.form1.precoVenda.value;

c = c.replace(",",".");
i = i.replace(",",".");

var v = parseFloat(i*100)/parseFloat(c) - 100;
v = parseFloat(v);
document.form1.lucro.value = v.toFixed(2);
}


function verPorcentagem(){
	var a = document.form1.precoCusto.value;
	var x = document.form1.lucro.value;
	
	a = a.replace(",",".");
	x = x.replace(",",".");
	
	var b = parseFloat(a/100)*parseFloat(x);
	
	var y = parseFloat(a)+parseFloat(b);
	
	document.form1.precoVenda.value = y.toFixed(2);
}

function verPonto()
{
var precoCusto = document.form1.precoCusto.value;
var precoVenda = document.form1.precoVenda.value;

precoCusto = precoCusto.replace(",",".");
precoVenda = precoVenda.replace(",","."); 

document.form1.precoCusto.value = precoCusto;
document.form1.precoVenda.value = precoVenda;
}


function venda(){
	var p1 = document.form1.precoCusto.value;	
	
	p1 = p1.replace(",",".");
	
	//Converte para o Tipo Float para poder usar o metodo toFixed()
	p1 = parseFloat(p1);
	
	//Coloca duas casas decimais com o toFixed(2)
	var p2 = p1.toFixed(2);
	
	//Atribui o valor ao outro Campo
	document.form1.precoVenda.value = p2;
	
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

<body onload="javascript:document.form1.tipoprodutoID.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_produtos_mix_publicidade.jsp'" value="Lista de Produtos" />&nbsp;

 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <form name="form1" method="post" action="sis_insert_manager_produtos.jsp" onsubmit="return verForm(this)">
 <table width="850" align="center">
 <%if(request.getParameter("msg") != null){ %>
  <tr>
   <td colspan="6" align="center" bgcolor="#ff0000"><font color="#ffffff"><strong><%=msg %></strong></font></td>
  </tr>
 <%} %>
  <tr>
   <td colspan="6" align="center"><strong>CADASTRO DE PRODUTO</strong></td>
  </tr>
  <tr>
    <td colspan="6" align="left">&nbsp;</td>
    </tr>
  <tr>
    <td width="107" align="left"></td>
    <td width="321" align="left">
    </td>
    <td width="92" align="left"></td>
    <td colspan="3" align="left">
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">Nome do Produto</td>
    <td align="left"><input type="text" name="nome" maxlength="100" size="50" /></td>
    <td align="left">C&oacute;digo</td>
    <td width="151" align="left"><input type="text" name="codigo" maxlength="15" size="20"></td>
    <td width="73" align="left">Rotina</td>
    <td width="78" align="left">
    	<select name="rotina">
    		<option value="" selected="selected">Selecione...</option>
    		<option value="0">Rotina de Trabalho 1</option>
    		<option value="1">Rotina de Trabalho 2</option>
    		<option value="2">Rotina de Trabalho 3</option>
    	</select>
    </td>
  </tr>
  <tr>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="center"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
    <td colspan="3" align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td colspan="3" align="left"></td>
    
  </tr>
  <tr>
   <td colspan="6" align="center">
   <input name="CADASTRAR" type="submit" class="botao" value="Cadastrar" />&nbsp;
   <input type="reset" value="Apagar" />
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

<%
//Fecha Consultas
//st.close();
//st01.close();
//rs.close();
//rs01.close();
%>