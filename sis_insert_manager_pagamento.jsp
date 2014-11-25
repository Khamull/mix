<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="lancamento" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="pagar" class="financeiro.Pagar" scope="page"></jsp:useBean>

<jsp:useBean id="contapagar" class="financeiro.ContasPagar" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statment para realizar uma query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Recupera os valores do Formulário para o Objeto lancamento
lancamento.pagar.pagarID = Integer.parseInt(request.getParameter("pagarID"));
lancamento.livro.livroID = Integer.parseInt(request.getParameter("livroID"));
lancamento.formaPag.formPagID = Integer.parseInt(request.getParameter("formID"));
lancamento.observacao = request.getParameter("observacao");
lancamento.contaPagar.contaID = Integer.parseInt(request.getParameter("contapagarID"));
lancamento.usuario.login = (String)session.getAttribute("usuario");
lancamento.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));

	//Trata valor
	float valor = Float.parseFloat(request.getParameter("valor"));
	float desconto = 0;
	float acrescimo = 0;
	if(request.getParameter("desconto")!=""){
		String descontoString = request.getParameter("desconto");
		desconto = Float.parseFloat(descontoString.replace(",","."));
		lancamento.desconto = desconto;
	}
	if(request.getParameter("acrescimo")!=""){
		String acrescimoString = request.getParameter("acrescimo");
		acrescimo = Float.parseFloat(acrescimoString.replace(",","."));
		lancamento.acrescimo = acrescimo;
	}
	
	lancamento.valor 		= (valor + acrescimo - desconto);
	lancamento.desconto 	= desconto;
	lancamento.acrescimo 	= acrescimo;
%>

<%
//Pesquisa Favorecido
contapagar.contaID = lancamento.contaPagar.contaID;

rs02 = st02.executeQuery(contapagar.contaPorId());

//verifica se existe e atribui ao Objeto lancamento
if(rs02.next()){
	lancamento.favorecido = rs02.getString("favorecido");
}

%>

<%
//Gera um Lançamento
st.execute(lancamento.pagaContaPagar());

//Verifica qual o Atual saldo do caixa Loja
caixa.livroID = lancamento.livro.livroID;
rs01 = st01.executeQuery(caixa.saldoEmCaixa());

//Atribui o Valor ao livro caixa loja
float saldoAtual = 0;
if(rs01.next()){
	saldoAtual = rs01.getFloat("saldo");
}
float adicional = lancamento.valor;
float saldoFinal = (saldoAtual - adicional);


//Muda o Status da Conta à Pagar para 'P' de Pago
pagar.pagarID = Integer.parseInt(request.getParameter("pagarID"));
st.execute(pagar.alteraStatus());


//Atualiza o Livro Caixa
caixa.saldo = saldoFinal;
st.execute(caixa.atualizaSaldo());

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastra o Lancamento</title>
</head>
<body>

<%=lancamento.valor %><br>
<%=lancamento.livro.livroID %><br>
<%=lancamento.desconto %></br>
<%=lancamento.acrescimo %><br>
<%=lancamento.observacao %>


<%
//Envia para a tela de Contas a Receber
response.sendRedirect("sis_conta_pagar_separada.jsp");//Caso der algum problema é só comentar essa linha
%>

</body>
</html>