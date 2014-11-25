<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Variaveis que serão usadas para a Data
String diaInicio = "1";
String diaFim = "31";
String mes;
String ano;
String dataInicio;
String dataFim;


//Atribui o valor de empresaID salvo na sessão ao objeto venda
venda.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));


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


//Pesquisa as Vendas Fechadas
rs = st.executeQuery(venda.vendasFechadas(dataInicio, dataFim));
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

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE"></td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 
 <table>
  <tr>
   <td colspan="8">
   
   <form name="formBusca" method="post">
      <table width="900" align="center" cellpadding="2" cellspacing="2" style="border:2px solid #0033CC">
     <tr bgcolor="#EEEEEE">
       <td width="329" align="left"><strong>FAÇA UMA BUSCA POR MES E ANO</strong></td>
      <td width="59" align="left">Mes</td>
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
   <td height="35" colspan="8" align="center" valign="middle"><font size="4"><strong>VENDAS FECHADAS EM: <font color="#0033CC">- <%=data.retornaData(Integer.parseInt(mes)) %> - <%=ano %></font></strong></font>
   </td>
  </tr>
  <tr bgcolor="#EEEEEE">
   <td width="92" align="left"><strong>N&deg; Venda</strong></td>
   <td width="253" align="left"><strong>Cliente</strong></td>
   <td width="103" align="left"><strong>Valor</strong></td>
   <td width="169" align="left"><strong>Forma Pagamento</strong></td>
   <td width="72" align="left"><strong>Vezes</strong></td>
   <td width="81" align="left"><strong>Hor&aacute;rio</strong></td>
   <td width="79" align="left"><strong>Data</strong></td>
   <td width="36" align="center">&nbsp;</td>
  </tr>
  
  <%while (rs.next()) {%>
  
  <%
  //Trata Valor
  String valor = formato.format(rs.getDouble("valor"));
  
  //Trata a Data
  String dataVenda = data.converteDeData(String.valueOf(rs.getDate("data")));
  %>
  
   <tr>
   <td width="92" height="30" align="left" valign="middle"><%=rs.getString("vendaID")%></td>
   <td width="253" height="30" align="left" valign="middle">
    <%
	//Verifica se ele vendeu para um Cliente Cadastrado ou nao e trata a informaçao
    if(rs.getString("clienteNomeFantasia")==null){
    %>
    <font color="#666666">N&Atilde;O CADASTRADO</font>
    <%}else{ %>
    <font color="#000099"><%=rs.getString("clienteNomeFantasia") %></font>
    <%} %>
   </td>
   <td width="103" height="30" align="left" valign="middle"><%=valor%></td>
   <td width="169" height="30" align="left" valign="middle"><%=rs.getString("descricao")%></td>
   <td width="72" align="left" valign="middle"><%if(rs.getString("vezes").equals("1")){%>
&Aacute; Vista
   <%}else{%>
  <%=rs.getString("vezes")%> x
  <%}%></td>
   <td width="81" height="30" align="left" valign="middle"><%=rs.getTime("data") %></td>
   <td width="79" height="30" align="left" valign="middle"><%=dataVenda%></td>
   <td width="36" height="30" align="center" valign="middle"><a href="sis_print_venda_fechado.jsp?vendaID=<%=rs.getString("vendaID")%>" title="Imprimir Cupom"><img src="ico/ico_print.png" width="20" height="20" border="0" /></a></td>
  </tr>
  <tr>
   <td colspan="8" align="center" height="5"><hr style="border:1px solid #333333" /></td>
  </tr>
  <%}%>
  
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