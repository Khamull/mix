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
	String razao = request.getParameter("razao");
	st01.execute(servico.encaminhaOrcamento(2, "ORCAMENTO ACEITO", Integer.parseInt(request.getParameter("servicoID")), razao));
	String idusuario = (String) session.getAttribute("usuarioID");
	st02.execute(servico.atualizaHistoricoSolReagenda("6", request.getParameter("servicoID"), idusuario, "ORCAMENTO ACEITO", razao));//Matem Hust�rico de todas as mudan�as
%>
<script type="text/javascript">
 window.close();  
 window.opener.location.reload();
</script>


