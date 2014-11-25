<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera o Parametreo trazido via URL
if(request.getParameter("receberID")!=null){
	receber.receberID = Integer.parseInt(request.getParameter("receberID"));
}

//Pesquisa Informações sobre a Conta a Pagar
rs = st.executeQuery(receber.detalheReceberCheque());
%>


<%
//Usado para Formatar o Valor para Moeda
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

<%if(rs.next()){ %>

<%
//Trata os valores
String dataReceber = data.converteDeData(rs.getString("vencimento"));
String totalReceber = formato.format(rs.getDouble("valor"));
String valorParcela = formato.format(rs.getDouble("valor"));
String valorRecebido = formato.format(rs.getDouble("recebido"));
String desconto = "R$ 0,00";
String acrescimo = "R$ 0,00";
String observacao = "";
if(rs.getString("desconto")!=null){
	desconto = formato.format(rs.getDouble("desconto"));	
}
if(rs.getString("acrescimo")!=null){
	acrescimo = formato.format(rs.getDouble("acrescimo"));	
}
if(rs.getString("observacao")!=null){
	observacao = rs.getString("observacao");	
}
%>

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_livro_caixa.jsp'" value="Lista Bancos" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <table width="514" align="center" cellpadding="4" cellspacing="4" style="border:1px solid #333">
  <tr bgcolor="#EEEEEE">
   <td colspan="4" align="center"><strong>DETALHES DA CONTA &Agrave; RECEBER</strong></td>
  </tr>
  <tr>
   <td width="112" align="left" bgcolor="#F6F6F6">N&deg; Conta:</td>
   <td width="137" align="left"><%=rs.getString("receberID")%></td>
   <td width="90" align="left" bgcolor="#F6F6F6">Data:</td>
   <td width="155" align="left"><%=dataReceber%></td>
  </tr>
  <tr>
   <td align="left" bgcolor="#F6F6F6">Valor TOTAL:</td>
   <td align="left"><%=totalReceber%></td>
   <td align="left" bgcolor="#F6F6F6">Valor Parcela:</td>
   <td align="left"><%=valorParcela%></td>
  </tr>
  <tr>
   <td align="left" bgcolor="#F6F6F6">Valor Recebido:</td>
   <td align="left"><%=valorRecebido%></td>
   <td align="left" bgcolor="#F6F6F6">Parcela:</td>
   <td align="left"><%=rs.getString("parcela")%> / <%=rs.getString("de")%></td>
  </tr>
  <tr>
   <td align="left" bgcolor="#F6F6F6">Desconto:</td>
   <td align="left"><%=desconto%></td>
   <td align="left" bgcolor="#F6F6F6">Acr&eacute;scimo</td>
   <td align="left"><%=acrescimo%></td>
  </tr>
  <tr>
   <td align="left" bgcolor="#F6F6F6">Forma Pagamento:</td>
   <td colspan="3" align="left"><%=rs.getString("descricao")%></td>
   </tr>
  <tr>
   <td colspan="4" align="left" bgcolor="#F6F6F6">Observa&ccedil;&otilde;es do Recebimento</td>
   </tr>
  <tr>
    <td colspan="4" align="left"><%=rs.getString("observacao")%></td>
  </tr>
  <tr bgcolor="#EDEDED">
    <td colspan="4" align="center"><strong>DETALHES DO CHEQUE</strong></td>
  </tr>
  <tr>
    <td width="112" align="left" bgcolor="#F6F6F6">Cliente:</td>
    <td width="137" align="left"><%=rs.getString("clienteNomeFantasia")%></td>
    <td width="90" align="left" bgcolor="#F6F6F6">N&deg; Cheque:</td>
    <td width="155" align="left"><%=rs.getString("numeroCheque")%></td>
  </tr>
  <tr>
    <td align="left" bgcolor="#F6F6F6">Valor:</td>
    <td align="left"><%=totalReceber%></td>
    <td align="left" bgcolor="#F6F6F6">Vencimento:</td>
    <td align="left"><%=data.converteDeData(rs.getString("vencimento"))%></td>
  </tr>
  <tr>
    <td colspan="4" align="left" bgcolor="#F6F6F6">Observa&ccedil;&otilde;es do Cheque</td>
  </tr>
  <tr>
    <td colspan="4" align="left"><%=rs.getString("observacoes")%></td>
  </tr>
  <tr>
    <td colspan="4" align="center"><input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" /></td>
  </tr>
 </table>
 
 </td>
</tr>
</table>

<br />
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

<%} %>

</html>