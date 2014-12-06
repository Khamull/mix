<%@page import="cadastro.Usuario" %>

<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo Statement para ajudar query
Statement st01 = con.createStatement();
Statement st09 = con.createStatement();

String idUsu = (String) session.getAttribute("usuarioID");//recupera ID do usuário
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs09 = null;
%>


<%
int dias = 0;
servico.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
//Pesquisa todos os Serviços cadastrados no sistema ou por Cliente
if(request.getParameter("nome_") != null)
{
	String nome = request.getParameter("nome_");
	rs = st.executeQuery(servico.listaServicosPendentesPorNomeS(nome));
	
}
else
{
	if(request.getParameter("os_")  != null){
		String OS = request.getParameter("os_");
		String ano = OS.substring(OS.length()-4, OS.length());
		String ID = OS.substring(0, OS.length()-5);
		rs = st.executeQuery(servico.listaServicosPendentes_OS(ID,ano));
	}
}

	if(session.getAttribute("nivel").equals("1"))
	{
		if(request.getParameter("todos") != null)
		{
			rs = st.executeQuery(servico.listaServicosPendentesNovo());
		}
		else
		{
			if(request.getParameter("BUSCAR") == null && request.getParameter("todosOrcamentos") == null){	
			//rs = st.executeQuery(servico.listaServicosPendentes());
				rs = st.executeQuery(servico.listaServicosPendentesPorCamada((String) session.getAttribute("nivel")));
			}
			else
			{
				if(request.getParameter("todosOrcamentos") != null)
					rs = st.executeQuery(servico.listaOrcamentos((String) session.getAttribute("nivel")));
			}
		}
	}
	else
	{
		if(request.getParameter("todos") != null)
		{
			rs = st.executeQuery(servico.listaServicosPendentesNovo());
		}
		else{
			if(request.getParameter("BUSCAR") == null){
				if(!session.getAttribute("nivel").equals("7"))
				{	
					if(session.getAttribute("nivel").equals("8"))
					{
						rs = st.executeQuery(servico.listaServicosPendentesPorCamadaRotina2((String) session.getAttribute("nivel")));
					}
					else
					{
						rs = st.executeQuery(servico.listaServicosPendentesPorCamada((String) session.getAttribute("nivel")));
					}
				}
				else
				{
					rs = st.executeQuery(servico.listaOrcamentosPendentes((String) session.getAttribute("nivel")));
				}
			}
		}
		
	}


%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = servico.mensagem(numeroMsg);
}
%>


<%
//Converte para o Formato Data
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
}
</script>

<script type="text/javascript">

function confirma(servicoID, nivelUsuario, rotina){
	if(confirm("Deseja Confirmar a Início desse Serviço?")){
		window.location.href="sis_manager_confirmar_visualizacao.jsp?servicoID="+servicoID+"&nivelusuario="+nivelUsuario+"&rotina="+rotina;
	}
}

function naoConfirmado(){
	alert("Primeiro Viasualize o Servico para Encaminhar ou Finalizar");
		//window.location.href="sis_manager_confirmar_visualizacao.jsp?servicoID="+servicoID;
}

var fase = "";
function fase(passo)
{
	fase = passo;
}

//Encerra por fim a OS
function confirmaFinalizacao(servicoID, nivelUsuario, OS){
	
//		var caminho = document.getElementById("caminho");
	if(nivelUsuario == "7")
	{
		if(confirm("Encaminhar Nova OS?"))
		{
			window.open("sis_fecha_negocio.jsp?servicoID="+servicoID+"&nivelUsuario="+nivelUsuario+"&OS="+OS, "Nova OS", "width=480px, height=300px");
		}
	}
	else
	{
		if(confirm("Deseja Finalizar esta Etapa"))
		{
			//alert(caminho.value);
			window.location.href="sis_manager_confirmar_finalizacao.jsp?servicoID="+servicoID+"&nivelusuario="+nivelUsuario+"&fase="+fase;
		}
	}
}
	
	
//Verifica e Encaminha tarefa para o departamento selecionado	
function confirmaEncaminhamento(servicoID, nivelUsuario, obj){
	
	if(nivelUsuario == "3"){
			var caminho = document.getElementById("caminho");
			if(caminho.value == "")
			{
					alert("Preencha o Caminho da Arte Antes de Encaminhar Tarefa");
			}
			else
			{
				if(confirm("Deseja Realmente Encaminhar esta Tarefa?"))
				{
					//alert(caminho.value);
					window.location.href="sis_manager_encaminhar.jsp?servicoID="+servicoID+"&nivelusuario="+nivelUsuario+"&caminho="+caminho.value+"&dpto="+obj.value;
				}
			}
		
	}
	 else 
	 {
		if(confirm("Deseja Realmente Encaminhar esta Tarefa?"))
		{
			window.location.href="sis_manager_encaminhar.jsp?servicoID="+servicoID+"&nivelusuario="+nivelUsuario+"&caminho=&dpto="+obj.value;
        }
	}
}

