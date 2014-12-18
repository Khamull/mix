<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico"></jsp:useBean>

<jsp:useBean id="servicofechado" class="servico.ServicoFechado"></jsp:useBean>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="lancamentos" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="materiaisServico" class="servico.ServicoMateriais" scope="page"></jsp:useBean>

<jsp:useBean id="materiais" class="cadastro.Produto" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statment para realizar uma query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st09 = con.createStatement();
Statement st10 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;

%>

<%
//Recupera todos os dados do Formulário

//Adiciona ao objeto venda
/*venda.vendaID 			= Integer.parseInt(request.getParameter("vendaID"));
venda.formPag.formPagID = Integer.parseInt(request.getParameter("formID"));
venda.cliente.clienteID = Integer.parseInt(request.getParameter("clienteID"));
venda.valor				= Float.parseFloat(request.getParameter("valorVariavel"));
if(request.getParameter("pago") != ""){
	String ent = request.getParameter("pago");
	venda.entrada = Float.parseFloat(ent.replace(",","."));
}else{
	venda.entrada = 0;
}
if(request.getParameter("troco") != ""){
	String tro = request.getParameter("troco");
	venda.troco	= Float.parseFloat(tro.replace(",","."));
}else{
	venda.troco = 0;
}
venda.vezes 			= Integer.parseInt(request.getParameter("parcelas"));
if(request.getParameter("desconto") != ""){
	String desc = request.getParameter("desconto");
	venda.desconto = Float.parseFloat(desc.replace(",","."));
}else{
	venda.desconto = 0;
}*/
//SE o Receber ID não for Nulo, alteramos a forma de pagamento para a nova e mudamos para P
if(request.getParameter("receberID") != null)
{
	receber.receberID = Integer.parseInt(request.getParameter("receberID"));
	receber.forma.formPagID = Integer.parseInt(request.getParameter("formID"));
	st10.execute(receber.alteraStatus());
	st10.execute(receber.alteraFormaPgto());
}

//Adiciona ao objeto servico
servico.servicoID 					= Integer.parseInt(request.getParameter("servicoID"));
servico.formaPagamento.formPagID 	= Integer.parseInt(request.getParameter("formID"));
servico.cliente.clienteID 			= Integer.parseInt(request.getParameter("clienteID"));
servico.valor						= Float.parseFloat(request.getParameter("valorVariavel"));
if(request.getParameter("pago") != ""){
	String ent = request.getParameter("pago");
	servico.entrada = Float.parseFloat(ent.replace(",","."));
}else{
	servico.entrada = 0;
}
if(request.getParameter("troco") != ""){
	String tro = request.getParameter("troco");
	servico.troco	= Float.parseFloat(tro.replace(",","."));
}else{
	servico.troco = 0;
}
servico.vezes 			= Integer.parseInt(request.getParameter("parcelas"));
if(request.getParameter("desconto") != ""){
	String desc = request.getParameter("desconto");
	servico.desconto = Float.parseFloat(desc.replace(",","."));
}else{
	servico.desconto = 0;
}


//Adiciona ao objeto receber
receber.servico.servicoID	= Integer.parseInt(request.getParameter("servicoID"));
receber.forma.formPagID 	= Integer.parseInt(request.getParameter("formID"));
receber.cliente.clienteID 	= Integer.parseInt(request.getParameter("clienteID"));
receber.de					= Integer.parseInt(request.getParameter("parcelas"));
receber.empresa.empresaID	= Integer.parseInt((String)session.getAttribute("empresaID"));


	//Verifica se a forma de pagamento é diferente de [ (1) Dinheiro ]
	if(receber.forma.formPagID != 1){
		float a = (servico.entrada - servico.troco);
		float b = (servico.valor - a);
		float c = (b / servico.vezes);
		receber.valor = c;
	}else{
		receber.valor = servico.entrada - servico.troco;
	}
%>


