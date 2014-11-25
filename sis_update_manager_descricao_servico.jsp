<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera valores trazidos do Formulário de Servico
//Atrubui eles ao objeto servico
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
servico.descricao = request.getParameter("descricao");
%>

<%
//Atualiza a descrição do Servico no Banco de Dados
st.execute(servico.atualizaServico());
%>

<%
//Atualiza o status do Servico (Visualizado) para (Não-Visualizado)
st.execute(servico.naoVisualizado());
%>

<%
//Após feita as alterações redireciona para a página sis_view_servicos.jsp onde lista todos os servicos
response.sendRedirect("sis_update_os.jsp?servicoID="+servico.servicoID);
%>

<%
 //fecha a consulta
 st.close();
%>