function solicitaReagendamento(servicoID, OS, ano, nivelUsuario)
{
	if(confirm("Deseja Realmente Solicitar Reagendamento?"))
	{
		window.open("sis_solicita_reagendamento.jsp?servicoID="+servicoID+"&OS="+OS+"&ano="+ano+"&nivelUsuario="+nivelUsuario, "Reagendar", "width=480px, height=300px");
	}
}

function reagenda(servicoID, OS, ano, nivelUsuario)
{
	if(confirm("Reagendar?"))
	{
		window.open("sis_reagenda.jsp?servicoID="+servicoID+"&OS="+OS+"&ano="+ano+"&nivelUsuario="+nivelUsuario, "Reagendar", "width=480px, height=300px");
	}
}

function agenda(servicoID, OS, ano, nivelUsuario)
{
	if(confirm("Agendar?"))
	{
		window.open("sis_agenda.jsp?servicoID="+servicoID+"&OS="+OS+"&ano="+ano+"&nivelUsuario="+nivelUsuario, "Agendar", "width=480px, height=300px");
	}
}

function excluir(OS, ANO)
{
	if(confirm("Deseja Realmente escluir a OS: "+OS+"/"+ANO))
	{
		window.location.href = "sis_permitir_exclusao_os.jsp?OS="+OS+"&ANO="+ANO;
	}
}
</script>

<script type="text/javascript" src="js/jquery.js"></script>


<script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.pstrength-min.1.2.js"></script>
        <script>
        	$(document).ready(function(){
				$('.password').pstrength();
			});
        </script>

<script type="text/javascript" src="js/interface.js"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->

<link type="text/css" href="css/paging.css" rel="stylesheet" />	
<script type="text/javascript" src="js/paging.js"></script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25"  bgcolor="#EEEEEE">
 	<table>
 		<tr>
 			<%if(session.getAttribute("nivel").equals("2") || session.getAttribute("nivel").equals("1")){  %>
 			<td>
				 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_nova_os.jsp'" value=" + Nova OS" />&nbsp;
			</td>
			<td>	 
				 <input type="button" class="botao" onclick="javascript: window.location.href='sis_servicos_fechados.jsp'" value="OS's Fechados" />
			</td>
			<td>	 
				 <form name="formBuscaTodos" method="post">
				    <input type="checkbox" name="todos" onclick="this.form.submit();" value="buscarTodas"  />
				    <strong>Pesquisar Todas OS's Ativas</strong>
				  </form>
			</td>
			<td>	  
				  <form name="formBuscaTodosOrcamentos" method="post">
				    <input type="checkbox" name="todosOrcamentos" onclick="this.form.submit();" value="buscarTodasOrcamentos"  />
				    <strong>Pesquisar Todos Orçamentos</strong>
				  </form>
			</td>	  
			 <%} %>
			<%if(session.getAttribute("nivel").equals("7")){  %>
			<td>
				 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_novo_orcamento.jsp?orcamento=1'" value=" + Novo Orçamento" />&nbsp;
			</td>	 
			<%} %>
  		</tr>
  	</table>
 </td>
 <td>
 </td>
</tr>
<tr>
 <td height="25" align="center">&nbsp;</td>
