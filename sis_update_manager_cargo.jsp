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
cargo.cargoID = Integer.parseInt(request.getParameter("cargoID"));
cargo.titulo = request.getParameter("cargoTitulo");
cargo.descricao = request.getParameter("cargoDescricao");
%>

<%
//Verifica se já existe um cargo com esse Titulo
rs = st.executeQuery(cargo.verificaCargoAlterar());

if(rs.next()){
	//Caso exista um Cargo com esse Titulo, retorna para a Página de Cadastro
	response.sendRedirect("sis_update_cargo.jsp?msg=5&cargoID="+cargo.cargoID);
}else{
	//Senão: Executa a Função que irá Alterar os dados na Base de Dados
	st.execute(cargo.alteraCargo());
	response.sendRedirect("sis_view_cargos.jsp?msg=2");
}
%>


<%
 //fecha a consulta
 st.close();
%>