<%@ page errorPage="index.jsp?erro=3" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="fornecedor" class="cadastro.Fornecedor" scope="page"></jsp:useBean>

<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statment para ser usado em uma consulta SQL
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber o resultado da Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
%>


<%
//Pesquisa todos os Fornecedores
rs = st.executeQuery(fornecedor.listaFornecedoresAtivos());
%>

<%
//Verifica se foi passado via URL o ID do fornecedor e pesquisa todos os produtos relacionados a ele
if(request.getParameter("fornecedorID") != null){
	//rs01 = st01.executeQuery(produto.produtoPorFornecedor(request.getParameter("fornecedorID")));
	rs01 = st01.executeQuery(produto.listaProdutosAtivos_Selecao());
}
%>

<%
//Verifica se foi passado via URL o ID do produto e pesquisa as informações do mesmo
if(request.getParameter("produtoID") != null){
	//Atribui o ID ao Objeto da Classe Produto
	produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));
	rs02 = st02.executeQuery(produto.listaProdutosPorID_());
}
%>


<%
//Pesquisa todas as unidades cadastradas no sistema
rs03 = st03.executeQuery(empresa.listaEmpresas());
%>


<%
//Pesquisa o nome da unidade que está logada
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
rs04 = st04.executeQuery(empresa.dadosGerais());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	if(document.form1.quantidade.value == ""){
		alert("Informe a quantidade para ser adicionada ao Estoque!");
		document.form1.quantidade.focus();
		return false;
	}
	
	if(document.form1.prodID.value == ""){
		alert("Por favor, Selecione um produto!");
		document.form1.prodID.focus();
		return false;
	}
	
	if(document.form1.precoCusto.value == ""){
		alert("Preço de Custo é Obrigatório!");
		document.form1.precoCusto.focus();
		return false;
	}
	
	if(document.form1.precoVenda.value == ""){
		alert("Preço de Venda é Obrigatório!");
		document.form1.precoVenda.focus();
		return false;
	}
	
	if(document.form1.lucro.value == ""){
		alert("Campo Lucro é Obrigatório!");
		document.form1.lucro.focus();
		return false;
	}
	
}

function pesquisaProduto(){
	var fornecedorID = document.form1.fornecedorID.value;
	window.location.href="sis_insert_estoque.jsp?fornecedorID="+fornecedorID;	
}