</tr>
<tr>
 <td valign="top" align="center">
 <br />
 <table width="810" align="center" cellpadding="0" cellspacing="0">
  <% String nivel_ = (String) session.getAttribute("nivel");
  int nivel = Integer.parseInt(nivel_);
  int nivelfinal = nivel+1;
  switch(nivel){
  	case 3: 
  		out.println("<tr><td colspan=\"8\" align=\"center\"><strong>ORDENS DE SERVI&Ccedil;O PARA ARTE FINAL</strong></td></tr>");
	   	break; 
	case 4:
		out.println("<tr><td colspan=\"8\" align=\"center\"><strong>ORDENS DE SERVI&Ccedil;O PARA IMPRESS&Atilde;O</strong></td></tr>");
	  	break; 
	case 5:
		out.println("<tr><td colspan=\"8\" align=\"center\"><strong>ORDENS DE SERVI&Ccedil;O PARA ACABAMENTO</strong></td></tr>");
	   break;
	   case 6:
		   out.println("<tr><td colspan=\"8\" align=\"center\"><strong>ORDENS DE SERVI&Ccedil;O INSTALA&Ccedil;&Atilde;O</strong></td></tr>");
	   	   break;
	   case 7:
		   out.println("<tr><td colspan=\"8\" align=\"center\"><strong>ORDENS DE SERVI&Ccedil;O PARA OR&Ccedil;AMENTO</strong></td></tr>");
		   break;
	   case 8:
		   out.println("<tr><td colspan=\"8\" align=\"center\"><strong>ORDENS DE SERVI&Ccedil;O PARA PRODU&Ccedil;&Atilde;O</strong></td></tr>");
	   		break;
	   default:
		   out.println("<tr><td colspan=\"8\" align=\"center\"><strong>LISTA DE ORDENS DE SERVI&Ccedil;O EM ABERTO</strong></td></tr>");    
  }%>
     <tr>
     <td colspan="8" height="15"></td>
   </tr>
   <tr>
    <td colspan="20" height="40" align="left" valign="middle">
    <form name="formBuscaNome" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" name="nome_" maxlength="100" size="50" style="height:18px; border:none"  placeholder="Pesquisa por Nome Cliente"/>
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="BuscarNome" /></td>
      </tr>
     </table>
    </form>
     <form name="formBuscaOs" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" placeholder="Pesquisa por OS(Ex.. OS/Ano)"  name="os_" maxlength="100" size="50" style="height:18px; border:none" />
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="Buscar OS's" /></td>
      </tr>
     </table>
    </form>
    
    </td>
   </tr>
<td colspan="20">
<table id="tb1" width="1200" align="center" cellpadding="0" cellspacing="0">  
 <tr>
  <td colspan="20" height="5"></td>
 </tr> 
 <tr bgcolor="#EEEEEE">
 	<td></td>
    <td   align="left"><strong>N&deg; O.S.</strong></td>
    <td   align="left"><strong>Cliente</strong></td>
    <td  align="left"><strong>Data Inicio</strong></td>
    <td   align="left"><strong>Data Prevista</strong></td>
    <%if (nivel_.equals("1") || nivel_.equals("2")){%>
    	<td  align="left"><strong>Valor</strong></td>
       	<td  align="left"><strong>Ed</strong></td>
    <%} %>
    <td  align="left"><strong>Visualizar</strong></td>
    <%if(nivel_.equals("7")){%>
    <td  align="center"><strong>Negócio Fechado</strong></td>
   <% }else{%>
   	<td  align="center"><strong>Executado</strong></td>
   <%} %>
    <%if(nivel_.equals("1") || nivel_.equals("2")) {%>
    <td  align="left">
    	<strong>Dpto</strong>
    </td>
    	
    <% }%>
    <td><strong>Fase</strong></td>
     <%if(nivel_.equals("6") || nivel_.equals("1") || nivel_.equals("2")) {%>
     <td  align="left">
     
    	<strong>Data Agendada</strong>
    </td>		
    <%}%>
    
    <td></td>
   </tr>
