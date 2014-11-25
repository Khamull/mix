<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="transferencia" class="financeiro.Transferencias" scope="page"></jsp:useBean>

<jsp:useBean id="lancamento" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<%
//Instancia Objetos do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>

<%
//Instancia Objetos do tipo ResultSet para receber resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
%>

<%
//Recupera os valores trazidos do Formulário e Adiciona aos objetos
transferencia.bancoDe 			= Integer.parseInt(request.getParameter("bancoDe"));
transferencia.bancoPara 		= Integer.parseInt(request.getParameter("bancoPara"));

	//Trata o Valor
	String valor 				= request.getParameter("valor");
	transferencia.valor 		= Float.parseFloat(valor.replace(",","."));
	
transferencia.observacoes 		= request.getParameter("observacoes");
transferencia.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
%>

<%
//Pesquisa o saldo do BancoPara
caixa.livroID = transferencia.bancoPara;
rs01 =st01.executeQuery(caixa.bancoPorID());

//Acrescenta o valor ao BancoPara
if(rs01.next()){
	float saldoAnteriorBancoPara = rs01.getFloat("saldo");
	caixa.saldo = (saldoAnteriorBancoPara + transferencia.valor);
}

st.execute(caixa.atualizaSaldo());



//Pesquisa o saldo do BancoDe
caixa.livroID = transferencia.bancoDe;
rs02 =st02.executeQuery(caixa.bancoPorID());

//Retira o valor do BancoDe
if(rs02.next()){
	float saldoAteriorBancoDe = rs02.getFloat("saldo");
	caixa.saldo = (saldoAteriorBancoDe - transferencia.valor);
}

st.execute(caixa.atualizaSaldo());
	
//Insere essa transferencia na tabela -- transferencias --
st.execute(transferencia.cadastraTransferencia());



	//Pesquisa a ultima transferencia Realizada
	rs03 = st03.executeQuery(transferencia.ultimaTransferencia());

	//Atribui os valores ao objeto lançamento
	if(rs03.next()){
		lancamento.transferencia.transferenciaID = rs03.getInt("transferenciaID");
	}
	lancamento.valor = transferencia.valor;
	lancamento.usuario.login = (String)session.getAttribute("usuario");
	lancamento.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));

	//Gera lançamento de Retirada de um caixa
	lancamento.livro.livroID = transferencia.bancoDe;
	st.execute(lancamento.transfere());

	//Gera lançamento de Entrada no outro caixa
	lancamento.livro.livroID = transferencia.bancoPara;
	st.execute(lancamento.deposito());
	



//Redireciona para a lista de bancos e manda a mensagem
response.sendRedirect("sis_view_livro_caixa.jsp?msg=5");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transferencia Bancaria</title>
</head>
<body>

</body>
</html>