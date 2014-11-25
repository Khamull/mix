<%@page import="cadastro.Usuario" %>
<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar query
Statement st01 = con.createStatement();

String idUsu = (String) session.getAttribute("usuarioID");//recupera ID do usuário
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
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
		if(request.getParameter("BUSCAR") == null)	
		rs = st.executeQuery(servico.listaServicosPendentes());
	}
	else
	{
		if(request.getParameter("BUSCAR") == null)	
		rs = st.executeQuery(servico.listaServicosPendentesPorCamada((String) session.getAttribute("nivel")));
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

function confirma(servicoID, nivelUsuario){
	if(confirm("Deseja Confirmar a visualizaçao desse Serviço?")){
		window.location.href="sis_manager_confirmar_visualizacao.jsp?servicoID="+servicoID+"&nivelusuario="+nivelUsuario;
	}
}
function naoConfirmado(){
	alert("Primeiro Viasualize o Servico para Finalizar");
		//window.location.href="sis_manager_confirmar_visualizacao.jsp?servicoID="+servicoID;
	
}

function confirmaFinalizacao(servicoID, nivelUsuario){
	
	if(nivelUsuario == "3"){
		var caminho = document.getElementById("caminho");
	
		
			
			if(caminho.value == "")
			{
					alert("Preencha o Caminho da Arte Antes de Finalizar");
			}
			else
			{
				if(confirm("Deseja Confirmar a Finalizacao dessa Etapa?"))
				{
					//alert(caminho.value);
					window.location.href="sis_manager_confirmar_finalizacao.jsp?servicoID="+servicoID+"&nivelusuario="+nivelUsuario+"&caminho="+caminho.value;
				}
			}
		
	}
	 else 
	 {
		if(confirm("Deseja Confirmar a Finalizacao dessa Etapa?"))
		{
			window.location.href="sis_manager_confirmar_finalizacao.jsp?servicoID="+servicoID+"&nivelusuario="+nivelUsuario+"&caminho=";
        }
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

<div id="topo3">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_toldos.jsp'" value=" + Novo Toldo" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_servicos_fechados.jsp'" value="Servicos Fechados" />
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
  int nivelfinal = Integer.parseInt(nivel_);
  nivelfinal = nivelfinal+1;
  if(nivel_.equals("3")){%>
	  <tr>   
	    <td colspan="8" align="center"><strong>ORDENS DE SERVI&Ccedil;O PARA ARTE FINAL</strong></td>
	   </tr><% }%>
  <% if(nivel_.equals("4")){%>
	  <tr>   
	    <td colspan="8" align="center"><strong>ORDENS DE SERVI&Ccedil;O PARA IMPRESS&Atilde;O</strong></td>
	   </tr><% }%>
  <% if(nivel_.equals("5")){%>
	  <tr>   
	    <td colspan="8" align="center"><strong>ORDENS DE SERVI&Ccedil;O PARA ACABAMENTO</strong></td>
	   </tr><% }%> 
  <% if(nivel_.equals("6")){%>
	  <tr>   
	    <td colspan="8" align="center"><strong>ORDENS DE SERVI&Ccedil;O INSTALA&Ccedil;&Atilde;O</strong></td>
	   </tr><% }%>   
   <tr>
     <td colspan="8" height="15"></td>
   </tr>
   <tr>
    <td colspan="11" height="40" align="left" valign="middle">
    
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
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="BuscarOS" /></td>
      </tr>
     </table>
    </form>	
    </td>
   </tr>
<td colspan="11">
<table id="tb1" width="910" align="center" cellpadding="0" cellspacing="0">  
 <tr>
  <td colspan="11" height="5"></td>
 </tr> 
 <tr bgcolor="#EEEEEE">
    <td   align="left"><strong>N&deg; O.S.</strong></td>
    <td   align="left"><strong>Cliente</strong></td>
    <td  align="left"><strong>Data Inicio</strong></td>
    <td   align="left"><strong>Data Prevista</strong></td>
    <%if (nivel_.equals("1") || nivel_.equals("2")){%>
    	<td  align="left"><strong>Valor</strong></td>
       	<td  align="left"><strong>Ed</strong></td>
    <%} %>
    <td  align="left"><strong>Vs</strong></td>
    <td  align="center"><strong>Iniciar</strong></td>
    <td  align="center"><strong>Finalizar</strong></td>
    <% if (nivel_.equals("3") || nivel_.equals("4")){%>
    	<td  align="left"><strong>Arquivo</strong></td>
    <%} %>
    <%if(nivel_.equals("1") || nivel_.equals("2")) {%>
    <td  align="left">
    	<strong>Dpto</strong>
    </td>
    <% }%>
    <%if(nivel_.equals("6") || nivel_.equals("1")) {%>
    	<td>Data Fim</td>	
    <%}%>
    <td  align="left">
    
    </td>
    
   </tr>
<%
//Enquanto a Consulta retonar um resultada, Liste os Usuários do Sistema
while (rs.next()){
%>
   
   <tr>
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
    <td height="30"  align="left">
    <a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_visualizar.png" width="20" height="20" border="0" title="Visualizar Detalhes do Serviço" /> </a></td>    
    <td height="30"  align="center">
    <%if(rs.getString("visualizacao").equals("N")){ %>
    <a href="javascript: confirma(<%=rs.getString("servicoID")%>,<%=nivel_ %>)"><img src="ico/ico_cofirmar.gif" width="20" height="20" border="0" title="Clique aqui para confirmar a visualizaçao!"></a>
    <%}else{ %>
    <img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Ok, Visualizado!" >
    <%} %> 
    </td>
    <td height="30" align="center">
    <%if(rs.getString("finalizado").equals("N")){ %>
    	<%String visu = rs.getString("visualizacao");
    	if(visu.equals("S")){%>
    		<a href="javascript: confirmaFinalizacao(<%=rs.getString("servicoID")%>, <%=nivel_ %>)" ><img src="ico/ico_cofirmar.gif" width="20" height="20" border="0" title="Clique aqui para confirmar Finalizacao"></a>
    	<%} else { %>
    <a href="javascript: naoConfirmado()" ><img src="ico/ico_cofirmar.gif" width="20" height="20" border="0" title="Clique aqui para confirmar Finalizacao"></a>
    <%      }
    } else{ %>
    	<img src="ico/ico_joinha.png" width="20" height="20" border="0" title="Ok, Ordem de serviço finalizada!" >
    <%} %> 
    <% if (nivel_.equals("3")){%>
    <td height="30"  align="left"><input type="text" name="caminho" required id="caminho" style="width:120px"> </td>    	
    <%}else{%>
    	<%if(nivel_.equals("4")){%>
    		<td height="30"  align="left"><input type="text" name="caminho" value="<%=rs.getString("caminhoArte") %>" required id="caminho" style="width:120px"> </td> 
    	<% }%>
    <%}%>
    <%if(nivel_.equals("1") || nivel_.equals("2")) {
		String dep = rs.getString("nivelUsuario");
		String depart = "";
		switch(dep){
		case "3": depart = "Arte Final";
		break;
		case "4": depart = "Impressão";
		break;
		case "5": depart = "Acabamento";
		break;
		case "6": depart = "Instalação";
		break;
		default:
			depart = "Atendimento";
		}
		
    %>
    <td height="30"  align="left"><strong><%=depart %></strong></td>
    <%if(nivel_.equals("6") || nivel_.equals("1")) {%>
   		<td><input type="text" name="datafimR" value="<%=data.converteDeData(rs.getString("dataFim").substring(0,10)) %>" required></td>
   	<%} %>
   	<td height="30"  align="left"><a href="sis_print_cupom_servico_cliente.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_print.png" height="20" border="0" title="Imprimir O.S." /></a></td>
   	</tr>
   	<%} %>
    
   </tr>
   <tr>
    <td colspan="13" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
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
	  <!-- <div id="pageNav"></div> -->
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