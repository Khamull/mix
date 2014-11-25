<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<jsp:useBean id="pagar" class="financeiro.Pagar" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na Query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>

<%
//Recupera o Nivel do Usuário
String nivel = String.valueOf(session.getAttribute("nivel"));
%>

<%
//Variaveis que serão usadas para a Data
String diaInicio = "1";
String diaFim = "31";
String mes;
String ano;
String dataInicio;
String dataFim;


//Verifica se foi passado parametro de data e Trata a Data
if(request.getParameter("BUSCAR")!=null){
	mes = request.getParameter("mes");
	ano = request.getParameter("ano");
}else{
	mes = data.mesAtual();
	ano = data.anoAtual();
}

//Forma a Data para a Pesquisa
dataInicio = ano+"-"+mes+"-"+diaInicio;
dataFim = ano+"-"+mes+"-"+diaFim;


//Pesquisa as Contas a Pagar de Acordo com a Data Passada
rs = st.executeQuery(pagar.pesquisaConta(dataInicio, dataFim));

//Pesquisa quanto ainda falta pagar
rs01 = st01.executeQuery(pagar.totalPagar(dataInicio, dataFim));
%>

<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");
   
DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = pagar.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->

<script type="text/javascript">

function excluirPagar(pagarID){
	if(confirm("Tem certeza que deseja Excluir essa Conta?\nNao sera possivel recupera-la depois.")){
		window.location.href="sis_delete_manager_conta_pagar.jsp?pagarID="+pagarID;
	}
}

</script>


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
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_conta_pagar.jsp'" value="+ Nova Conta &agrave; Pagar" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_livro_caixa.jsp'" value="+ Novo Livro Caixa" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_livro_caixa.jsp'" value="Livros Caixa" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_conta_pagar_separada.jsp'" value="Contas a Pagar por Loja" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_financeiro.jsp'" value="Financeiro" />
 </td>
