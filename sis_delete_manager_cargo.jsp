<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>

<%
//Recupera o ID do cargo que irá ser excluido e adiciona ao Objeto
cargo.cargoID = Integer.parseInt(request.getParameter("cargoID"));

//chama o Metodo que irá excluir esse cargo
st.execute(cargo.excluiCargo());

//direciona para a página que lista os cargos
response.sendRedirect("sis_view_cargos.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>