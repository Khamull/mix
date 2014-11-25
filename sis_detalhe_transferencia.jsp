<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="transferencia" class="financeiro.Transferencias" scope="page"></jsp:useBean>

<jsp:useBean id="banco" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

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
//Recupera o ID da transferencia passado por parametro via URL e atribui ao objeto
if(request.getParameter("transferenciaID")!=null){
	transferencia.transferenciaID = Integer.parseInt(request.getParameter("transferenciaID"));
}

//Pesquisa Informações sobre a Transferencia
rs = st.executeQuery(transferencia.transferenciaPorID());
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
//Trata o Valor
String valor = formato.format(rs.getDouble("valor"));

//Trata a Data
String dataTransferencia = String.valueOf(rs.getDate("data"));
dataTransferencia = data.converteDeData(dataTransferencia);
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
 
 <table width="480" align="center" cellpadding="4" cellspacing="4" style="border:1px solid #333">
  <tr bgcolor="#EEEEEE">
   <td colspan="3" align="center"><strong>DETALHES DA TRANSFERENCIA</strong></td>
  </tr>
  <tr>
   <td width="117" align="right">N&deg; Transferencia:</td>
   <td colspan="2" align="left"><strong><%=rs.getString("transferenciaID")%></strong></td>
  </tr>
  <tr>
   <td align="right">Valor:</td>
   <td colspan="2" align="left"><strong><%=valor%></strong></td>
  </tr>
  
  <%
  //Pesquisa Banco Origem
  banco.livroID = rs.getInt("bancoDe");
  rs01 = st01.executeQuery(banco.bancoPorID());
  String bancoDe = "";
  String unidadeDe = "";
  if(rs01.next()){
	bancoDe = rs01.getString("banco");  
	unidadeDe = rs.getString("unidade"); 
  }
  %>
  
  <tr>
   <td align="right">Origem:</td>
   <td width="166" align="left"><font color="#FF0000"><strong>
   <%if(rs.getString("bancoDe").equals("1")){ %>
    <%=bancoDe %></strong></font> - <%=unidadeDe %>
   <%}else{ %>
   	<%=bancoDe%>
   <%} %>
   </strong></font>
   </td>
   <td width="155" align="left"><marquee direction="right">
     <font color="#FF0000"><img src="ico/bancoDe.png" border="0" /></font>
   </marquee></td>
  </tr>
  
  <%
  //Pesquisa Banco Destino
  banco.livroID = rs.getInt("bancoPara");
  rs02 = st02.executeQuery(banco.bancoPorID());
  String bancoPara = "";
  String unidadePara = "";
  if(rs02.next()){
	bancoPara = rs02.getString("banco");
	unidadePara = rs.getString("unidade");
  }
  %>
  
  <tr>
   <td align="right">Destino:</td>
   <td align="left"><font color="#009933"><strong>
   <%if(rs.getString("bancoPara").equals("1")){ %>
    <%=bancoPara%></strong></font> - <%=unidadePara %>
   <%}else{ %>
   	<%=bancoPara%>
   <%} %>
   </strong></font>
   </td>
   <td align="left"><marquee direction="left"> 
     <font color="#009933"><img src="ico/bancoPara.png" border="0" /></font>
   </marquee></td>
  </tr>
  <tr>
   <td align="right">Data:</td>
   <td colspan="2" align="left"><strong><%=dataTransferencia%></strong></td>
  </tr>
  <tr>
   <td align="right" valign="top">Observa&ccedil;&otilde;es:</td>
   <td colspan="2" align="left" valign="top"><font color="#333333"><em><%=rs.getString("observacoes")%></em></font></td>
  </tr>
  <tr>
   <td align="left" colspan="3"></td>
  </tr>
  <tr>
   <td colspan="3" align="center"><input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" /></td>
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