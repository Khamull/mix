<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>


<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<jsp:useBean id="cheque" class="financeiro.Cheques" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="lancamentos" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statment para realizar uma query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
%>


<%
//Recupera os valores trazidos do formulário
receber.venda.vendaID 		= 0;
receber.forma.formPagID 	= 4;
receber.cliente.clienteID 	= Integer.parseInt(request.getParameter("clienteID"));
receber.parcela				= 1;
receber.de					= 1;

	//Trata o valor
	String valor = request.getParameter("valor");
	receber.valor			= Float.parseFloat(valor.replace(",","."));
	
	//Trata o vencimento
	String vencimento = request.getParameter("vencimento");
	receber.vencimento 		= data.converteParaData(vencimento);
	

%>


<%
//Gera uma Conta a Receber desse cheque
st.execute(receber.salvarReceber());

%>


<%
//Pesquisa a Ultima Conta a Receber Inserida e recupera o ID
rs01 = st01.executeQuery(receber.ultimoReceberID());
if(rs01.next()){
	receber.receberID = rs01.getInt("receberID");
}
%>

<%
//Atribui os valores ao objeto cheque
cheque.receber.receberID	= receber.receberID;
cheque.cliente.clienteID 	= receber.cliente.clienteID;
cheque.valor 				= receber.valor;
cheque.numero 				= request.getParameter("numeroCheque");
cheque.vencimento 			= receber.vencimento;
cheque.observacoes 			= request.getParameter("observacao");

%>

<%
//Salva o Cheque que retornou na tabela cheque
st.execute(cheque.cadastraCheque());

%>

<%
//Verifica qual o Atual saldo do caixa Loja
caixa.livroID = 1;
rs02 = st02.executeQuery(caixa.saldoEmCaixa());

//Atribui o Valor ao livro caixa loja
float saldoAtual = 0;
if(rs02.next()){
	saldoAtual = rs02.getFloat("saldo");
}
float subtrai = cheque.valor;
float saldoFinal = (saldoAtual - subtrai);


//Atualiza o Livro Caixa
caixa.saldo = saldoFinal;
st.execute(caixa.atualizaSaldo());
%>


<%
//Atribui os valores ao lançamento
lancamentos.receber.receberID = receber.receberID;
lancamentos.venda.vendaID = receber.venda.vendaID;
lancamentos.livro.livroID = caixa.livroID;
lancamentos.formaPag.formPagID = receber.forma.formPagID;
lancamentos.valor = cheque.valor;
lancamentos.observacao = cheque.observacoes;
lancamentos.usuario.login = (String)session.getAttribute("usuario");

//Gera um lançamento do tipo C
st.execute(lancamentos.chequeVoltou());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gera conta a Receber</title>
</head>
<body>

<%
//Variavel que irá recebe o intervalo de forma dinamica
int intervalo = 0;
%>

<table>




<tr>

<td> </td>

</tr>





<%
//Redireciona para a página de Cadastro de cheques que voltaram e manda a mensagem
response.sendRedirect("sis_cheques_voltaram.jsp?msg=1");//Caso de erro Comentar essa linha para enxergar todo o processo
%>

</table>
</body>
</html>