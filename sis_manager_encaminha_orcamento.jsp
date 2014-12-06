<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="cadastro.Usuario" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<%
String nivel = (String) session.getAttribute("nivel"); 
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
	String razao = request.getParameter("razao");
	st01.execute(servico.encaminhaOrcamento(2, "ORÇAMENTO ACEITO", request.getParameter("OS"), razao));
	String idusuario = (String) session.getAttribute("usuarioID");
	st02.execute(servico.atualizaHistoricoSolReagenda(nivel, request.getParameter("servicoID"), idusuario, "ORÇAMENTO ACEITO", razao));//Matem Hustórico de todas as mudanças
%>
<script type="text/javascript">
 window.close();  
 window.opener.location.reload();
</script>