</tr>
<tr>
 <td valign="top">
 <br />
  <table width="960" align="center" cellpadding="0" cellspacing="0">
   <tr>
     <td colspan="9" height="15"></td>
   </tr>
   <tr>
    <td colspan="9" height="40" align="left" valign="middle">
        
     <form name="formBusca" method="post">
      <table width="960" align="center" cellpadding="2" cellspacing="2" style="border:2px solid #0033CC">
     <tr bgcolor="#EEEEEE">
       <td width="329" align="left"><strong>FAÇA UMA BUSCA POR MÊS E ANO</strong></td>
      <td width="59" align="left">Mês</td>
      <td width="169" align="left">
       <select name="mes" style="width:110px">
           <option value="1" selected="selected">JANEIRO</option>
           <option value="2">FEVEREIRO</option>
           <option value="3">MARÇO</option>
           <option value="4">ABRIL</option>
           <option value="5">MAIO</option>
           <option value="6">JUNHO</option>
           <option value="7">JULHO</option>
           <option value="8">AGOSTO</option>
           <option value="9">SETEMBRO</option>
           <option value="10">OUTUBRO</option>
           <option value="11">NOVEMBRO</option>
           <option value="12">DEZEMBRO</option>
      </select>
      </td>
      <td width="45" align="left">Ano</td>
      <td width="90" align="left">
       <select name="ano" style="width:60px">
       	   <option value="<%=Integer.parseInt(data.anoAtual())-2%>"><%=Integer.parseInt(data.anoAtual())-2%></option>
           <option value="<%=Integer.parseInt(data.anoAtual())-1%>"><%=Integer.parseInt(data.anoAtual())-1%></option>
           <option value="<%=data.anoAtual()%>" selected="selected"><%=data.anoAtual()%></option>
           <option value="<%=Integer.parseInt(data.anoAtual())+1%>"><%=Integer.parseInt(data.anoAtual())+1%></option>
           <option value="<%=Integer.parseInt(data.anoAtual())+2%>"><%=Integer.parseInt(data.anoAtual())+2%></option>
           <option value="<%=Integer.parseInt(data.anoAtual())+3%>"><%=Integer.parseInt(data.anoAtual())+3%></option>
           <option value="<%=Integer.parseInt(data.anoAtual())+4%>"><%=Integer.parseInt(data.anoAtual())+4%></option>
           <option value="<%=Integer.parseInt(data.anoAtual())+5%>"><%=Integer.parseInt(data.anoAtual())+5%></option>
      </select>
      </td>
      <td width="66" align="left"><input type="submit" name="BUSCAR" value="Buscar" /></td>
     </tr>
    </table>
     </form>
    
    </td>
   </tr>
   <tr>
    <td colspan="9" height="20"></td>
   </tr>
   <tr>
    <td colspan="9" align="center"><font size="4"><strong>CONTAS A PAGAR EM: <font color="#0033CC">- <%=data.retornaData(Integer.parseInt(mes)) %> - <%=ano %></font></strong></font></td>
   </tr>
   <%if(rs01.next()){ %>
   <%
   String faltaPagar = "0";
   
   faltaPagar = formato.format(rs01.getDouble("faltaPagar"));
   
   %>
   <tr>
    <td colspan="9" align="center">(TOTAL &Agrave; PAGAR DO M&Ecirc;S: <%=faltaPagar %>)</td>
   </tr>
   <%} %>
   <tr>
    <td colspan="9" height="20"></td>
   </tr>
   <tr bgcolor="#EEEEEE">
    <td width="100" align="left"><strong>N&deg; Conta</strong></td>
    <td width="280" align="left"><strong>Favorecido</strong></td>
    <td width="90" align="left"><strong>Valor</strong></td>
    <td width="60" align="center"><strong>Parcela</strong></td>
    <td width="150" align="center"><strong>Forma de Pagamento</strong></td>
    <td width="100" align="center"><strong>Vencimento</strong></td>
    <td width="60" align="center"><strong>Ed</strong></td>
    <td width="60" align="center">
    <%if(nivel.equals("1")){ %>
    	<strong>Ex</strong>
    <%}%>
    </td>
    <td width="60" align="center"><strong>Pagar</strong></td>
   </tr>
   <tr>
    <td colspan="9">
     <table width="960" align="center" cellpadding="0" cellspacing="0">  
      <tr>
       <td colspan="8" height="5"></td>
      </tr> 

   <%while (rs.next()){ %>
   
   <%
   //Trata Valores
   
   String devendo = "0";
   
   devendo = formato.format(rs.getDouble("valor"));
   
   %>
   
   <%
   //Trata Data
   String dataVencimento = data.converteDeData(rs.getString("vencimento"));
   %>
   
   <tr>
    <td height="30" width="100" align="left"><%=rs.getString("contapagarID") %></td>
    <td height="30" width="280" align="left"><%=rs.getString("favorecido") %></td>
    <td height="30" width="90" align="left"><%=devendo%></td>
    <td height="30" width="60" align="center"><%=rs.getString("parcela")%>/<%=rs.getString("de")%></td>
    <td height="30" width="150" align="center"><%=rs.getString("descricao")%></td>
    
    <%
    //Verifica se a Data ja venceu ou não
    String dataSimples = rs.getString("vencimento");
    String verifica = data.verificaDataVencimento(dataSimples);
    %>
    
    <%if(verifica == "igual"){ %>
    	<td height="30" width="100" align="center"><font color="#0000FF"><%=dataVencimento%></font> </td>
    <%}else if(verifica == "menor"){ %>
    	<td height="30" width="100" align="center" bgcolor="#FF0000"><font color="#FFFF00"><b><%=dataVencimento%></b></font> </td>
    <%}else{ %>
    	<td height="30" width="100" align="center"><%=dataVencimento%> </td>
    <%} %>
    <td height="30" width="60" align="center"><a href="sis_update_conta_pagar.jsp?pagarID=<%=rs.getString("pagarID")%>"><img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar"/></a></td>
    <td height="30" width="60" align="center">
    <%if(nivel.equals("1")){ %>
    <a href="javascript: excluirPagar(<%=rs.getString("pagarID")%>)"><img src="ico/ico_excluir.png" width="20" height="20" border="0" title="Editar"/></a>
    <%}%>
    </td>
    <td height="30" width="60" align="center"><a href="sis_insert_pagamento.jsp?pagarID=<%=rs.getString("pagarID")%>"><img src="ico/ico_money.png" width="20" height="20" border="0" title="Receber Essa Conta" /></a></td>
   </tr>
   <tr>
    <td colspan="9" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>
   <%} %>
   	
   </table>
   </td>
   </tr>
	
	<tr>
	 <td colspan="9" align="center"><font color="#ff0000"><%=msg %></font></td>
	</tr>
    <tr>
     <td colspan="9" align="center"></td>
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

</body>
</html>

<%
 //fecha a consulta
 //st.close();
 //rs.close();
%>