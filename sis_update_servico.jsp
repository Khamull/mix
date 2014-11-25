<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoitem" class="servico.ServicoItem" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01;
ResultSet rs02;
%>


<%
//Recupera o ID do Serviço trazido via URL e atribui ao objeto servico
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
%>


<%
//Pesquisa informações sobre o Serviço
rs = st.executeQuery(servico.pesquisaServico());
%>


<%
//Psquisa todos os itens adicionados ao Serviço
servicoitem.servico.servicoID = servico.servicoID;
rs01 = st01.executeQuery(servicoitem.listaItens());
%>


<%
//Pesquisa todos os produtos adicionados ao Servico
servicoproduto.servico.servicoID = servico.servicoID;
rs02 = st02.executeQuery(servicoproduto.listaProdutos());
%>

<%
//Converte para o Formato Data
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


function addServico(servicoID){
	if (confirm("Adicionar Servico?")){
		window.open("sis_add_servico.jsp?servicoID="+servicoID+" ", "Adicionar", "width=450px, height=250px");
	}	
}

function addProduto(servicoID){
	if (confirm("Adicionar Produto?")){
		window.open("sis_add_produto.jsp?servicoID="+servicoID+" ", "Adicionar", "width=500px, height=250px");
	}
}

function excluir(servicoitemID, servicoID){
	if(confirm("Tem certeza que deseja Excluir esse Serviço?")){
		window.location.href="sis_exc_manager_servico.jsp?servicoitemID="+servicoitemID+"&servicoID="+servicoID;
	}
}

function excluirProd(servicoprodutoID, servicoID){
	if(confirm("Tem certeza que deseja Excluir esse Produto?")){
		window.location.href="sis_exc_manager_produto.jsp?servicoprodutoID="+servicoprodutoID+"&servicoID="+servicoID;
	}
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
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_servicos.jsp'" value="Lista de Serviços" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_servico.jsp'" value="+ Novo Serviço" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 <%if(rs.next()){ %>
 <table width="696" align="center" cellpadding="2" cellspacing="2">
  <tr bgcolor="#EEEEEE">
   <td colspan="4" align="center"><strong>EDITAR SERVI&Ccedil;O</strong></td>
  </tr>
  <tr>
    <td align="left">N&deg; Servi&ccedil;o</td>
    <td align="left"><%=rs.getString("servicoID") %></td>
    <td width="52" align="left">Cliente</td>
    <td width="240" align="left"><%=rs.getString("clienteNomeFantasia") %></td>
  </tr>
  <tr>
    <td width="66" align="left">Inicio</td>
    <td width="164" align="left"><%=data.converteDeData(rs.getString("dataInicio")) %></td>
    <td colspan="2" align="left">
    Tel: <%=rs.getString("clienteTelefone") %> &nbsp;&nbsp;&nbsp;
    Cel: <%=rs.getString("clienteCelular") %> <%=rs.getString("operadoraCelular") %>
    </td>
    </tr>
  <tr bgcolor="#F9F6F2">
    <td align="left">VALOR TOTAL</td>
    <td align="left"><font color="#009900"><strong><%=formato.format(rs.getDouble("valor")) %></strong></font></td>
    <td colspan="2" align="left">
    &Uacute;ltima Altera&ccedil;&atilde;o&nbsp; &nbsp; <%=data.converteDeData(String.valueOf(rs.getDate("dataFim"))) %>
    <input type="button" name="concluir" onclick="javascript: window.location.href='sis_finalizar_servico.jsp?servicoID=<%=rs.getString("servicoID")%>'" style="background-color:transparent; background-image:url(images/pagar_concluir.png); background-repeat:no-repeat; width:200px; height:22px; border:0" value="" title="Pagar e Concluir" /></td>
    </tr>
  <tr bgcolor="#FFFF99">
   <td colspan="4" align="center">Descri&ccedil;&atilde;o do Servi&ccedil;o ( DIAGN&Oacute;STICO )&nbsp;<a href="sis_update_descricao_servico.jsp?servicoID=<%=rs.getString("servicoID")%>" style="font-size:10px" title="Editar Descriçao do Serviço">[editar]</a></td>
   </tr>
  <tr>
   <td colspan="4" align="center">
    <pre style="white-space:pre-line; width:696px; text-align:left"><%=rs.getString("descricao")%></pre>   </td>
  </tr>
  <tr>
    <td colspan="4" align="center"><hr color="#FFFF99" /></td>
  </tr>
  <tr valign="middle">
    <td colspan="4" align="center" bgcolor="#52658C"><font color="#FFFFFF">Adicionar Servi&ccedil;o&nbsp;</font><a href="javascript: addServico(<%=rs.getString("servicoID")%>)" ><img src="ico/ico_add.png" width="18" height="18" border="0" title="+ Adicionar Serviço" align="absmiddle" /></a></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
  		
        <table width="690" align="center">
        <%while(rs01.next()){ %>
         <tr>
          <td width="530" align="left"><%=rs01.getString("descricao") %></td>
          <td width="106" align="center"><%=formato.format(rs01.getDouble("valor")) %></td>
          <td width="38" align="center"><a href="javascript: excluir(<%=rs01.getString("servicoitemID")%>, <%=rs01.getString("servicoID")%>)"><img src="ico/ico_cancelar.png" width="18" height="18" border="0" title="Excluir Serviço" /></a></td>
         </tr>
         <tr>
          <td align="center" colspan="3"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         <%} %>
        </table>    </td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr align="center" valign="middle" bgcolor="#52658C">
    <td colspan="4"><font color="#FFFFFF">Adicionar Produto&nbsp;</font><a href="javascript: addProduto(<%=rs.getString("servicoID")%>)" ><img src="ico/ico_add.png" width="18" height="18" border="0" align="absmiddle" title="+ Adicionar Produto" /></a></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
    
      <table width="690" align="center">
        <%while(rs02.next()){ %>
         <tr>
          <td width="530" align="left"><%=rs02.getString("nome") %></td>
          <td width="106" align="center"><%=formato.format(rs02.getDouble("valor")) %></td>
          <td width="38" align="center"><a href="javascript: excluirProd(<%=rs02.getString("servicoprodutoID")%>, <%=rs02.getString("servicoID")%>)"><img src="ico/ico_cancelar.png" width="18" height="18" border="0" title="Excluir Produto" /></a></td>
         </tr>
         <tr>
          <td align="center" colspan="3"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         <%} %>
        </table> 
    
    </td>
    </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
 </table>
 <%} %>
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