<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="materiais" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="produtoestoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="produtos" class="cadastro.Produtos" scope="page"></jsp:useBean>

<jsp:useBean id="insertMateriais" class="servico.ServicoMateriais" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
Statement st07 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o valor de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
ResultSet rs06 = null;
%>

<%

rs06 = st06.executeQuery(materiais.listaProdutosAtivos_Selecao());//Lista Produtos

String selecione = "<SELECT name=\"materiais[]\" style=\"width:150px\" )\">";
String selecione2= "";

String opcoes="<option value=\"\">Selecione . . .</option>";

while(rs06.next()){ 
 opcoes +=	"<option value=\"" +rs06.getString("produtoID")+"\">"+rs06.getString("nome") +"</option>";
}

selecione += opcoes;
selecione += "</SELECT>";

//selecione2 = opcoes+"</SELECT>";
//String jsct = "";
//jsct = "\\"+"\""; 
//selecione2 = selecione2.replace("\"", jsct);
//selecione2 = "\""+selecione2+"\"";

%>

<%
//Verifica se foiz passado parametro via URL dando ordem para inclusão
boolean alterado = false;
if(request.getParameter("incluir")!=null){
	
	//Recupera Arrays dos Materiais
	String [] Materiais = request.getParameterValues("materiais[]");//Dimensões Informadas na OS
	String [] Altura    = request.getParameterValues("altura[]");
	String [] Largura	= request.getParameterValues("largura[]");
	String [] Quantidade= request.getParameterValues("Quantidade[]");
	String [] AlturaR    	= request.getParameterValues("alturaR[]");//valores Reais de consumo(com sobra)
	String [] LarguraR		= request.getParameterValues("larguraR[]");
	String [] QuantidadeR	= request.getParameterValues("QuantidadeR[]");
	String [] valorMateriais= request.getParameterValues("valorMaterial[]");
	
	
	
	
	
	//Recupera os valores trazidos do formulário e atribui ao objeto servicoitem
	servicoproduto.servico.servicoID 	= Integer.parseInt(request.getParameter("servicoID"));
	servicoproduto.produtos.produtoID	= Integer.parseInt(request.getParameter("produtoID"));
	servicoproduto.valor 				= Float.parseFloat(request.getParameter("valor"));
	servicoproduto.altura				= request.getParameter("alturaProduto");
	servicoproduto.largura				= request.getParameter("larguraProduto");
	//Atribui o valor ao objeto servico
	servico.servicoID				= servicoproduto.servico.servicoID;
	
	
	//Insere o produto na base de dados
	st.execute(servicoproduto.salvaProduto());
	
	//-------------------> Continuar Daqui!
	//Pesquisa o estoque TOTAL atual dos materias
	//produto.produtoID = servicoproduto.produtos.produtoID; Aqui devemos alterar para assumir os valores da tebala de materias, que é a antiga tabela de Produto
 	
	for(int i = 0; i< Materiais.length; i++){
		
		
		//Inserir dados de materiais usados na tabela 
		produto.produtoID = Integer.parseInt(Materiais[i]);
		rs04 = st04.executeQuery(produto.listaProdutosIDNova());//Aqui termina a parte de inserção de dados do produto, seguimos para iteração por material
	
		float estoqueTotalAtual = 0;
	
	if(rs04.next()){
		estoqueTotalAtual = rs04.getFloat("estoque");
		insertMateriais.valorCusto	 	= rs04.getFloat("precoCusto");
	}
	
	//Insere na tabela de Materiais
	insertMateriais.servico.servicoID 	= Integer.parseInt(request.getParameter("servicoID"));
	insertMateriais.produto.produtoID 	= Integer.parseInt(Materiais[i]);
	insertMateriais.produtos.produtoID  = servicoproduto.produtos.produtoID;
	insertMateriais.altura			  	= Altura[i];
	insertMateriais.largura			  	= Largura[i];
	insertMateriais.valor			  	= Float.valueOf(valorMateriais[i].replace(",", "."));
	insertMateriais.Quantidade		  	= Quantidade[i];
	insertMateriais.alturaR 	      	= AlturaR[i];
	insertMateriais.larguraR 			= LarguraR[i];
	insertMateriais.QuantidadeR 		= QuantidadeR[i];
	
	//Insere de fato na tabela servicoMateriais
	st07.execute(insertMateriais.insereMaterial());
		//Atualiza o estoque total
		produto.estoque = (estoqueTotalAtual - Integer.parseInt(QuantidadeR[i]));
		st.execute(produto.alteraEstoqueProduto());
		
	
	//pesquisa o estoque POR LOJA desse produto
	produtoestoque.produto.produtoID = produto.produtoID;
	produtoestoque.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	rs05 = st05.executeQuery(produtoestoque.pesquisaEstoque());
	
	float estoqueAtual = 0;
	
	if(rs05.next()){
		estoqueAtual = rs05.getFloat("quantidade");
	}
	
		//Atualiza o estoque por loja
		produtoestoque.quantidade = (estoqueAtual - Integer.parseInt(QuantidadeR[i]));
		st.execute(produtoestoque.alteraEstoque());
	
	
	
	
	}
	
	//Pesquisa o valor total atual desse serviço
		rs01 = st01.executeQuery(servico.pesquisaServico());
		
		float valorAtual = 0;
		
		
		if(rs01.next()){
			valorAtual = rs01.getFloat("valor");
			alterado = true;
		}
		
		//Soma ao novo valor vindo do formulário
		servico.valor = (valorAtual + servicoproduto.valor);
		
		//Altera o valor total do servico
		st.execute(servico.atualizaValorServico());
		
		
		//Muda o Status de visualizado para (Não-Visualizado)
		//st.execute(servico.naoVisualizado());
		
		
		
	
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
rs02 = st02.executeQuery(produtos.pesquisaProdutosTodos());
%>


<%
//Declara uma variavel tipo Flag para verificar se pesquisou ou não
boolean pesquisou = false;

//Faz a Busca sobre detalhes do Produto
if(request.getParameter("buscarPorProduto")!=null){
	produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));
	rs03 = st03.executeQuery(produtos.pesquisaProdutoID());
	pesquisou = true;
}else if(request.getParameter("buscarPorCod")!=null){
	rs03 = st03.executeQuery(produtos.pesquisaProdutoPorCodigo(request.getParameter("codigo")));
	pesquisou = true;
}

