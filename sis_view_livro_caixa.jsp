<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="lancamentos" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Lista os Bancos cadastrados no Livro Caixa
rs = st.executeQuery(caixa.listaTodosBancos());
%>

<%
//Pesquisa o Total em todos os bancos
rs01 = st01.executeQuery(caixa.saldoTotalBancos());
%>

<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>


<%
//Trata Açoes
//variaveis que serao utilizadas para verificaçao
String acao = "";
int numeroAcao;
//verifica se passado alguma acao via URL
if(request.getParameter("acao") != null){
	caixa.livroID = Integer.parseInt(request.getParameter("livroID"));
	numeroAcao = Integer.parseInt(request.getParameter("acao"));
	st02.execute(caixa.statusBanco(numeroAcao));
	response.sendRedirect("sis_view_livro_caixa.jsp");
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
	msg = caixa.mensagem(numeroMsg);
}
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

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" src="js/interface.js"></script>

<script type="text/javascript" src="js/MascaraValidacao.js"></script> 

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->   

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}

</script>

</head>

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
  <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_livro_caixa.jsp'" value="+ Novo Banco" />&nbsp;
  <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_financeiro.jsp'" value="Financeiro" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <table align="center">
 	<tr>
    	<td colspan="6" align="center"><strong>LIVRO CAIXA - LISTA DE BANCOS</strong></td>
    </tr>
    <tr>
    	<td colspan="6" height="15"></td>
    </tr>
 	<tr bgcolor="#EEEEEE">
        <td width="250" align="left"><strong>Banco</strong></td>
        <td width="110" align="left"><strong>Saldo</strong></td>
        <td width="60" align="center"><strong>Ed</strong></td>
        <td width="60" align="center"><strong>At</strong></td>
        <td width="60" align="center"><strong>TR</strong></td>
        <td width="100" align="center"><strong>Livro Caixa</strong></td>
    </tr>
    
    <%while(rs.next()){%>
    
    <%
    String saldoBancario = "0";
    saldoBancario = formato.format(rs.getDouble("saldo"));
    %>
    
    <%!double totalPorLoja = 0; %>
    <%!String tpLoja = ""; %>
    	
        <%if(rs.getString("livroID").equals("1")){%>
    	
    	<%
        //Se o livro caixa for o Livro 1 então o total será somado apenas com as vendas e recebimentos relacionados
        //a empresa que está logada.
        
        //Atribui o ID da empresa, que está logada na sessão, ao objeto lancamento para realizar a pesquisa
        lancamentos.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
    	
    	//Atrobio o ID do livro caixa ao objeto lançamento
    	lancamentos.livro.livroID = rs.getInt("livroID");
        
        String dataInicio = rs.getString("dataInicio");
        String dataFim = data.converteParaData(data.dataAtual());
        
        rs02 = st02.executeQuery(lancamentos.listaRecebimentosPorEmpresa(dataInicio, dataFim));
        
        double totalEntrada = 0;
        double totalSaida = 0;


        while(rs02.next()){
        	
        	String tipoA = rs02.getString("tipo");
        	  if(tipoA.equals("R")){
        		  totalEntrada += rs02.getDouble("valor");
        	  }else if(tipoA.equals("P")){
        		  totalSaida += rs02.getDouble("valor");		  
        	  }else if(tipoA.equals("D")){
        		  totalEntrada += rs02.getDouble("valor");
        	  }else if(tipoA.equals("T")){
        		  totalSaida += rs02.getDouble("valor");
        	  }else if(tipoA.equals("S")){
        		  totalEntrada += rs02.getDouble("valor");
        	  }
        	
        }
        
        totalPorLoja = (totalEntrada-totalSaida);
        //Converte para o formato Moeda
        tpLoja = formato.format(totalPorLoja);
        %>
    
    	<%}%>
        
    <tr>
    	<td width="250" height="30" align="left"><%=rs.getString("banco")%></td>
        
        <%
		//Verifica o status se está ativo ou nao
		String status = rs.getString("status");
		
		if(status.equals("S")){
		%>	
         <%
		 //Verifica se o saldo está abaixo de zero
		 if(rs.getDouble("saldo")<0){
		 %>
        <td width="110" height="30" align="left"><font color="#FF0000"><%=saldoBancario %></font></td>
         <%}else{%>
          <%if(rs.getString("livroID").equals("1")){ %>
          <td width="110" height="30" align="left"><%=tpLoja%></td>
          <%}else{ %>
          <td width="110" height="30" align="left"><%=saldoBancario %></td>
          <%} %>
         <%}%>
        <%}else if(status.equals("N")){%>
        <td width="110" height="30" align="left"><font color="#999999">INATIVO</font></td>
        <%}%>
        
        <td width="60" height="30" align="center">
        <%if(rs.getInt("livroID")!=1){ %>
        <%if(status.equals("S")){%>
        <a href="sis_update_livro_caixa.jsp?livroID=<%=rs.getString("livroID")%>"><img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar <%=rs.getString("banco")%>" /></a>
        <%}%>
        <%} %>
        </td>
      
        
        <%if(rs.getInt("livroID")!=1){ %>
        
        <%
		//Verifica o status se está ativo ou nao
		if(status.equals("S")){
		%>
		<td height="30" width="60" align="center"><a href="sis_view_livro_caixa.jsp?acao=1&livroID=<%=rs.getString("livroID")%>"><img src="ico/ico_ativo.png" width="20" height="20" border="0" title="Desativar <%=rs.getString("banco")%>" /></a></td>
		<%}else if(status.equals("N")){%>
		<td height="30" width="60" align="center"><a href="sis_view_livro_caixa.jsp?acao=2&livroID=<%=rs.getString("livroID")%>"><img src="ico/ico_inativo.png" width="20" height="20" border="0" title="Ativar <%=rs.getString("banco")%>" /></a></td>
		<%}%>
		<%}else{ %>
		<td height="30" width="60"></td>
		<%} %>
        
        <td width="60" height="30" align="center"> 
		<%if(status.equals("S")){%>
        <a href="sis_traferencia.jsp?livroID=<%=rs.getString("livroID")%>"><img src="ico/ico_transferencia.png" width="20" height="20" title="Trasferencia Banc&aacute;ria" /></a>
        <%}%>
        </td>
        <td width="100" height="30" align="center">
        <%if(status.equals("S")){%>
        <a href="sis_resumo.jsp?livroID=<%=rs.getString("livroID")%>"><img src="ico/ico_livro_caixa.png" width="20" height="20" title="Ver Livro Caixa <%=rs.getString("banco")%>" /></a>
        <%}%>
        </td>
    </tr>
    <tr>
    	<td colspan="6" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
    </tr>
    <%} %>
    
    <%if(rs01.next()){%>
    <%
    String totalSaldo = "0";
    totalSaldo = formato.format(rs01.getDouble("total")+totalPorLoja);
    %>
    <tr>
    	<td colspan="6" align="left"><strong>TOTAL: <font color="#009900"><%=totalSaldo %></font></strong></td>
    </tr>
    <%} %>
    
    <%if(request.getParameter("msg") != null){ %>
  	<tr>
   		<td colspan="6" align="center"><font color="#ff0000"><%=msg %></font></td>
    </tr>
 	<%} %>
    
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

</body>

</html>