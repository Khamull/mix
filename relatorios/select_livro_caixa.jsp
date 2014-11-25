<%@ page errorPage="../index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="datas" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="livro" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

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
//Pesquisa todos os Bancos
rs01 = st01.executeQuery(livro.listaBancos());
%>


<%
//Pesquisa todas as Unidade Ativas no Sistema
rs02 = st02.executeQuery(empresa.listaEmpresas());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
}

function abreRelatorio(diaA, mesA, anoA, diaB, mesB, anoB, livro, empresa){
	window.open('rep_livro_caixa.jsp?diaA='+diaA+'&mesA='+mesA+'&anoA='+anoA+'&diaB='+diaB+'&mesB='+mesB+'&anoB='+anoB+'&livroID='+livro+'&empresaID='+empresa, 'Retiradas', 'width = 800; height = 600; scrollbars=yes')
}

</script>

<script type="text/javascript" src="../js/jquery.js"></script>


<script type="text/javascript" src="../js/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.pstrength-min.1.2.js"></script>
        <script>
        	$(document).ready(function(){
				$('.password').pstrength();
			});
        </script>

<script type="text/javascript" src="../js/interface.js"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->   

<link href="../css/menu.css" rel="stylesheet" type="text/css" />
<link href="../css/geral.css" rel="stylesheet" type="text/css" />

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
 <input type="button" onclick="javascript: window.location.href='../sis_view_relatorios.jsp'" class="botao" value="&lt;&lt; Voltar" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