String produtoNome = "";
String produtoValor = "";

//Se a consulta trouxer um resultado, atribui as variaveis
if(pesquisou){
	if(rs03.next()){
		produtoNome = rs03.getString("nome");
		//produtoValor = rs03.getString("preco");
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
//Controla adição e remoção de campos da tabela de materias
function addRow(tableID) {
	 
    var table = document.getElementById(tableID);
    tableIDTeste = tableID;
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);
	//alert(rowCount);
    var colCount = table.rows[0].cells.length;

    for(var i=0; i<colCount; i++) {
    			
        		var newcell = row.insertCell(i);
        		newcell.innerHTML = table.rows[0].cells[i].innerHTML;
        		//alert(newcell.childNodes);
        		switch(newcell.childNodes[0].type) {
	            case "text":
	                    newcell.childNodes[0].value = "";
	                    break;
	            case "checkbox":
	                    newcell.childNodes[0].checked = false;
	                    break;
	            case "select-one":
	                    newcell.childNodes[0].selectedIndex = 0;
	                    break;

        }
    }
}

function deleteRow(tableID, tipo) {
    try {
    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;

    for(var i=0; i<rowCount; i++) {
        var row = table.rows[i];
        var chkbox = row.cells[0].childNodes[0];
        if(null != chkbox && true == chkbox.checked) {
        	if(rowCount <= 1) {
                //alert("NU+00E3o Ã© psossÃ­vel remover todas as linhas.");
                break;
            }
        	//if(tipo ==0)
        	//	{
        	var tabela = row.cells[1].childNodes[0].nextSibling;
           	var tabelaRow = tabela.rows[1];
           	//var campo = tabelaRow.cells[8].childNodes[0];
           	var campo = tabelaRow.cells[4].childNodes[1];
           	if(campo.value != null || campo.value != "")
           		{subtrai(campo.value);}
        	//	}
        	//else
        	//	{
	        		//var tabela = row.cells[1].childNodes[0];
	               	//var tabelaRow = tabela.rows[1];
	              	//var campo = tabelaRow.cells[8].childNodes[0];
	              	//if(campo.value != null || campo.value != "")
	              	//	{subtrai(campo.value);}
        	//	
        	//	}
        	
           	
            table.deleteRow(i);
            rowCount--;
            i--;
        }


    }
    }catch(e) {
        alert(e);
    }
}

function subtrai(valor)
{
	form1.valor.value = parseFloat(parseFloat(verPonto_Calculo(form1.valor.value)) - parseFloat(verPonto_Calculo(valor))).toFixed(2);
}


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
		window.location.href="sis_add_produto.jsp?produtoID="+produtoID+"&buscarPorProduto=ok&servicoID="+servicoID;
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
		window.location.href="sis_add_produto.jsp?codigo="+codigo+"&buscarPorCod=ok&servicoID="+servicoID;
	}
}

function somavalor(obj)//Conforme UsuÃ¡rio insere valores, soma e atribui a campo valor total
{
	var valorProduto = obj.value;
	//alert(valorProduto);
	//alert(form1.valorTotal.value);
	form1.valor.value = parseFloat(parseFloat(verPonto_Calculo(form1.valor.value)) +  parseFloat(verPonto_Calculo(valorProduto))).toFixed(2);
}

