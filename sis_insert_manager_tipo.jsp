<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="tipo" class="cadastro.TipoProduto" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formulário de Cadastro de Tipos
//Atrubui eles ao objeto tipo
tipo.tipo = request.getParameter("tipo");
%>

<%
//Verifica se já existe um tipo com esse Nome
rs = st.executeQuery(tipo.tipoPorNome());

if(rs.next()){
	//Caso exista um Usuário com esse nome, retorna para a Página de Cadastro
	response.sendRedirect("sis_insert_tipo.jsp?msg=4");
}else{
	//Senão: Executa a Função que irá salvar os dados na Base de Dados
	st.execute(tipo.salvaTipo());
	response.sendRedirect("sis_view_tipos.jsp?msg=1");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>