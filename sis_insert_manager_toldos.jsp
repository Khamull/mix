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
Statement st02 = con.createStatement();
%>


<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma busca
ResultSet rs01 = null;
%>


<%
//Recupera valores do formulário e atribui ao objeto servico


servico.cliente.clienteID 	= Integer.parseInt(request.getParameter("clienteID"));
servico.empresa.empresaID	= Integer.parseInt((String)session.getAttribute("empresaID"));
servico.descricao			= request.getParameter("descricao");
servico.dataInicio 			= data.converteParaData(data.dataAtual());
servico.valor				= Float.parseFloat(request.getParameter("valor"));
servico.usuario.usuarioID	= Integer.parseInt((String)session.getAttribute("usuarioID"));
servico.OS 					= request.getParameter("os");
servico.anoServico			= request.getParameter("anoServico");

%>


<%
//Executa a Query q irá salvar o Serviço
st02.execute(servico.cadastraServico());
%>


<%
//Para gerar um cupom pesquisa na base de dados qual foi o último serviço gerado
rs01 = st01.executeQuery(servico.ultimoServico());

int servicoID = Integer.MIN_VALUE;

if(rs01.next()){
	servicoID = rs01.getInt("servicoID");
}

%>


<%
//Direciona para a impressão de um cupom para o cliente
//response.sendRedirect("sis_print_cupom_servico_cliente.jsp?servicoID="+servicoID);
response.sendRedirect("sis_update_toldos.jsp?servicoID="+servicoID);
%>

<%
//fecha Statment
st.close();
%>