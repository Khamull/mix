<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="retiradaEstoque" class="cadastro.RetiradasEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

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
//Verifica se foi passado parametro via URL e atribui ao objeto retiradaEstoque o ID do produto
if(request.getParameter("produtoID")!=null && request.getParameter("produtoID")!=""){
	retiradaEstoque.produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));
	produto.produtoID = retiradaEstoque.produto.produtoID;
}else{
	response.sendRedirect("sis_menu.jsp");
}
%>


<%
//Pesquisa dados do produto
rs = st.executeQuery(produto.listaProdutosPorID());

//Verifica se a pesquisa trouxe algum resultado e atribui à variavel
String nomeProduto = "";
String unidadeMedida = "";
if(rs.next()){
	nomeProduto = rs.getString("tipo")+" - "+rs.getString("nome");
	nomeProduto = nomeProduto.toUpperCase();
	unidadeMedida = rs.getString("unidade");
}
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


//Pesquisa as Contas a Receber de Acordo com a Data Passada
rs01 = st01.executeQuery(retiradaEstoque.retiradasEntreDatasDetalhada(dataInicio, dataFim));


//Pesquisa o total de retiradas em um determinado Periido
rs02 = st02.executeQuery(retiradaEstoque.quantidadeRetirada(dataInicio, dataFim));

//Verifica se a consulta trouxe algum resultado e adiciona a uma variavel
String totalRetiradas = "0";
if(rs02.next()){
	totalRetiradas = rs02.getString("totalRetirada");
	//Verifica se o valor é diferente de Null
	if(totalRetiradas!=null){
		//Trata o valor retirando o "." e substituindo por uma ","
		totalRetiradas = totalRetiradas.replace(".",",");
	}else{
		totalRetiradas = "0";
	}
}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
 <input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_produtos.jsp'" value="Lista Produtos" />
 </td>
</tr>
<tr>
 <td height="25" align="center" valign="middle">&nbsp;</td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <table align="center">
 <tr>
 <td>
 
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
 <td height="40" align="center" valign="middle"><font size="4"><strong>RETIRADAS DE <font color="#FF0000"><%=nomeProduto %></font> EM: <font color="#0033CC">- <%=data.retornaData(Integer.parseInt(mes)) %> - <%=ano %></font></strong></font></td>
 </tr>
 <tr bgcolor="#CCFFCC">
  <td height="40" align="center" valign="middle" bgcolor="#AADDAA">Esse m&ecirc;s foram retiradas um total de: <strong><%=totalRetiradas %> <%=unidadeMedida %></strong></td>
 </tr>
 <tr>
  <td>
  
  <table width="900" align="center">
  <tr bgcolor="#EEEEEE">
   <td width="222" align="left"><strong>Operador que Retirou</strong></td>
   <td width="95" align="left"><strong>Quantidade </strong></td>
   <td width="68" align="left"><strong>Data</strong></td>
   <td width="56" align="left"><strong>Hora</strong></td>
   <td width="435" align="left"><strong>Motivo da Retirada</strong></td>
  </tr>
  <%while(rs01.next()){ %>
  <tr>
   <td height="30" align="left"><%=rs01.getString("usuarioNome") %></td>
   <td height="30" align="left"><%=rs01.getString("quantidade").replace(".",",") %> <%=unidadeMedida %></td>
   <td height="30" align="left"><%=data.converteDeData(String.valueOf(rs01.getDate("data"))) %></td>
   <td height="30" align="left"><%=rs01.getTime("data") %></td>
   <td height="30" align="left"><%=rs01.getString("motivo") %></td>
  </tr>
  <tr>
   <td align="center" colspan="5"><hr style="border:1px solid #333333" /></td>
  </tr>
  <%} %>
 </table>
 
  </td>
  </tr>
  </table>

 </td>
</tr>

<tr>
 <td align="center"></td>
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