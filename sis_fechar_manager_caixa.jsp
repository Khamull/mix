<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.ServicoFechado" scope="page"></jsp:useBean>

<jsp:useBean id="lancamento" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<jsp:useBean id="retirada" class="caixaloja.Retiradas" scope="page"></jsp:useBean>

<jsp:useBean id="funcionario" class="cadastro.Funcionario" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
Statement st07 = con.createStatement();
Statement st08 = con.createStatement();
Statement st09 = con.createStatement();
Statement st010 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
ResultSet rs06 = null;
ResultSet rs07 = null;
ResultSet rs08 = null;
ResultSet rs09 = null;
ResultSet rs010 = null;
%>



<%
//Pesquisa ultima Venda que se tornará a primeira venda do caixa após aberto
rs01 = st01.executeQuery(venda.ultimaVenda());
int vendaFinal = 1;

	if(rs01.next()){
		vendaFinal = (rs01.getInt("vendaID")-1);
	}



//Pesquisa ultimo Servico que se tornará o primeiro servico do caixa após aberto
rs09 = st09.executeQuery(servico.ultimoServico());
int servicoFinal = 1;

	if(rs09.next()){
		servicoFinal = (rs09.getInt("servicofechadoID"));
	}


	
//Pesquisa ultimo Lançamento
rs02 = st02.executeQuery(lancamento.ultimoLancamento());
int lancamentoFinal = 1;

	if(rs02.next()){
		lancamentoFinal = (rs02.getInt("lancamentoID")+1);
	}



//Pesquisa ultima Retirada
rs03 = st03.executeQuery(retirada.ultimaRetirada());
int retiradaFinal = 1;

	if(rs03.next()){
		retiradaFinal = (rs03.getInt("retiradaID")+1);
	}

	

	
//Pesquisa o valor inicial, venda Inicial e Lançamento Inicial e Retirada Inicial do caixa
caixa.usuario.login = (String)session.getAttribute("usuario");
rs04 = st04.executeQuery(caixa.verificaCaixa());

int caixaID = 0;
float valorInicial = 0;
int vendaInicial = 1;
int lancamentoInicial = 1;
int retiradaInicial = 1;

if(rs04.next()){
	caixaID 					= rs04.getInt("caixaID");
	valorInicial 				= rs04.getFloat("valorInicial");
	vendaInicial 				= rs04.getInt("vendaInicial");
	lancamentoInicial 			= rs04.getInt("lancamentoInicial");
	retiradaInicial 			= rs04.getInt("retiradaInicial");
}


//Pesquisa a soma de todas as vendas desse usuário enquanto esse caixa estava aberto
venda.usuario.login = caixa.usuario.login;
rs05 = st05.executeQuery(venda.somaVendas(vendaInicial, vendaFinal));

	//Atribui o valor da Pesquisa à Variável
	float totalVenda = 0;
	if(rs05.next()){
		totalVenda = rs05.getFloat("totalVendas");
	}
	

//Pesquisa a soma de todas as vendas com forma de pagamento 1 desse usuário enquanto esse caixa estava aberto	
rs010 = st010.executeQuery(venda.somaVendasDinheiro(vendaInicial, vendaFinal));

	//Atribui o valor da Pesquisa à Variável
	float totalVendaDinheiro = 0;
	if(rs010.next()){
		totalVendaDinheiro = rs010.getFloat("totalVendas");
	}


//Pesquisa a soma de todos os lançamentos do tipo 'R' (Recebimento) , com forma de pagamento 7, 6, 5 e 4
//realizados por esse usuário do Sistema, dentro desse periodo entre o lançamento inicial e o final
lancamento.usuario.login = caixa.usuario.login;
rs06 = st06.executeQuery(lancamento.somaLancamentos(lancamentoInicial, lancamentoFinal));

	//Atribui o valor da Pesquisa à Variável	
	float totalLancamento = 0;
	if(rs06.next()){
		totalLancamento = rs06.getFloat("totalLancamentos");
	}
	
//Pesquisa a soma de todos os lançamentos do tipo 'R' (Recebimento) , com forma de pagamento 7,
//e que no momento de receber foram pagas com um cheque.
rs08 = st08.executeQuery(lancamento.somaLancamentosCheque(lancamentoInicial, lancamentoFinal));

	//Atribui o valor da Pesquisa à Variável
	float lancamentosCheque = 0;
	if(rs08.next()){
		lancamentosCheque = rs08.getFloat("totalLancamentos");
		//lancamentosCheque = 1;
		//lancamentosCheque = rs08.getFloat("formID");
	}
	
	
	

//Pesquisa a soma de todas as retiradas com caixaID igual ao do que está aberto
retirada.caixa.caixaID = rs04.getInt("caixaID");
rs07 = st07.executeQuery(retirada.somaRetiradas());

	//Atribui o valor da Pesquisa à Variável
	float totalRetirada = 0;
	if(rs07.next()){
		totalRetirada = rs07.getFloat("totalRetiradas");
	}


//Faz o Calculo
float lancamentoEmDinheiro = (totalLancamento-lancamentosCheque);
// (totalVenda + totalLancamentos + valorInicial - totalRetiradas)
float totalEmCaixa = (totalVendaDinheiro + lancamentoEmDinheiro + valorInicial - totalRetirada);
%>


<%
//Recupera valores trazidos do Formulário de Abertura de Caixa
//Atrubui eles ao objeto caixa, juntamente com os resultados das consultas acima
caixa.caixaID = caixaID;
caixa.usuario.login = (String)session.getAttribute("usuario");
caixa.valorFinal = totalEmCaixa;
caixa.vendaFinal = vendaFinal;
caixa.servicoFinal = servicoFinal;
caixa.lancamentoFinal = lancamentoFinal;
caixa.retiradaFinal = retiradaFinal;
%>

<%
//Fecha o caixa para o usuário que está logado
st.execute(caixa.fechaCaixa());

//Após Aberto o Caixa Redireciona para tela de caixa fechado
response.sendRedirect("sis_print_fechamento_caixa.jsp?caixaID="+caixaID);

%>


<html>
 <body>
 <br>
 Venda Inicial: <%=vendaInicial %> --- Venda Final: <%=vendaFinal %> <br><br>
 --------------------------------------------<br><br>
 Valor Inicial: <%=valorInicial %><br><br>
 --------------------------------------------<br><br>
 Total de Vendas: <%=totalVenda %><br><br>
 Total Vendas a Dinheiro: <%=totalVendaDinheiro %><br><br>
 Total de Recebimentos: <%=totalLancamento %><br><br>
 Recebimentos no Cheque: <%=lancamentosCheque %><br><br>
 Recebimentos no Dinheiro: <%=lancamentoEmDinheiro %><br><br>
 Total de Retiradas: <%=totalRetirada %><br><br>
 --------------------------------------------<br><br>
 Total em Caixa: <%=totalEmCaixa %> <br><br><br>
 #############################################<br>
 --------INFORMAÇÕES QUE SERÃO SALVAS-------<br>
 #############################################<br>
 <br><br>
 Login: <%=caixa.usuario.login %><br>
 Valor Final: <%=caixa.valorFinal %><br>
 Venda Final: <%=caixa.vendaFinal %><br>
 Lançamento Final: <%=caixa.lancamentoFinal %><br>
 Retirada Final: <%=caixa.retiradaFinal %><br>
 
 </body>
</html>


