<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="orcamento" class="pdv.Orcamento" scope="page"></jsp:useBean>
 
<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>
 
 
<%
//Instancia um Objeto do tipo Statement para ajudar na query
Statement st02 = con.createStatement();
%>
 
<%
//Instancia Objeto do tipo ResultSet para ser alimentado com o resultado da Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
%> 
 
 
<%
//ANTES DE CRIAR UM NOVO ORCAMENTO OU ABRIR UM JÁ EXISTENTE
//VERIFICA SE FOI FEITA A ABERTURA DO CAIXA COM O LOGIN DO
//USUARIO QUE ESTÁ LOGADO NO MOMENTO

//Atribui o nome do usuario ao objeto caixa para realizar
//a consulta posteriormente
//caixa.usuario.login = (String)session.getAttribute("usuario");

//Faz a consulta na Base de Dados
//rs02 = st02.executeQuery(caixa.verificaCaixa());


//Caso não haja um caixa aberto com esse usuário que está logado
//será redirecionado para a página de menu dando a mensagem ao usuário.
//if(rs02.next()){
	//Continua executando a página
%>
 
 
<%
//Atribui o login do usuario logado ao objeto usuario
orcamento.usuario.login = (String)session.getAttribute("usuario");


//Atribui o empresaID que está salvo na sessão ao objeto orcamento
orcamento.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));


//verifica se já tem um Orcamento Aberto com esse usuario do Sistema
rs = st.executeQuery(orcamento.orcamentoAberta());

//Caso tenha um Aberto direciona para a página de orcamento sem abrir um novo
if(rs.next()){
	response.sendRedirect("sis_insert_orcamento.jsp?orcamentoID="+rs.getString("orcamentoID"));
}else{
	//Senão abre um novo ORCAMENTO na tabela orcamento e direciona para a página de orcamento
	st.execute(orcamento.cadastraOrcamento());
	rs01 = st.executeQuery(orcamento.orcamentoAberta());
	if(rs01.next()){
		response.sendRedirect("sis_insert_orcamento.jsp?orcamentoID="+rs01.getString("orcamentoID"));	
	}
}

%>

<%
//}else{
//	response.sendRedirect("sis_menu.jsp?msg=1");
//}
%>