function verPonto_Calculo(val){
	var valor = val;
		
	valor = valor.replace(",",".");
		
	return valor;
}

</script>

</head>
<body onLoad="javascript: document.form1.produtoID.focus()">

<form name="form1" method="get" action="sis_add_produto.jsp" onSubmit="return verForm(this)" >
<table width="440" border="0" align="center" cellpadding="2" cellspacing="2">
 <tr bgcolor="#EEEEEE">
  <td colspan="5" align="center"><strong>INSERIR NOVO PRODUTO</strong></td>
  
 </tr>
 <!-- <tr>
   <td align="left">C&oacute;digo</td>
   <td width="273" align="left"><input type="text" name="codigo" maxlength="50" size="20"></td>
   <td width="80" align="left"><input type="button" name="buscaCodigo" value="Buscar"  onClick="javascript: bucarPorCod()"></td>
 </tr>
 <tr>-->
 	<td></td>
   <td align="center">Produto <!-- Descri&ccedil;&atilde;o-->
		<select name="produtoID" style="width:150px;">
    	<option value="">Selecione...</option>
    		<%while(rs02.next()){ %>
     		<option value="<%=rs02.getInt("produtoID") %>"><%=rs02.getString("nome") %></option>
    		<%} %>
   </select></td>
   <!-- <td align="left"><input type="button" name="buscaProduto" value="Buscar" onClick="javascript: bucarPorProduto()"></td>-->
 </tr>
 <tr>
   <td colspan="5 align="center"><hr style="border:1px solid #006699"></td>
 </tr>
 <tr>
   <td align="center" colspan="5">Altura<input type="number" step="0.01" min="0" name="alturaProduto" value="" required style="margin: 5px 10px 5px 10px; width:63px"/>Largura<input type="number" step="0.01" min="0" name="larguraProduto" value="" style="margin: 5px 10px 5px 10px; width:63px" required></td>
 </tr>
 <tr>
  <td width="67" align="center" colspan="5">Valor<input name="valor" type="text" onchange="return numero(this.value)" value="0,00" size="20" maxlength="10" style="margin: 0px 5px 5px 5px; width:200px" readonly="readonly">
  &nbsp;
	  <input type="hidden" name="servicoID" value="<%=request.getParameter("servicoID")%>" >
	  <input type="hidden" name="incluir" value="1">
  </td>
 </tr>
 <tr>
   <td colspan="5" align="center"><hr style="border:1px solid #006699"></td>
 </tr>
 <tr>
   <td colspan="4">
   <TABLE id="dataTable0"  border="0" align="center" style="border-radius:9px; border:1px solid black" > 
						        <TR>
						        	<TD><INPUT type="checkbox" name="chk[]"/></TD>
						        	<TD>
						        		<table border="0">
						        		<TR>
						        			<TD>
								                Material<%=selecione%>
								            </td>    
								            <td>Altura <INPUT type="number" step="0.01" name="altura[]" min="0" value="0" style="width:75px"/></td>
											<td>Largura <INPUT type="number" name="largura[]" min="0" step="0.01" value="0" size="5" style="width:75px"/></td>
											<td>Quantidade<INPUT type="number" name="Quantidade[]" min="0" step="0.01" value="0" required size="5" style="width:75px"/></td>
							            </TR>
							            <TR>
								        	<TD>
								        	Quantidades Reais:</td>
								            <td>Altura <INPUT type="number" name="alturaR[]" min="0" step="0.01" value="0" size="5" style="width:75px"/></td>
								            <td>Largura<INPUT type="number" name="larguraR[]" min="0" size="5" step="0.01" value="0" style="width:75px"/></td>
								            <td>Quantidade<INPUT type="number" name="QuantidadeR[]" min="0" size="5" step="0.01" value="0" required style="width:75px"/></td>
								            <td>Valor: 
				    						<input type="text" name="valorMaterial[]" size="5" required style="width:75px" value="0.00" size="20" maxlength="10" onchange="somavalor(this);verPonto();return numero(this.value)"/></td>
						        		</TR>
						        		</table>
						        	</TD>
								</TR>
					    </TABLE>
					    </td>
					    <td colspan="" align="center">
	  						<img src="images/add.png" style="display:block;width:15px;height:20px;text-indent:-9000em;overflow:hidden;" title="Adicionar Produto" onclick="addRow('dataTable0')">
							<img src="images/delete.png" style="display:block;width:15px;height:20px;text-indent:-9000em;overflow:hidden;" title="Remover Produto" onclick="deleteRow('dataTable0')">
   					</td>	
 </tr>
 <tr>
  <td align="center" colspan="5"><input type="submit" name="CADASTRAR" value="Incluir Produto" class="botao" ></td>
 </tr>
</table>
</form>

</body>
</html>