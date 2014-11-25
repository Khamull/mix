<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>
 
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
//ANTES DE CRIAR UMA NOVA VENDA OU ABRIR UMA JÁ EXISTENTE
//VERIFICA SE FOI FEITA A ABERTURA DO CAIXA COM O LOGIN DO
//USUARIO QUE ESTÁ LOGADO NO MOMENTO

//Atribui o nome do usuario ao objeto caixa para realizar
//a consulta posteriormente
caixa.usuario.login = (String)session.getAttribute("usuario");

//Faz a consulta na Base de Dados
rs02 = st02.executeQuery(caixa.verificaCaixa());


//Caso não haja um caixa aberto com esse usuário que está logado
//será redirecionado para a página de menu dando a mensagem ao usuário.
if(rs02.next()){
	//Continua executando a página
%>
 
 
<%
//Atribui o login do usuario logado ao objeto usuario
venda.usuario.login = (String)session.getAttribute("usuario");


//verifica se já tem uma venda Aberta com esse usuario do Sistema
rs = st.executeQuery(venda.vendaAberta());

//Caso tenha uma Aberta direciona para a página de venda sem abrir uma nova
if(rs.next()){
	response.sendRedirect("sis_pdv.jsp?vendaID="+rs.getString("vendaID"));
}else{
	//Senão abre uma nova VENDA na tabela venda e direciona para a página de venda
	
	//Atribui o ID da empresa ao objeto
	venda.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	
	st.execute(venda.cadastraVenda());
	rs01 = st.executeQuery(venda.vendaAberta());
	if(rs01.next()){
		response.sendRedirect("sis_pdv.jsp?vendaID="+rs01.getString("vendaID"));	
	}
}

%>

<%
}else{
	response.sendRedirect("sis_menu.jsp?msg=1");
}
%>