function detalhesProduto(fornecedorID){
	var produtoID = document.form1.produtoID.value;
	window.location.href="sis_insert_estoque.jsp?fornecedorID="+fornecedorID+"&produtoID="+produtoID;
	
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


function verificaPreco(){
	
	var precoAnterior = document.form1.precoAnterior.value;
	var precoVenda = document.form1.precoVenda.value;
	
	precoAnterior = precoAnterior.replace(".", ",");
	precoVenda = precoVenda.replace(".", ",");
	
	if(precoVenda < precoAnterior){
		alert("ATENÇAO! Anteriormente esse produto\nera vendido por (R$ "+document.form1.precoAnterior.value+")");
		return null;
	}
	
	//precoAnterior = parseInt(precoAnterior);
//	precoVenda = parseInt(precoVenda);
//	
//	//var teste = document.form1.precoVenda.value.toFixed(4,2);
//	//alert(teste);
//	
//	if(precoVenda < precoAnterior){
//		alert("2 ATENÇAO! Anteriormente esse produto\nera vendido por (R$ "+document.form1.precoAnterior.value+")");
//		return null;
//	}
}

//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}

//Verifca se tem "," ao invés de "." e Substitui
function verPonto(){
	var qtdd = document.form1.quantidade.value;
		
	qtdd = qtdd.replace(",",".");
		
	document.form1.quantidade.value = qtdd;
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

<body onload="javascript:document.form1.fornecedorID.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <!-- <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_tipos.jsp'" value="Lista Tipos de Produto" />&nbsp;-->
 <!-- <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_tipo.jsp'" value="+ Novo Tipo de Produto" />&nbsp;-->
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_produtos.jsp'" value="Lista Materiais" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_produto.jsp'" value="+ Novo Material" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
<table style="border:1px solid #333" width="750">
<tr>
<td> 
 
 <form name="form1" method="post" action="sis_insert_manager_estoque.jsp" onsubmit="return verForm(this)">
 
 <table width="708" align="center">
  <tr>
   <td colspan="4" align="center"><strong>ALIMENTAR ESTOQUE</strong></td>
  </tr>
  <tr>
    <td colspan="4" align="left">&nbsp;</td>
    </tr>
  <tr>
    <td width="98" align="left">Fornecedor</td>
    <td width="319" align="left">
    <select name="fornecedorID" onchange="pesquisaProduto()">
     <option value="" selected="selected">Selecione um Fornecedor...</option>
     <%while (rs.next()){ %>
     <option value="<%=rs.getString("fornecedorID") %>"><%=rs.getString("fornNomeFantasia") %></option>
     <%} %>
    </select>
    </td>
    <td width="77" align="left">&nbsp;</td>
    <td width="194" align="left">&nbsp;</td>
  </tr>
  <%if(request.getParameter("fornecedorID") != null){%>
  <tr>
    <td align="left">Produto</td>
    <td align="left">
    <select name="produtoID" onchange="detalhesProduto(<%=request.getParameter("fornecedorID")%>)">
     <option value="" selected="selected">Selecione um Material...</option>
     <%while (rs01.next()){%>
     <option value="<%=rs01.getString("produtoID") %>"><%=rs01.getString("codigo") %> - <%=rs01.getString("nome") %></option>
     <%}%>
    </select>
    </td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <%}%>
  
  <%if(request.getParameter("produtoID") != null){%>
   <%if(rs02.next()){%>
   
  <tr>
   <td colspan="4"><hr /></td>
  </tr> 
  <tr>
    <td align="left">Preco de Custo</td>
    <td align="left"><input type="text" name="precoCusto" size="20" maxlength="10" value="<%=rs02.getString("precoCusto").replace(".",",")%>" onkeypress="venda(); return numero(this.value)"  onblur="verPonto(); venda()" /></td>
    <td align="left">Preco Venda</td>
    <td align="left"><input type="text" name="precoVenda" size="20" maxlength="10" value="<%=rs02.getString("preco").replace(".",",")%>" onkeypress="verMargem(); return numero(this.value)" onblur="verPonto(); verMargem(); verificaPreco()"/></td>
  </tr>
  <tr>
    <td align="left">Lucro (%)</td>
    <td align="left"><input type="text" name="lucro" size="10" maxlength="3" value="<%=rs02.getString("lucro")%>" onblur="verPorcentagem()" onkeypress="verPorcentagem()"/>
    % </td>
    <td align="left">unidade</td>
    <td align="left"><select name="unidade" style="width:55px">
      <option value="<%=rs02.getString("unidade")%>" selected="selected"><%=rs02.getString("unidade")%></option>
        <option value="UN">UN</option>
        <option value="KG">KG</option>
        <option value="LT">LT</option>
        <option value="ML">ML</option>
        <option value="CX">CX</option>
    </select>
   </td>
  </tr>
  <tr>
    <td colspan="4" align="center" bgcolor="#CCCCCC">Atualmente <font color="#FF0000"><%=rs02.getString("nome")%></font> tem <font color="#FF0000"><%=rs02.getString("estoque")%> <%=rs02.getString("unidade")%></font> em Estoque, vendido a <strong><font color="#008800">R$ <%=rs02.getString("preco")%></font></strong>, com <strong><%=rs02.getString("lucro")%> %</strong> de lucro.</td>
    </tr>
  <tr>
   <td colspan="4"><hr /></td>
  </tr> 
   <%} %>
  <%} %>
  <tr>
    <td align="left">Quantidade</td>
    <td align="left"><input type="text" onKeyPress="return numero(this)" onblur="verPonto()" name="quantidade" size="10" maxlength="6" /></td>
    <td align="left">Unidade Empresa</td>
    <td align="left">
     <select name="empresaID">
     <%if(rs04.next()){ %>
      <option value="<%=session.getAttribute("empresaID") %>"><%=rs04.getString("unidade") %></option>
     <%} %>
      <%while(rs03.next()){ %>
       <option value="<%=rs03.getString("empresaID") %>"><%=rs03.getString("unidade") %></option>
      <%} %>
     </select>
    </td>
  </tr>
  <tr>
    <td align="left">
    <input type="hidden" name="usuario" value="<%=session.getAttribute("usuario")%>" />
    <%if(request.getParameter("fornecedorID") != null){%>
    <input type="hidden" name="fornID" value="<%=request.getParameter("fornecedorID")%>" />
    <%}%>
    
    <%if(request.getParameter("produtoID") != null){%>
    <input type="hidden" name="prodID" value="<%=request.getParameter("produtoID")%>" />
    <input type="hidden" name="precoAnterior" value="<%=rs02.getFloat("preco")%>" />
    <%}else{%>
    <input type="hidden" name="prodID" value="" />
    <%}%>
    </td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
   <td colspan="4" align="center">
   <input name="CADASTRAR" type="submit" class="botao" onclick="verPonto()" value="Alimentar Estoque" />&nbsp;
   <input type="reset" value="Apagar" />
   </td>
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

</html>