<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="pagar" class="financeiro.Pagar" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera o Parametreo trazido via URL
if(request.getParameter("pagarID")!=null){
	pagar.pagarID = Integer.parseInt(request.getParameter("pagarID"));
}

//Pesquisa Informações sobre a Conta a Pagar
rs = st.executeQuery(pagar.detalhePagamento());
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

<%if(rs.next()){%>

<%
//Trata os Valores

String dataPagar = data.converteDeData(String.valueOf(rs.getDate("data")));
String dataVencimento = data.converteDeData(rs.getString("vencimento"));
String total = formato.format(rs.getDouble("total"));
String valorParcela = formato.format(rs.getDouble("valor"));
String valorPago = formato.format(rs.getDouble("pago"));
String desconto = formato.format(rs.getDouble("desconto"));
String acrescimo = formato.format(rs.getDouble("acrescimo"));

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
   <td colspan="4" align="center"><strong>DETALHES DA CONTA A PAGAR</strong></td>
  </tr>
  <tr>
    <td bgcolor="#F6F6F6">N&deg; da Conta:</td>
    <td><strong><%=rs.getString("contapagarID")%></strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="108" bgcolor="#F6F6F6">Vencimento</td>
    <td width="129"><strong><%=dataVencimento%></strong></td>
    <td width="100" bgcolor="#F6F6F6">Pagamento:</td>
    <td width="123"><strong><%=dataPagar%></strong></td>
  </tr>
  <tr>
    <td bgcolor="#F6F6F6">Valor TOTAL:</td>
    <td><strong><%=total%></strong></td>
    <td bgcolor="#F6F6F6">Valor da Parcela:</td>
    <td><strong><%=valorParcela%></strong></td>
  </tr>
  <tr>
   <td bgcolor="#F6F6F6">Valor pago:</td>
   <td><strong><%=valorPago%></strong></td>
   <td bgcolor="#F6F6F6">Parcela:</td>
   <td><strong><%=rs.getString("parcela")%></strong> / <strong><%=rs.getString("de")%></strong></td>
  </tr>
  <tr>
   <td bgcolor="#F6F6F6">Desconto:</td>
   <td><strong><%=desconto %></strong></td>
   <td bgcolor="#F6F6F6">Acr&eacute;scimo:</td>
   <td><strong><%=acrescimo%></strong></td>
  </tr>
  <tr>
   <td bgcolor="#F6F6F6">Forma Pagamento:</td>
   <td colspan="3"><strong><%=rs.getString("descricao")%></strong></td>
   </tr>
  <tr>
   <td bgcolor="#F6F6F6">Favorecido:</td>
   <td colspan="3"><strong><%=rs.getString("favorecido")%></strong></td>
   </tr>
  <tr bgcolor="#F6F6F6">
   <td colspan="4">Observa&ccedil;&otilde;es:</td>
  </tr>
  <tr>
   <td colspan="4"><strong><%=rs.getString("observacao")%></strong></td>
  </tr>
  <tr>
   <td colspan="4" align="center"><input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" /></td>
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

<%} %>

</html>