<form name="form1" method="post">
 <table align="center" width="759">
  <tr bgcolor="#EEEEEE">
   <td height="35" colspan="9" align="center"><strong>PESQUISE O RESUMO DE CADA LIVRO CAIXA DENTRO DE UM PERIODO</strong></td>
  </tr>
  <tr>
    <td align="left">BANCO</td>
    <td colspan="2" align="left">
    <select name="livroID" style="width:165px">
     <%while(rs01.next()){ %>
      <option value="<%=rs01.getString("livroID") %>"><%=rs01.getString("banco") %></option>
     <%} %>
    </select>
    </td>
    <td align="left">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="left">UNIDADE</td>
    <td colspan="2" align="left">
    <select name="empresaID" style="width:174px">
     <option value="0">Todas as Unidades</option>
     <%while(rs02.next()){ %>
      <option value="<%=rs02.getString("empresaID") %>"><%=rs02.getString("unidade") %></option>
     <%} %>
    </select>
    </td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
   <td width="65" align="left">PER&Iacute;ODO</td>
   <td width="50" align="left">
   <select name="diaA" style="width:50px">
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      <option value="06">06</option>
      <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
      <option value="24">24</option>
      <option value="25">25</option>
      <option value="26">26</option>
      <option value="27">27</option>
      <option value="28">28</option>
      <option value="29">29</option>
      <option value="30">30</option>  
      <option value="31">31</option>                
   </select>
   </td>
   <td width="110" align="left">
   <select name="mesA" style="width:110px">
       <option value="01" selected="selected">JANEIRO</option>
       <option value="02">FEVEREIRO</option>
       <option value="03">MARÇO</option>
       <option value="04">ABRIL</option>
       <option value="05">MAIO</option>
       <option value="06">JUNHO</option>
       <option value="07">JULHO</option>
       <option value="08">AGOSTO</option>
       <option value="09">SETEMBRO</option>
       <option value="10">OUTUBRO</option>
       <option value="11">NOVEMBRO</option>
       <option value="12">DEZEMBRO</option>
   </select>
   </td>
   <td width="60" align="left">
   <select name="anoA" style="width:60px">
    <option value="<%=datas.anoAtual() %>" selected="selected"><%=datas.anoAtual() %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-1 %>"><%=Integer.parseInt(datas.anoAtual())-1 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-2 %>"><%=Integer.parseInt(datas.anoAtual())-2 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-3 %>"><%=Integer.parseInt(datas.anoAtual())-3 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-4 %>"><%=Integer.parseInt(datas.anoAtual())-4 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-5 %>"><%=Integer.parseInt(datas.anoAtual())-5 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-6 %>"><%=Integer.parseInt(datas.anoAtual())-6 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-7 %>"><%=Integer.parseInt(datas.anoAtual())-7 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-8 %>"><%=Integer.parseInt(datas.anoAtual())-8 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-9 %>"><%=Integer.parseInt(datas.anoAtual())-9 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-10 %>"><%=Integer.parseInt(datas.anoAtual())-10 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-11 %>"><%=Integer.parseInt(datas.anoAtual())-11 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-12 %>"><%=Integer.parseInt(datas.anoAtual())-12 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-13 %>"><%=Integer.parseInt(datas.anoAtual())-13 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-14 %>"><%=Integer.parseInt(datas.anoAtual())-14 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-15 %>"><%=Integer.parseInt(datas.anoAtual())-15 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-16 %>"><%=Integer.parseInt(datas.anoAtual())-16 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-17 %>"><%=Integer.parseInt(datas.anoAtual())-17 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-18 %>"><%=Integer.parseInt(datas.anoAtual())-18 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-19 %>"><%=Integer.parseInt(datas.anoAtual())-19 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-20 %>"><%=Integer.parseInt(datas.anoAtual())-20 %></option>
   </select>
   </td>
   <td width="67" align="center">&Agrave;</td>
   <td width="50" align="left">
   <select name="diaB" style="width:50px">
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      <option value="06">06</option>
      <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
      <option value="24">24</option>
      <option value="25">25</option>
      <option value="26">26</option>
      <option value="27">27</option>
      <option value="28">28</option>
      <option value="29">29</option>
      <option value="30">30</option>  
      <option value="31" selected="selected">31</option>                
   </select>
   </td>
   <td width="110" align="left">
   <select name="mesB" style="width:110px">
       <option value="01">JANEIRO</option>
       <option value="02">FEVEREIRO</option>
       <option value="03">MARÇO</option>
       <option value="04">ABRIL</option>
       <option value="05">MAIO</option>
       <option value="06">JUNHO</option>
       <option value="07">JULHO</option>
       <option value="08">AGOSTO</option>
       <option value="09">SETEMBRO</option>
       <option value="10">OUTUBRO</option>
       <option value="11">NOVEMBRO</option>
       <option value="12" selected="selected">DEZEMBRO</option>
   </select>
   </td>
   <td width="105" align="left">
   <select name="anoB" style="width:60px">
    <option value="<%=datas.anoAtual() %>" selected="selected"><%=datas.anoAtual() %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-1 %>"><%=Integer.parseInt(datas.anoAtual())-1 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-2 %>"><%=Integer.parseInt(datas.anoAtual())-2 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-3 %>"><%=Integer.parseInt(datas.anoAtual())-3 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-4 %>"><%=Integer.parseInt(datas.anoAtual())-4 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-5 %>"><%=Integer.parseInt(datas.anoAtual())-5 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-6 %>"><%=Integer.parseInt(datas.anoAtual())-6 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-7 %>"><%=Integer.parseInt(datas.anoAtual())-7 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-8 %>"><%=Integer.parseInt(datas.anoAtual())-8 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-9 %>"><%=Integer.parseInt(datas.anoAtual())-9 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-10 %>"><%=Integer.parseInt(datas.anoAtual())-10 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-11 %>"><%=Integer.parseInt(datas.anoAtual())-11 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-12 %>"><%=Integer.parseInt(datas.anoAtual())-12 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-13 %>"><%=Integer.parseInt(datas.anoAtual())-13 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-14 %>"><%=Integer.parseInt(datas.anoAtual())-14 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-15 %>"><%=Integer.parseInt(datas.anoAtual())-15 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-16 %>"><%=Integer.parseInt(datas.anoAtual())-16 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-17 %>"><%=Integer.parseInt(datas.anoAtual())-17 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-18 %>"><%=Integer.parseInt(datas.anoAtual())-18 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-19 %>"><%=Integer.parseInt(datas.anoAtual())-19 %></option>
    <option value="<%=Integer.parseInt(datas.anoAtual())-20 %>"><%=Integer.parseInt(datas.anoAtual())-20 %></option>
   </select>
   </td>
   <td width="102" align="left"><input name="PESQUISAR" type="submit" class="botao" value="Pesquisar" /> 
   <%//=dataInicio%> <%//=dataFim%>
   </td>
  </tr>
 </table>
 </form>
 
 </td>
</tr>
</table>
</div>


<div id="rodape"><jsp:include page="../inc/rodape.jsp" /></div>

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

<%
//Verifca se foi feito uma busca e abre o relatorio
if(request.getParameter("PESQUISAR")!=null){
%>
 <script type="text/javascript">
  abreRelatorio('<%=request.getParameter("diaA")%>', '<%=request.getParameter("mesA")%>', '<%=request.getParameter("anoA")%>', '<%=request.getParameter("diaB")%>', '<%=request.getParameter("mesB")%>', '<%=request.getParameter("anoB")%>', '<%=request.getParameter("livroID")%>', '<%=request.getParameter("empresaID")%>');
 </script>
<%}%>

</body>
</html>