<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>


<%
//verifica se foi passado parametro via URL e atribui ao ID do objeto cliente
if(request.getParameter("clienteID")!=null){
	receber.cliente.clienteID = Integer.parseInt(request.getParameter("clienteID"));
}
%>


<%
//Pesquisa todas a Contas à Receber relacionadas a esse cliente e que sejam do tipo Venda Vale
rs = st.executeQuery(receber.pesquisaContaCliente());
%>

<%
//Pesquisa quanto é o Total à Receber desse cliente no Venda Vale
rs01 = st01.executeQuery(receber.totalReceberVale());
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
	msg = receber.mensagem(numeroMsg);
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

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_clientes.jsp'" value="Lista Clientes" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 
 <table align="center" width="900">
 
 <%if(rs01.next()){ %>
 <%
 //Trata o valor
 String faltaPagar = formato.format(rs01.getDouble("faltaPagar"));
 %>
 
   <tr>
     <td colspan="8" align="left" valign="middle"><input type="button" onclick="javascript: window.open('sis_extrato_contas_pagas.jsp?clienteID=<%=request.getParameter("clienteID")%>', 'Lista' , 'height = 580 , width = 620');" value="Extrato Dividas Pagas" /></td>
   </tr>
   <tr>
     <td colspan="8" align="center" valign="middle"><strong><font color="#FF0000"><%=msg%></font></strong></td>
   </tr>
 
   <tr bgcolor="#99CC99">
    <td height="35" colspan="8" align="center" valign="middle"><strong>ATUALMENTE&nbsp; <font color="#0000FF"><%=rs01.getString("clienteNomeFantasia") %></font>&nbsp; EST&Aacute; DEVENDO:&nbsp; <font color="#0000FF"><%=faltaPagar %></font> </strong></td>
   </tr>
 <%} %>
   <tr bgcolor="#EEEEEE">
    <td width="100" align="left"><strong>N&deg; Venda</strong></td>
    <td width="280" align="left"><strong>Cliente</strong></td>
    <td width="90" align="left"><strong>Valor</strong></td>
    <td width="60" align="center"><strong>Parcela</strong></td>
    <td width="150" align="center"><strong>Forma de Pagamento</strong></td>
    <td width="100" align="center"><strong>Vencimento</strong></td>
    <td width="60" align="center"><strong>Dinheiro</strong></td>
    <td width="60" align="center"><strong>Cheque</strong></td>
   </tr>
   <tr>
    <td colspan="8">
     <table width="900" align="center" cellpadding="0" cellspacing="0">  
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
    <td height="30" width="100" align="left"><%=rs.getShort("vendaID") %></td>
    <td height="30" width="280" align="left">
    <%
    //Verifica se ele vendeu para um Cliente Cadastrado ou nao e trata a informaçao
    if(rs.getString("clienteNomeFantasia")==null){
    %>
    <font color="#666666">N&Atilde;O CADASTRADO</font>
    <%}else{ %>
    <%=rs.getString("clienteNomeFantasia") %>
    <%} %>
    </td>
    <td height="30" width="90" align="left"><%=devendo%></td>
    <td height="30" width="60" align="center"><%=rs.getString("parcela")%>/<%=rs.getString("de")%></td>
    <td height="30" width="150" align="center"><%=rs.getString("descricao")%></td>
    
    <%
    //Verifica se a Data ja venceu ou nao
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
    <td height="30" width="60" align="center"><a href="sis_insert_recebimento_vale.jsp?receberID=<%=rs.getString("receberID")%>"><img src="ico/ico_money.png" width="20" height="20" border="0" title="Receber Essa Conta com Dinheiro" /></a></td>
    <td height="30" width="60" align="center"><a href="sis_insert_recebimento_vale_cheque.jsp?receberID=<%=rs.getString("receberID")%>"><img src="ico/ico_cheque.png" width="20" height="20" border="0" title="Receber Essa Conta com um CHEQUE" /></a></td>
   </tr>
   <tr>
    <td colspan="8" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>
   <%} %>
  
 </table>
 
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

</body>
</html>