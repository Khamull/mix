<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
Statement st02 = con.createStatement();
Statement st01 = con.createStatement();
ResultSet rs = null;
%>

<%

//Atribui o ID do Serviço ao objeto servico
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));

String nivel_ = request.getParameter("nivelusuario");
//Insere novo nivel usuário na tabela servicos
int nivel = Integer.parseInt(request.getParameter("nivelusuario"))+1;
int dpto = Integer.parseInt(request.getParameter("dpto"));



if(Integer.parseInt(nivel_) == 3)
{
	st01.execute(servico.encaminhado(dpto,request.getParameter("caminho")));//Se Nivel usuário for igual a tres, insere o caminho do arquivo
}
else
{
	st01.execute(servico.encaminhado1(dpto));// caso contrario
}

String idusuario = (String) session.getAttribute("usuarioID");
st02.execute(servico.atualizaHistoricoStatusEncaminhado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario));//Matem Hustórico de todas as mudanças
%>

<%
//Após alterado direciona para a página de visualização de Serviços
response.sendRedirect("sis_view_servicos.jsp?msg=6");
%>

<%
 //fecha a consulta
 st01.close();
 st02.close();
%>