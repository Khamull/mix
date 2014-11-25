<%@page import="java.sql.*" %>
<%@include file="inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="transferencia" class="financeiro.TransferenciaEstoque" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet
ResultSet rs01 = null;
ResultSet rs02 = null;
%>


<%
//Declaração da variavel que será utilizada como flag para identificar se a operação foi realizada com sucesso
boolean transferido = true;
%>


<%
//Recupera os valores vindo do formulário
int origem 							= Integer.parseInt(request.getParameter("origem"));
int destino 						= Integer.parseInt(request.getParameter("destino"));
produtoEstoque.produto.produtoID 	= Integer.parseInt(request.getParameter("prodID"));
float quantidade 					= Float.parseFloat(request.getParameter("quantidade"));
%>


<%
//Pesquisa o Estoque da Empresa Origem
produtoEstoque.empresa.empresaID = origem;
rs01 = st01.executeQuery(produtoEstoque.pesquisaEstoque());

float estoqueOrigem = 0;
if(rs01.next()){
	estoqueOrigem = rs01.getFloat("quantidade");
}
%>


<%
//Pesquisa o Estoque da Empresa Destino
produtoEstoque.empresa.empresaID = destino;
rs02 = st02.executeQuery(produtoEstoque.pesquisaEstoque());

float estoqueDestino = 0;
if(rs02.next()){
	estoqueDestino = rs02.getFloat("quantidade");
}else{
	st.execute(produtoEstoque.salvaQuantidade());
}
%>


<%
//Verifica se a Empresa Origem tem a quantidade que foi solicitada em seu estoque
if(quantidade > estoqueOrigem){ 
	
	transferido = false;
%>

	<script type="text/javascript">
	 alert("Não é possivel transferir essa quantidade!");
	 window.location.href="sis_transferencia_estoque.jsp";
	</script>

<%}else{

	//Atualiza o estoque Destino
	produtoEstoque.quantidade = (estoqueDestino + quantidade);
	produtoEstoque.empresa.empresaID = destino;
	st.execute(produtoEstoque.alteraEstoque());
	
	//Atualiza o estoque Origem
	produtoEstoque.quantidade = (estoqueOrigem - quantidade);
	produtoEstoque.empresa.empresaID = origem;
	st.execute(produtoEstoque.alteraEstoque());
	
	
	//Salva essa transferencia na tabela trasferenciaestoque
	transferencia.usuario.usuarioID	= Integer.parseInt((String)session.getAttribute("usuarioID"));
	transferencia.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	transferencia.origemID 			= origem;
	transferencia.destinoID 		= destino;
	transferencia.quantidade 		= quantidade;
	
	st.execute(transferencia.salvaTransferencia());
}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transferencia</title>
</head>
<body>

estoque Origem <%=estoqueOrigem %> <br><br>
estoque Destino <%=estoqueDestino %>


<%
//Após realizada as operações Redireciona para a página de visualização dos Produtos
if(transferido){
	response.sendRedirect("sis_view_produtos_separados.jsp?msg=6");
}
%>

</body>
</html>