<%
//Enquanto a Consulta retonar um resultada, Liste os Usuários do Sistema
while (rs.next()){
%>
   
   <tr>
    <td><%if (nivel_.equals("1") || nivel_.equals("2")){ %><img src="images/delete.png" width="15" height="15" title="Excluir OS: <%=rs.getString("OS")+"/"+rs.getString("anoServico").substring(0,4) %>" onclick="excluir(<%=rs.getString("OS")%>, <%=rs.getString("anoServico").substring(0,4)%>)"/><%} %></td>
    <td height="30"   align="left"><%=rs.getString("OS")+"/"+rs.getString("anoServico").substring(0,4) %></td>
    <td height="30"  align="left"><%=rs.getString("clienteNomeFantasia") %></td>
    <td height="30"  align="left"><%=data.converteDeData(rs.getString("dataInicio")) %></td>
    <td height="30"  align="left"><STRONG>
    <%if(!rs.getString("dataprevista1").equals("0")){%>
    	<%=data.converteDeData(rs.getString("dataprevista1")) %></strong></TD>
    <%}
    else
    {%>
    	</strong></TD>
    <%}%>
    <%if (nivel_.equals("1") || nivel_.equals("2")){%>
    <td height="30"  align="left"><%=formato.format(rs.getDouble("valor")) %></td>
    <td height="30"  align="left"><a href="sis_update_os.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar Serviço" /></a></td>
    <%} %>
    <td height="30"  align="center">
    <%if(nivel_.equals("7")){%>
    	<a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_visualizar.png" width="20" height="20" border="0" title="Detalhes" /></a>
    <%}else{
    	if(!nivel_.equals("8"))
    	{
	    	if(rs.getString("visualizacao").equals("N")){ %>
	    		<a href="javascript: confirma(<%=rs.getString("servicoID")%>,<%=nivel_ %>,<%=rs.getString("rotina")%>)"><img src="ico/ico_visualizar.png" width="20" height="20" border="0" title="Visualizar Detalhes do Serviço" /> </a>
	    	<%}else{ 
	    		rs09 = st09.executeQuery(servico.listaVisualizado(rs.getString("servicoID")));
	    		if(rs09.next()){%>
					<a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Visualizado por: <%=rs09.getString("usuarioNome")%>" /></a>
				<%}else{ %>
					<a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Visualizado por: " /></a>
				<%} %> 	
			<%}%>
	  <%}else{
		  if(!rs.getString("passo").equals("PRODUCAO")){
	    	if(rs.getString("visualizadoR2").equals("N")){ %>
    		<a href="javascript: confirma(<%=rs.getString("servicoID")%>,<%=nivel_ %>,<%="'"+rs.getString("rotina")+"-"+rs.getString("passo")+"'"%>)"><img src="ico/ico_visualizar.png" width="20" height="20" border="0" title="Visualizar Detalhes do Serviço" /> </a>
    		<%}else{ 
    			rs09 = st09.executeQuery(servico.listaVisualizado2(rs.getString("servicoID")));
	    		if(rs09.next()){%>
					<a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Visualizado por: <%=rs09.getString("usuarioNome")%>" /></a>
				<%}else{ %>
					<a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Visualizado por: " /></a>
				<%}
    		}
		  }
		  else
		  {
			  if(rs.getString("visualizacao").equals("N")){ %>
	    		<a href="javascript: confirma(<%=rs.getString("servicoID")%>, <%=nivel_ %>, '<%=rs.getString("rotina")%>-<%=rs.getString("passo")%>')"><img src="ico/ico_visualizar.png" width="20" height="20" border="0" title="Visualizar Detalhes do Serviço" onclick="javascript: confirma(<%=rs.getString("servicoID")%>, <%=nivel_ %>, <%=rs.getString("rotina")%>, <%=rs.getString("passo")%>)" /> </a>
	    	<%}else{ 
	    		rs09 = st09.executeQuery(servico.listaVisualizado(rs.getString("servicoID")));
	    		if(rs09.next()){%>
					<a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Visualizado por: <%=rs09.getString("usuarioNome")%>" /></a>
				<%}else{ %>
					<a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Visualizado por: " /></a>
				<%}  	
			}
		  }
	  }
	}%>	
    </td>
    <td height="30" align="center">
    <%if(rs.getString("finalizado").equals("N")){ %>
    	<%
    	String visu = rs.getString("visualizacao");
    	if(nivel_.equals("7"))
    	{
    		visu = "S";
    	}
    	if(rs.getString("visualizadoR2").equals("V") && nivel_.equals("8"))
    	{
    		visu = "S";
    	}
    	if(visu.equals("S")){%>
    		<a href="javascript: confirmaFinalizacao(<%=rs.getString("servicoID")%>, <%=nivel_ %>, <%=rs.getString("OS") %>)" onclick="fase(<%=rs.getString("passo")%>)"><img src="ico/ico_cofirmar.gif" width="20" height="20" border="0" title="Clique aqui para confirmar Finalizacao"/></a>
    	<%} else { %>
    		<a href="javascript: naoConfirmado()" ><img src="ico/ico_cofirmar.gif" width="20" height="20" border="0" title="Clique aqui para confirmar Finalizacao"></a>
    <% }
    }else{ %>
    	<img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Ok, Ordem de serviço finalizada!" >
    <%}%> 
   	
    <%if(nivel_.equals("1") || nivel_.equals("2")) {
		int dep = Integer.parseInt(rs.getString("nivelUsuario"));
		String depart = "";
		switch(dep){
		case 1: depart = "Gerencia";
		break;
		case 3: depart = "Arte Final";
		break;
		case 4: depart = "Impressão";
		break;
		case 5: depart = "Acabamento";
		break;
		case 6: depart = "Instalalação";
		break;
		case 8: depart = "Produção";
		break;
		default:
			depart = "Atendimento";
		}
		
    %>
    <td height="30"  align="left"><strong><%=depart %></strong></td>
	<%} %>
	<td><%if(rs.getString("passo").equals("REAGENDAMENTO")) {%>
		<a href="#" onclick="reagenda(<%=rs.getString("servicoID")%>, <%=rs.getString("OS")%>, <%=rs.getString("anoServico").substring(0,4) %>)" title="<%=rs.getString("observacao")%>"><%=rs.getString("passo") %></a>
	<%}else if(rs.getString("passo").equals("AGENDAMENTO")) {%>
		<a href="#" onclick="agenda(<%=rs.getString("servicoID")%>, <%=rs.getString("OS")%>, <%=rs.getString("anoServico").substring(0,4) %>)" title="<%=rs.getString("observacao")%>"><%=rs.getString("passo") %></a>
	<%}else if(rs.getString("passo").equals("ORÇAMENTO ACEITO")) {%>
		<a href="#" title="<%=rs.getString("obsOrcamento")%>"><%=rs.getString("passo") %></a>
	<%}else{ %>
		<a href="#" onclick=""><%=rs.getString("passo") %></a>
	<%} %>
	</td>
    <%if(nivel_.equals("1") || nivel_.equals("2")) {%>
   		<td>
   		<%if(!rs.getString("dataAgendamento1").equals("0")) {
   			int teste_ = Integer.parseInt(rs.getString("reagendado"));
   			if(!rs.getBoolean("reagendado")){%>
   				<%=data.converteDeData(rs.getString("dataAgendamento1")) %>
   			<%}else{%>
   			<font style="color: white; background-color: red;">
   				<%=data.converteDeData(rs.getString("dataAgendamento1")) %>
   			</font>	
   			<%} %>
		<%} %>   			
   		</td>
   		
   		<td height="30"  align="left"><a href="sis_print_cupom_servico_cliente.jsp?servicoID=<%=rs.getString("servicoID")%>&OS=<%=rs.getString("OS")%>&Ano=<%=rs.getString("anoServico").substring(0,4)%>"><img src="ico/ico_print.png" height="20" border="0" title="Imprimir O.S." /></a></td>
   	<%}
    else{%>
    	<td>
    	<%if(nivel_.equals("6") && !rs.getString("passo").equals("NOVO")){ %>
    		<%if(!rs.getString("dataAgendamento1").equals("0")) {%>
    			<%if(rs.getBoolean("reagendado")){%>
					<a href="#" onclick="solicitaReagendamento(<%=rs.getString("servicoID")%>, <%=rs.getString("OS")%>, <%=rs.getString("anoServico").substring(0,4) %>)" title="Solicitar Nova Data"><%=data.converteDeData(rs.getString("dataAgendamento1")) %></a>
				<%}else{ %>
						<a href="#" onclick="solicitaReagendamento(<%=rs.getString("servicoID")%>, <%=rs.getString("OS")%>, <%=rs.getString("anoServico").substring(0,4) %>)" title="Solicitar Nova Data" style="color: white; background-color: red;"><%=data.converteDeData(rs.getString("dataAgendamento1")) %></a>
				<%} %>
			<%}%>
		<%} %>
		</td>
   			<td height="30"  align="left"><a href="sis_print_cupom_servico_cliente.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_print.png" height="20" border="0" title="Imprimir O.S." /></a></td>
    <%}%>
   	
   	</tr>
   </tr>
   <tr>
    <td colspan="20" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>

<%
}
%>

   </table>
   </td>
   </tr>
	
	<tr>
	 <td colspan="8" align="center"><font color="#ff0000"><%=msg %></font></td>
	</tr>
    <tr>
     <td colspan="8" align="center">
      <!-- div onde será criados os links da paginaçao -->
      <%if(nivel_.equals("6"))
      {%>
	  	<div id="pageNav"></div>
      <%}%>
     </td>
    </tr>

  </table>
 
 </td>
</tr>
</table>



 
</div>


<div id="rodape"><jsp:include page="inc/rodape.jsp" /></div>

</div>

<script type="text/javascript">
	
	$(document).ready(
		function()
		{
			$('#dock').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 50,
					halign : 'center'
				}
			)
		}
	);

</script>


	<script>
        var pager = new Pager('tb1', 12); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNav'); 
        pager.showPage(1);
    </script>

</body>
</html>