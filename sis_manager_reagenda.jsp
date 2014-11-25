<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="cadastro.Usuario" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<%
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
if(request.getParameter("reagenda").equals("1"))
{
//Recebe os dados para fazer a solicitação
	String data = request.getParameter("dataAgendamento");
	
	st01.execute(servico.reagendaNova(6, "INSTALACAO", Integer.parseInt(request.getParameter("servicoID")), data));
	String idusuario = (String) session.getAttribute("usuarioID");
	st02.execute(servico.atualizaHistoricoSolReagenda1("2", request.getParameter("servicoID"), idusuario, "INSTALACAO", data));//Matem Hustórico de todas as mudanças
	//response.sendRedirect("sis_view_servicos.jsp?msg=5");
}
if(request.getParameter("reagenda").equals("2"))
{
	String razao = request.getParameter("razao");
	st01.execute(servico.reagenda(2, "REAGENDAMENTO", Integer.parseInt(request.getParameter("servicoID")), razao));
	String idusuario = (String) session.getAttribute("usuarioID");
	st02.execute(servico.atualizaHistoricoSolReagenda("6", request.getParameter("servicoID"), idusuario, "REAGENDAMENTO", razao));//Matem Hustórico de todas as mudanças
}
if(request.getParameter("reagenda").equals("3"))
{
	String data = request.getParameter("dataAgendamento");
	st01.execute(servico.reagendaNova(6, "INSTALACAO", Integer.parseInt(request.getParameter("servicoID")), data));
	String idusuario = (String) session.getAttribute("usuarioID");
	st02.execute(servico.atualizaHistoricoSolReagenda1("2", request.getParameter("servicoID"), idusuario, "INSTALACAO", data));
}
%>
<script type="text/javascript">
 window.close();  
 window.opener.location.reload();
</script>


