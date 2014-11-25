<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="compra" class="cadastro.Compras" scope="page"></jsp:useBean>

<jsp:useBean id="produtoestoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o valor de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
%>

<%
boolean alterado = false;

//Verifica se fois passado parametro via URL dando ordem para inclusão
if(request.getParameter("incluir")!=null){
	
	//Recupera os valores trazidos do formulário e atribui ao objeto compra
	compra.nome = request.getParameter("nome");
	compra.quantidade = Integer.parseInt(request.getParameter("quantidade"));
	
	
	//Insere o item na compra
	st.execute(compra.cadastraItem());
	
	alterado = true;
		
	
	//Após alterado fecha a página e atualiza a página de pai
	if(alterado){%>
		
		<script type="text/javascript">
		 window.close();  
		 window.opener.location.reload();
		</script>
		
	<%}
	
}
%>


<%
//Pesquisa todos os produtos para Listar na Combobox
rs02 = st02.executeQuery(produto.listaProdutosAtivos());
%>


<%
//Declara uma variavel tipo Flag para verificar se pesquisou ou não
boolean pesquisou = false;

//Faz a Busca sobre detalhes do Produto
if(request.getParameter("buscarPorProduto")!=null){
	produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));
	rs03 = st03.executeQuery(produto.listaProdutosPorID());
	pesquisou = true;
}else if(request.getParameter("buscarPorCod")!=null){
	rs03 = st03.executeQuery(produto.pesquisaProdutoPorCodigo(request.getParameter("codigo")));
	pesquisou = true;
}

String produtoNome = "";
String produtoValor = "";

//Se a consulta trouxer um resultado, atribui as variaveis
if(pesquisou){
	if(rs03.next()){
		produtoNome = rs03.getString("nome");
		produtoValor = rs03.getString("preco");
		produto.produtoID = rs03.getInt("produtoID");
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar Servico</title>


<style type="text/css">

body{
	background-color:#FFFFFF;
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}

input.botao {
	background-color:#FFFFFF;
	border:1px solid #003366;
	color:#333;
	font-family:arial, Geneva, sans-serif;
	font-size:13px;
	}

</style>

<script type="text/javascript">

function verForm(){
	
	if(document.form1.produto.value == ""){
		alert("Escolha um produto!");
		document.form1.produtoID.focus();
		return false;
	}
	
	if(document.form1.valor.value == ""){
		alert("Informe o valor desse serviço!");
		document.form1.valor.focus();
		return false;
	}
	

	verPonto();
}



//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}


//Verifca se tem "," ao invés de "." e Substitui
function verPonto(){
	var valor = document.form1.valor.value;
		
	valor = valor.replace(",",".");
		
	document.form1.valor.value = valor;
}


//Metodo para chamar uma busca por Produto
function bucarPorProduto(){

	if(document.form1.produtoID.value == ""){
		alert("Antes de Buscar,\nselecione um produto na Lista");
		document.form1.produtoID.focus();
		return false;
	}else{
		var produtoID = document.form1.produtoID.value;
		var servicoID = document.form1.servicoID.value
		window.location.href="sis_add_compra.jsp?produtoID="+produtoID+"&buscarPorProduto=ok&servicoID="+servicoID;
	}
}

//Metodo para chamar uma busca por Codigo
function bucarPorCod(){

	if(document.form1.codigo.value == ""){
		alert("Antes de Buscar,\ndigite o codigo do produto");
		document.form1.codigo.focus();
		return false;
	}else{
		var codigo = document.form1.codigo.value;
		var servicoID = document.form1.servicoID.value
		window.location.href="sis_add_compra.jsp?codigo="+codigo+"&buscarPorCod=ok&servicoID="+servicoID;
	}
}

</script>

</head>
<body onLoad="javascript: document.form1.produtoID.focus()">

<form name="form1" method="get" action="sis_add_compra.jsp" onSubmit="return verForm(this)" >
<table width="440" border="0" align="center" cellpadding="2" cellspacing="2">
 <tr bgcolor="#EEEEEE">
  <td colspan="3" align="center"><strong>INSERIR NOVO PRODUTO</strong></td>
 </tr>
 <tr>
   <td align="left">C&oacute;digo</td>
   <td width="273" align="left"><input type="text" name="codigo" maxlength="50" size="20"></td>
   <td width="80" align="left"><input type="button" name="buscaCodigo" value="Buscar"  onClick="javascript: bucarPorCod()"></td>
 </tr>
 <tr>
   <td align="left">Descri&ccedil;&atilde;o</td>
   <td align="left">
   <select name="produtoID" style="width:265px;">
    <option value="">Selecione um produto...</option>
    <%while(rs02.next()){ %>
     <option value="<%=rs02.getInt("produtoID") %>"><%=rs02.getString("nome") %></option>
    <%} %>
   </select>   </td>
   <td align="left"><input type="button" name="buscaProduto" value="Buscar" onClick="javascript: bucarPorProduto()"></td>
 </tr>
 <tr>
   <td colspan="3" align="center"><hr style="border:1px solid #006699"></td>
 </tr>
 <tr>
   <td align="left">Produto:</td>
   <td colspan="2" align="left"><input type="text" name="nome" value="<%=produtoNome %>" style="width:260px"></td>
 </tr>
 <tr>
  <td width="67" align="left">Valor</td>
  <td colspan="2" align="left"><input name="quantidade" type="text" onKeyPress="return numero(this.value)" value="1" size="20" maxlength="10" >
  &nbsp;
  <input type="hidden" name="servicoID" value="<%=request.getParameter("servicoID")%>" >
  <input type="hidden" name="incluir" value="1">
  <input type="hidden" name="prodID" value="<%=produto.produtoID%>">
  </td>
 </tr>
 <tr>
   <td colspan="3" align="center"><hr style="border:1px solid #006699"></td>
 </tr>
 <tr>
  <td align="right" colspan="3"><input type="submit" name="CADASTRAR" value="Incluir Produto" class="botao" ></td>
 </tr>
</table>
</form>

</body>
</html>