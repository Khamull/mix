<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Atribui o ID do Serviço ao objeto servico
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
String caminho  = request.getParameter("caminho");

//Altera data prevista
st.execute(servico.upCaminho(caminho));
%>

<%
//Após alterado direciona para a página de visualização de Serviços
response.sendRedirect("sis_update_os.jsp?servicoID="+request.getParameter("servicoID"));
%>

<%
 //fecha a consulta
 st.close();
%>