<%
//Verifica se foi dado um valor de Entrada e gera um receber com status 'P' (Pago) e Insere no Livro Caixa 'Loja'
if(servico.entrada != 0){
	String d = data.dataAtual();
	receber.vencimento = data.converteParaData(d);
	float entrada = (servico.entrada - servico.troco);
	st.execute(receber.cadastraEntradaServico(entrada));
	
	//Recupera o ID do ultimo receber lançado
	rs01 = st01.executeQuery(receber.ultimoReceberIDServico());
	
	//Atribui os valores ao Objeto do tipo Lancamentos
	if(rs01.next()){
		lancamentos.receber.receberID = rs01.getInt("receberID");
	}
	lancamentos.valor = (servico.entrada - servico.troco);
	lancamentos.venda.vendaID = servico.servicoID;
	lancamentos.formaPag.formPagID = servico.formaPagamento.formPagID;
	lancamentos.usuario.login = (String)session.getAttribute("usuario");
	lancamentos.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	
	
	//Gera um Lançamento
	st.execute(lancamentos.insereEntradaServico());
	
	//Verifica qual o Atual saldo do caixa Loja
	caixa.livroID = 1;
	rs02 = st02.executeQuery(caixa.saldoEmCaixa());
	
	//Atribui o Valor ao livro caixa loja
	float saldoAtual = 0;
	if(rs02.next()){
		saldoAtual = rs02.getFloat("saldo");
	}
	float adicional = lancamentos.valor;
	float saldoFinal = (saldoAtual + adicional);
	
	//Atualiza o Livro Caixa
	caixa.saldo = saldoFinal;
	st.execute(caixa.atualizaSaldo());
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Calendar"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.IntArrayData"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Finaliza Servico</title>
</head>
<body>
<br>
<%=servico.vezes %> vezes de R$ <%=receber.valor %> <br><br>
pago = R$ <%=servico.entrada %><br><br>
troco = R$ <%=servico.troco %><br><br>
desconto = R$ <%=servico.desconto %><br><br>
total = R$ <%=servico.valor %><br><br>

<br><br>

<%
//Verifica se a forma de pagamento é Diferente de Dinheiro
if(servico.formaPagamento.formPagID != 1){
%>

##### VENCIMENTOS #####<br><br>

 <%
 //Trata a data de Vencimento
 Calendar hoje = Calendar.getInstance();
 %>
 <%
 
 int dia = 0;
 int mes = 0;
 int ano = 0;
 
 //Se a forma de pagamento for Cartão de Débito acrescenta acrescenta um dia pois só cairá amanhã e não acrescenta um mes
 if(servico.formaPagamento.formPagID == 3){
	 dia = Integer.parseInt(data.diaAtual()) + 1;
	 //Trata dia para não ficar maior que 30
	 mes = hoje.get(Calendar.MONTH);
	 if(dia >= 30 || mes == 2){
		 dia = 1;
		 mes = mes + 1;
	 }
 }else if(servico.formaPagamento.formPagID == 4){
	 //Caso a forma de pagemento sejá Cheque não precisa acrescentar um mes
	 dia = Integer.parseInt(data.diaAtual());
	 mes = hoje.get(Calendar.MONTH);
 }else{
		 //Senão corre as parcelas normais para a partir de hoje 30 / 60 / 90 / 120 / ... dias
		 dia = Integer.parseInt(data.diaAtual());
		 mes = hoje.get(Calendar.MONTH)+ 1;//Peguei o mes atual e somei mais um pois (Estranhamente) o Calendar está trazendo o mês anterior
	 
	 	//Trata a Data se ela existe daqui 30 dias
	 	String dataOk = data.verificaSeExiste(dia, mes);
	 
		 //Da um Split e recupera o dia e o Mes novamente,
		 //Porém agora já foi verificado se ele existe
		 String[] vetor = new String[2];
		 vetor = dataOk.split("-");
		 dia = Integer.parseInt(vetor[0]);
		 mes = Integer.parseInt(vetor[1]);
 }
 
 	ano = Integer.parseInt(data.anoAtual());
	if(request.getParameter("alteradata") != null && request.getParameter("alteradata").equals("1"))//Verifica se ocorreu alteração de data de vencimento
	{
		String [] DatasAlteradas = request.getParameterValues("dataParcela[]");//Insere datas a serem pagas alteradas
		for(int i = 0; i <DatasAlteradas.length; i++){
			String dataAtual = "";
			 dataAtual = data.trataData(DatasAlteradas[i]);
			 //dataAtual = data.converteDeData(dataAtual);
			 //Atribui o numero da parcela e o dia de vencimento ao objeto > receber <
			 receber.parcela = i;
			 receber.vencimento = dataAtual;
			 //A cada vez que passar pelo looping irá inserir a conta a receber na base de dados
			 st.execute(receber.salvarReceberServico());
		} 
	}
	else{
	for(int i = 1; i <= servico.vezes; i++){
		 String m = String.valueOf(i+mes);
		 String d = String.valueOf(dia);
		 
		 String dataOk2 = data.verificaSeExiste(Integer.parseInt(d), Integer.parseInt(m));
		 
		 String[] vetor2 = new String[2];
		 
		 vetor2 = dataOk2.split("-");
		 
		 d = vetor2[0];
		 m = vetor2[1];
		 
			//verifica se não veio com duas casas e converte para duas casas
			if(m.length() < 2){
				m = "0"+m;
			}
			
			//verifica se não veio com duas casas e converte para duas casas
			if(d.length() < 2){
				d = "0"+d;
			}
		 
		 %>
		
		 <% 
		 //Junta as tres informações em uma String
		 String dataAtual = d+"/"+m+"/"+ano;
		 
		 dataAtual = data.trataData(dataAtual);
		 
		 //dataAtual = data.converteDeData(dataAtual);
		 %>
		 
		 <%=receber.valor %> <%=dataAtual%> <br>
		 
		 <%
		 //Atribui o numero da parcela e o dia de vencimento ao objeto > receber <
		 receber.parcela = i;
		 receber.vencimento = dataAtual;
		 %>
		 
		 <%
		 //A cada vez que passar pelo looping irá inserir a conta a receber na base de dados
		 st.execute(receber.salvarReceberServico());
	 %>
	 
	 
	<%}
	} %>

<br>#########################

<%
//Caso a forma de Pagamento seja Dinheiro a Vista irá inserir uma unica vez no contas a receber
}else{ %>

<%=servico.valor %> - <%=data.dataAtual() %>

<%} %>

<%
//Altera os valores dele como por ex: Forma de Pagamento
st.execute(servico.completaServico());
%>


<%
//Insere o registro desse serviço finalizado na tabela servicofechado para ser contabilizado no caixa que está aberto
servicofechado.servico.servicoID = servico.servicoID;
servicofechado.valor = servico.valor;
servicofechado.formPagID = servico.formaPagamento.formPagID;
servicofechado.usuario.usuarioID = Integer.parseInt((String)session.getAttribute("usuarioID"));

st.execute(servicofechado.cadastraServicoFechado());
%>

<%//fazer altrerações no estoque, posto que o serviço foi de fato recebido

	float qtd = 0;
	float qtdEstoque = 0;
	float qtdFim = 0;
	int tipo = 0;
	Statement st03 = con.createStatement();
	Statement st04 = con.createStatement();
	Statement st05 = con.createStatement();
	Statement st06 = con.createStatement();
	//Instancia um objeto do tipo Resultset para receber o resultado de uma consulta
	ResultSet rs03 = null;
	ResultSet rs04 = null;
	ResultSet rs05 = null;
	//Pesquisar Tipo Serviço
	rs05 = st05.executeQuery(servico.pesquisaServico());
	if(rs05.next())
	{
		tipo = rs05.getInt("tipo");
	}
	

	if(tipo != 0){//Fazer os devidos Débitos no estoque
		//materiais.listaProdutosPorID_();	
		materiaisServico.servico.servicoID = servico.servicoID;
		rs03 = st03.executeQuery(materiaisServico.selectMaterial());
	
		while(rs03.next())
		{
			materiais.produtoID = rs03.getInt("idMaterial");
			qtd = rs03.getFloat("quantidadeReal");
			rs04 = st04.executeQuery(materiais.listaProdutosPorID_());
			if(rs04.next()){
				qtdEstoque = rs04.getFloat("estoque");
				if(qtd > qtdEstoque)
				{
					qtdFim = qtd - qtdEstoque;
				}
				if(qtdEstoque> qtd)
				{
					qtdFim = qtdEstoque - qtd;
				}
				materiais.estoque = qtdFim;
				st05.execute(materiais.alteraEstoqueProduto());
			}
		}
	}
%>






<%
st09.execute(servico.atualizaFormPag(request.getParameter("OS"),request.getParameter("Ano"),request.getParameter("formID")));

//Envia para a tela de impressão de pedido
if(request.getParameter("receberID") != null)
{
	response.sendRedirect("sis_print_cupom_servico.jsp?servicoID="+servico.servicoID+"&OS="+request.getParameter("OS")+"&Ano="+request.getParameter("Ano")+"&receberID="+request.getParameter("receberID"));//Caso der algum problema é só comentar essa linha que irá aparecer na tela todas as informações do Pagamento da Compra
}
else
{
	response.sendRedirect("sis_print_cupom_servico.jsp?servicoID="+servico.servicoID+"&OS="+request.getParameter("OS")+"&Ano="+request.getParameter("Ano"));//Caso der algum problema é só comentar essa linha que irá aparecer na tela todas as informações do Pagamento da Compra
}
%>


</body>
</html>