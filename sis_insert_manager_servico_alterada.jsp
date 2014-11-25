<%@ page errorPage="index.jsp?msg=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" language="java" %>
<%@ page language="java" import="java.util.*,java.lang.*" %> 

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>




<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>


<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma busca
ResultSet rs01 = null;
%>


<%
//Recupera valores do formulário e atribui ao objeto servico
String servicoID = request.getParameter("servicoID");
String clienteID = request.getParameter("clienteID");
String dataInicio = request.getParameter("dtInicio");
String dataPrevicao = request.getParameter("previcao");
String valorTotal = request.getParameter("valorTotal");
String descricao = request.getParameter("descricao");
//Fim parte inicial da OS


String [] produtos = request.getParameterValues("produtos[]");//Todos os produtos selecionados

String index[] = request.getParameterValues("index[]");//Quanitdade de campos adicionados correspondentes a todos os produtos

int fim_index = 0;

int indexado = index.length;

if(indexado == 1)//Controle de Iterações necessários para recurerar todos os materiais inseridos para um determinado produto
{
	fim_index = indexado;
}
else
{
	fim_index = Integer.parseInt(index[indexado-1]);
	fim_index = fim_index + 1;
}
//Todas as informações do pedido do cliente
String [][] Materiais = new String[fim_index][index.length];//Aqui receberemos todos os materiais selecionados
String [][] altura = new String[fim_index][index.length];//Aqui receberemos todos as alturas informados
String [][] largura = new String[fim_index][index.length];//Aqui receberemos todos as larguras informados
String [][] quantidade = new String[fim_index][index.length];//Aqui receberemos todos as quantidades informados
String [][] valores = new String[fim_index][index.length];//Aqui receberemos todos os valores informados
//Todas informações do que realmente será gasto
String [][] alturaR = new String[fim_index][index.length];//Aqui receberemos todos as alturas reais informados
String [][] larguraR = new String[fim_index][index.length];//Aqui receberemos todos as larguras reais informados
String [][] quantidadeR = new String[fim_index][index.length];//Aqui receberemos todos as quantidades reais informados

for(int i =0; i < fim_index; i++)
{
	Materiais[i] 	= request.getParameterValues("materiais"+i+"[]");//Carega Materiais Selecionados, por produto
	altura[i] 		= request.getParameterValues("altura"+i+"[]");//Carega altura Selecionados, por produto
	largura[i] 		= request.getParameterValues("largura"+i+"[]");//Carega largura Selecionados, por produto
	quantidade[i] 	= request.getParameterValues("quantidade"+i+"[]");//Carega quantidade Selecionados, por produto
	valores[i] 		= request.getParameterValues("valorProduto"+i+"[]");//Carega valores Selecionados, por produto
	
	alturaR[i]		= request.getParameterValues("alturaR"+i+"[]");//Carega valores Selecionados, por produto
	larguraR[i]		= request.getParameterValues("larguraR"+i+"[]");//Carega valores Selecionados, por produto
	quantidadeR[i]	= request.getParameterValues("quantidade"+i+"[]");//Carega valores Selecionados, por produto
}

int totTeste = Materiais[0].length;
int totTesteIndice = 0;
if(totTeste == 1)
{
	totTeste = 1;
	for(int i = 0; i< totTeste; i++)
	{
		totTesteIndice = Materiais[i].length;
		for(int j = 0; j<Materiais[i].length; j++)
		{
			out.println("<P>" +i+" Materiais - "+ totTesteIndice +" - "+Materiais[i][j]);
		}
	}
}
else
{
	for(int i = 0; i<= totTeste; i++)
	{
		totTesteIndice = Materiais[i].length;
		for(int j = 0; j<Materiais[i].length; j++)
		{
			out.println("<P>" +i+" Materiais - "+ totTesteIndice +" - "+Materiais[i][j]);
		}
	}
}





//servico.cliente.clienteID 	= Integer.parseInt(request.getParameter("clienteID"));
//servico.empresa.empresaID	= Integer.parseInt((String)session.getAttribute("empresaID"));
//servico.descricao			= request.getParameter("descricao");
//servico.dataInicio 			= data.converteParaData(data.dataAtual());
//servico.valor				= Float.parseFloat(request.getParameter("valor"));
//servico.usuario.usuarioID	= Integer.parseInt((String)session.getAttribute("usuarioID"));

%>


<%
//Executa a Query q irá salvar o Serviço
//st.execute(servico.cadastraServico());
%>


<%
//Para gerar um cupom pesquisa na base de dados qual foi o último serviço gerado
//rs01 = st01.executeQuery(servico.ultimoServico());

//int servicoID = Integer.MIN_VALUE;

//if(rs01.next()){
	//servicoID = rs01.getInt("servicoID");
//}

%>


<%
//Direciona para a impressão de um cupom para o cliente
//response.sendRedirect("sis_print_cupom_servico_cliente.jsp?servicoID="+servicoID);
%>

<%
//fecha Statment
//st.close();
%>