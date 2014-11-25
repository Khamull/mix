<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formulário de Cadastro de Cargos
//Atrubui eles ao objeto cargo
cargo.titulo = request.getParameter("cargoTitulo");
cargo.descricao = request.getParameter("cargoDescricao");
%>

<%
//Verifica se já existe um cargo com esse Titulo
rs = st.executeQuery(cargo.verificaCargo());

if(rs.next()){
	//Caso exista um Cargo com esse Titulo, retorna para a Página de Cadastro
	response.sendRedirect("sis_insert_cargo.jsp?msg=4");
}else{
	//Senão: Executa a Função que irá salvar os dados na Base de Dados
	st.execute(cargo.salvarCargo());
	response.sendRedirect("sis_view_cargos.jsp?msg=1");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>