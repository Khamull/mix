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


String rotina [] = request.getParameter("rotina").split("-"); 

if(rotina[0].equals("0") || rotina[0].equals("2") && !request.getParameter("nivelusuario").equals("8"))
{
//Altera o valor de Não visualizado para Visualizado
	st01.execute(servico.visualizado());
	String idusuario = (String) session.getAttribute("usuarioID");
	st02.execute(servico.atualizaHistoricoStatusVisualizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario));
}
else
{
	if(request.getParameter("nivelusuario").equals("8") && !rotina[1].equals("PRODUCAO")){
		st01.execute(servico.visualizado2());
		String idusuario = (String) session.getAttribute("usuarioID");
		st02.execute(servico.atualizaHistoricoStatusVisualizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario));
	}
	else
	{
		st01.execute(servico.visualizado());
		String idusuario = (String) session.getAttribute("usuarioID");
		st02.execute(servico.atualizaHistoricoStatusVisualizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario));
	}
}

%>

<%
//Após alterado direciona para a página de visualização de Serviços
response.sendRedirect("sis_detalhe_servico.jsp?servicoID="+request.getParameter("servicoID"));
%>

<%
 //fecha a consulta
 st01.close();
 st02.close();
%>