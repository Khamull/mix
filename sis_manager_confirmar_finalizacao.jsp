<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoProduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
ResultSet rs = null;
ResultSet rs03= null;
ResultSet rs04= null;


String nivel = request.getParameter("nivelusuario");
//String fase = request.getParameter("fase");
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
rs04 = st04.executeQuery(servico.pesquisaServico());
String fase = "";
if(rs04.next())
{
	fase = rs04.getString("passo"); 
}

//int nivel_novo = Integer.parseInt(request.getParameter("nivelusuario"))+1;//Gera próximo nível
//Pesquisa Rotina para o produto do Serviço
	servicoProduto.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
	
 	rs03 = st03.executeQuery(servicoProduto.RetornaRotina());
 	int rotina;
 	if(rs03.next())
 	{
 		rotina = rs03.getInt("rotinaID");
 		if(rotina == 0)
 		{
 			if(nivel.equals("2") || nivel.equals("1"))
 			{
 				if(fase.equals("FINALIZADO"))
 				{
 					if(rs04.getString("formPagID") != null &&  !rs04.getString("formPagID").equals("0")){
 						st01.execute(servico.finalizaOS(Integer.parseInt(nivel), "FINALIZADO"));	
 						String idusuario = (String) session.getAttribute("usuarioID");
 						st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "FINALIZADO"));
 					}
 					else
 					{
 						response.sendRedirect("sis_view_servicos.jsp?msg=11");
 						return;
 					}
 				}
 			}
 			if(nivel.equals("2") && fase.equals("ORCAMENTO ACEITO") || fase.equals("ORÇAMENTO"))//Da Artefinal para gerencia
 			{
 				st01.execute(servico.encaminhado1(3, "NOVO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "NOVO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("3") &&  fase.equals("NOVO"))//Da Gerencia para Impressão 
 			{
 				st01.execute(servico.encaminhado1(4, "IMPRESSAO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "IMPRESSAO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("4") && fase.equals("IMPRESSAO"))//Da Impressão para Acabamento
 			{
 				st01.execute(servico.encaminhado1(5, "ACABAMENTO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "ACABAMENTO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("5") && fase.equals("ACABAMENTO"))//Do Acabamento para Atendimento
 			{
 				st01.execute(servico.encaminhado1(2, "FINALIZADO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "FINALIZADO"));//Matem Hustórico de todas as mudanças
 			}
 		}
 		if(rotina == 1)
 		{
 			if(nivel.equals("2") || nivel.equals("1"))
 			{
 				if(fase.equals("FINALIZADO"))
 				{
 					if(rs04.getString("formPagID") != null &&  !rs04.getString("formPagID").equals("0")){
 						st01.execute(servico.finalizaOS(Integer.parseInt(nivel), "FINALIZADO"));	
 						String idusuario = (String) session.getAttribute("usuarioID");
 						st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "FINALIZADO"));
 					}
 					else
 					{
 						response.sendRedirect("sis_view_servicos.jsp?msg=11");
 						return;
 					}
 				}
 			}
 			if(nivel.equals("2") && fase.equals("ORCAMENTO ACEITO") || fase.equals("ORÇAMENTO"))//Da Artefinal para gerencia
 			{
 				st01.execute(servico.encaminhado1(3, "NOVO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "NOVO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("3") && !session.getAttribute("nivel").equals("8") && fase.equals("PRD/NOVO") || fase.equals("PRD/ARTE FINAL"))//Da Gerencia para Impressão 
 			{
 				st01.execute(servico.encaminhado1(4, "PRD/IMPRESSAO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "PRD/IMPRESSAO"));//Matem Hustórico de todas as mudanças
 			}
 			
 			if(nivel.equals("3") && !session.getAttribute("nivel").equals("8") && fase.equals("NOVO") || fase.equals("ARTE FINALISTA"))//Da Gerencia para Impressão 
 			{
 				st01.execute(servico.encaminhado1(4, "IMPRESSAO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "IMPRESSAO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("4") && fase.equals("PRD/IMPRESSAO"))//Da Impressão para Acabamento
 			{
 				st01.execute(servico.encaminhado1(5, "PRD/ACABAMENTO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "PRD/ACABAMENTO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("4") && fase.equals("IMPRESSAO"))//Da Impressão para Acabamento
 			{
 				st01.execute(servico.encaminhado1(5, "ACABAMENTO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "ACABAMENTO"));//Matem Hustórico de todas as mudanças
 			}
 			
 			if(nivel.equals("5") && fase.equals("PRD/ACABAMENTO"))//Do Acabamento para Produção
 			{
 				st01.execute(servico.encaminhado1(8, "PRODUCAO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "PRODUCAO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("5") && fase.equals("ACABAMENTO"))//Do Acabamento para Produção
 			{
 				st01.execute(servico.encaminhado1(8, "PRODUCAO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "PRODUCAO"));//Matem Hustórico de todas as mudanças
 			}
 			if(session.getAttribute("nivel").equals("8") &&  !fase.equals("PRODUCAO"))//Caso Nivel 8 Finalize antes dos outros niveis
 			{
 				
 				String fase_atual = "";
 				if(rs04.getString("nivelUsuario").equals("3") && fase.equals("PRD/NOVO")){
 					fase_atual = "ARTE FINALISTA";
 				}
 				if(rs04.getString("nivelUsuario").equals("4") && fase.equals("PRD/IMPRESSAO")){
 					fase_atual = "IMPRESSAO";
 				}
 				if(rs04.getString("nivelUsuario").equals("5") && fase.equals("PRD/ACABAMENTO")){
 					fase_atual = "ACABAMENTO";
 				}
 				if(rs04.getString("nivelUsuario").equals("6") && fase.equals("PRD/INSTALACAO")){
 					fase_atual = "INSTALACAO";
 				}	
 				
 				st01.execute(servico.encaminhado1(Integer.parseInt(rs04.getString("nivelUsuario")), fase_atual, Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, fase_atual));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("8") && fase.equals("PRODUCAO"))//Da produção para ser agendados
 			{
 				st01.execute(servico.encaminhado1(2, "AGENDAMENTO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "AGENDAMENTO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("2") && fase.equals("AGENDAMENTO"))//Do Agenamento para Instação
 			{
 				st01.execute(servico.encaminhado1(6, "INSTALACAO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "INSTALACAO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("6") && !fase.equals("NOVO") && !fase.equals("REAGENDAMENTO"))//Da Instalação para Finalização
 			{
 				st01.execute(servico.encaminhado1(2, "FINALIZADO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "FINALIZADO"));//Matem Hustórico de todas as mudanças
 			}
 		}
 		if(rotina == 2)
 		{
 			if(nivel.equals("2") || nivel.equals("1"))
 			{
 				if(fase.equals("FINALIZADO"))
 				{
 					if(rs04.getString("formPagID") != null &&  !rs04.getString("formPagID").equals("0")){
 						st01.execute(servico.finalizaOS(Integer.parseInt(nivel), "FINALIZADO"));	
 						String idusuario = (String) session.getAttribute("usuarioID");
 						st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "FINALIZADO"));
 					}
 					else
 					{
 						response.sendRedirect("sis_view_servicos.jsp?msg=11");
 						return;
 					}
 				}
 			}
 			if(nivel.equals("2") && fase.equals("ORCAMENTO ACEITO") || fase.equals("ORÇAMENTO"))//Do Orçamento aceito para Produção
 			{
 				st01.execute(servico.encaminhado1(6, "NOVO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "NOVO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("2") && fase.equals("NOVO") || fase.equals("ARTE FINAL"))//Do Atendimento para Produção
 			{
 				st01.execute(servico.encaminhado1(8, "PRODUCAO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "PRODUCAO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("8") && fase.equals("NOVO") || fase.equals("PRODUCAO"))//Da produção para ser agendados
 			{
 				st01.execute(servico.encaminhado1(2, "AGENDAMENTO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "AGENDAMENTO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("2") && fase.equals("AGENDAMENTO"))//Do Agenamento para Instação
 			{
 				st01.execute(servico.encaminhado1(6, "INSTALACAO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "INSTALACAO"));//Matem Hustórico de todas as mudanças
 			}
 			if(nivel.equals("6") && !fase.equals("NOVO") && !fase.equals("REAGENDAMENTO"))//Da Instalação para Finalização
 			{
 				st01.execute(servico.encaminhado1(2, "FINALIZADO", Integer.parseInt(request.getParameter("servicoID"))));
 				String idusuario = (String) session.getAttribute("usuarioID");
 				st02.execute(servico.atualizaHistoricoStatusFinalizado(request.getParameter("nivelusuario"), request.getParameter("servicoID"), idusuario, "FINALIZADO"));//Matem Hustórico de todas as mudanças
 			}
 		}
 	}
 	



//Atribui o ID do Serviço ao objeto servico
//servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));


//Insere novo nivel usuário na tabela servicos




//st01.execute(servico.finalizaOS(Integer.parseInt(nivel)));//se o nivel for 6, finaliza a OS



%>

<%
//Após alterado direciona para a página de visualização de Serviços
response.sendRedirect("sis_view_servicos.jsp?msg=5");
%>

<%
 //fecha a consulta
 st01.close();
 st02.close();
%>