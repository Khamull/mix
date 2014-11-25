<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formulário de Cadastro de Usuários
//Atrubui eles ao objeto usuario
usuario.funcionario.funcionarioID = Integer.parseInt(request.getParameter("funcionarioID"));
usuario.nome = request.getParameter("nome");
usuario.login = request.getParameter("login");
usuario.senha = request.getParameter("senha");
usuario.nivel = request.getParameter("nivel");
usuario.empresa.empresaID = Integer.parseInt(request.getParameter("empresaID"));
%>

<%
//Verifica se já existe um usuário com esse Nome
rs = st.executeQuery(usuario.verificaNome());

if(rs.next()){
	//Caso exista um Usuário com esse nome, retorna para a Página de Cadastro
	response.sendRedirect("sis_insert_usuario.jsp?msg=4");
}else{
	//Senão: Executa a Função que irá salvar os dados na Base de Dados
	st.execute(usuario.salvaUsuario());
	response.sendRedirect("sis_view_usuarios.jsp?msg=1");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>