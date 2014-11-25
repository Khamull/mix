<%@ page errorPage="../index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="datas" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="fornecedor" class="cadastro.Fornecedor" scope="page"></jsp:useBean>

<jsp:useBean id="tipo" class="cadastro.TipoProduto" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do tipo Statement para ajudar na Query
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
//Pesquisa todos os Fornecedores
rs01 = st01.executeQuery(fornecedor.listaFornecedores());
%>

<%
//Pesquisa todos os Tipos de Produto
rs02 = st02.executeQuery(tipo.listaTipos());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
}

function abreRelatorio(fornecedorID, tipoID){
	window.open('rep_produtos.jsp?fornecedorID='+fornecedorID+'&tipoID='+tipoID, 'Retiradas', 'width = 800; height = 600; scrollbars=yes')
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
 <table align="center" width="629">
  <tr bgcolor="#EEEEEE">
   <td height="35" colspan="7" align="center"><strong>PESQUISE INFORMA&Ccedil;&Otilde;ES SOBRE OS PRODUTOS</strong></td>
  </tr>
  <tr>
   <td width="85" align="left">FORNECEDOR</td>
   <td width="168" align="left">
   <select name="fornecedorID" style="width:160px">
    <option value="0">Todos os Fornecedores</option>
    <%while(rs01.next()){ %>
     <option value="<%=rs01.getString("fornecedorID") %>"><%=rs01.getString("fornNomeFantasia") %></option>
    <%} %>
   </select>
   </td>
   <td width="20" align="center"></td>
   <td width="41" align="left">TIPO</td>
   <td width="178" align="left">
   <select name="tipoID" style="width:160px">
    <option value="0">Todos os Tipos</option>
    <%while(rs02.next()){ %>
     <option value="<%=rs02.getString("tipoprodutoID") %>" ><%=rs02.getString("tipo") %></option>
    <%} %>
   </select>   
   </td>
   <td width="20" align="left"></td>
   <td width="85" align="left"><input name="PESQUISAR" type="submit" class="botao" value="Pesquisar" />
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
  abreRelatorio('<%=request.getParameter("fornecedorID")%>', '<%=request.getParameter("tipoID")%>');
 </script>
<%}%>

</body>
</html>