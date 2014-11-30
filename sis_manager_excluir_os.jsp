<%@page import="cadastro.Usuario" %>

<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
ResultSet rs = null;

servico.OS = request.getParameter("OS");
servico.anoServico = request.getParameter("ANO");
rs = st.executeQuery(servico.pesquisaServicoPorOS());
String servicosIDs = "";
while(rs.next())
{
	servicosIDs += rs.getString("servicoID")+",";
}
servicosIDs = servicosIDs.substring(0, servicosIDs.length()-1); 

st02.execute(servico.DeleteOS(servicosIDs));

response.sendRedirect("sis_view_servicos.jsp?msg=3");



%>