<%@page import="servico.ServicoProduto"%>
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
Statement st03 = con.createStatement();
%>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01;
ResultSet rs02;
ResultSet rs03;
%>


<%
//Recupera o ID do Serviço trazido via URL e atribui ao objeto servico
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
//String id = "href=\"sis_print_cupom_servico_cliente.jsp?servicoID="+request.getParameter("servicoID")+"\"";
String id = "sis_print_cupom_servico_cliente.jsp?servicoID="+request.getParameter("servicoID");
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
function dataprevistaVerifica()
{
	var dataprevista_ = ocument.getElementById("previsao");
	if(dataprevista_.value == "")
		{
			alert("Preencha a data prevista antes de Abrir a Ordem de Serviço");
		}
}
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

function addToldo(servicoID){
	if (confirm("Adicionar Toldo?")){
		window.open("sis_add_toldo.jsp?servicoID="+servicoID+" ", "Adicionar", "width=500px, height=250px");
	}
}

function excluir(servicoitemID, servicoID){
	if(confirm("Tem certeza que deseja Excluir esse Serviço?")){
		window.location.href="sis_exc_manager_servico.jsp?servicoitemID="+servicoitemID+"&servicoID="+servicoID;
	}
}

function excluirProd(servicoprodutoID, servicoID, prID){
	if(confirm("Tem certeza que deseja Excluir esse Produto?")){
		window.location.href="sis_exc_manager_produto.jsp?servicoprodutoID="+servicoprodutoID+"&servicoID="+servicoID+"&prodID="+prID;
	}
}


function dataPrevisao(servicoID, obj){
		window.location.href="sis_manager_dataprevista.jsp?servicoID="+servicoID+"&dataprevista="+obj.value;
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
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_servicos.jsp'" value="Lista de OS's" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_servico.jsp'" value="+ Nova OS" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 <%if(rs.next()){ 	%>
 <table width="696" align="center" cellpadding="2" cellspacing="2">
  <tr bgcolor="#EEEEEE">
   <td colspan="4" align="center"><strong>EDITAR ORDEM DE SERVI&Ccedil;O</strong></td>
  </tr>
  <tr>
  	<form id="form1" action="<%=id%>" method="post">
    <td align="left">N&deg; Ordem Servi&ccedil;o</td>
    <td align="left"><%=rs.getString("OS")+"/"+rs.getString("anoServico").substring(0,4) %></td>
    <td width="52" align="left">Cliente</td>
    <td width="240" align="left"><%=rs.getString("clienteNomeFantasia") %></td>
  </tr>
  <tr>
    <td width="66" align="left">Inicio</td>
    <td width="164" align="left"><%=data.converteDeData(rs.getString("dataInicio")) %></td>
    <td align="left" width="164"><strong></>Data Prevista :
    <%if(!rs.getString("dataprevista1").equals("0")){%>
    	<%=data.converteDeData(rs.getString("dataprevista1")) %></TD>
    <%}
    else
    {%>
    	<input type="date" value="" name="previsao" id="previsao" required style="width:125px" onchange="dataPrevisao(<%=rs.getString("servicoID") %>, this);" /></strong></TD>
    <%}%>
    <td colspan="2" align="left">
    Tel: <%=rs.getString("clienteTelefone") %> &nbsp;&nbsp;&nbsp;
    Cel: <%=rs.getString("clienteCelular") %> <%=rs.getString("operadoraCelular") %>
    </td>
    <TD></TD>
    </tr>
  <tr bgcolor="#F9F6F2">
    <td align="left">VALOR TOTAL</td>
    <td align="left"><font color="#009900"><strong><%=formato.format(rs.getDouble("valor")) %></strong></font></td>
    <td colspan="2"  align="left">
    &Uacute;ltima Altera&ccedil;&atilde;o&nbsp; &nbsp; <%=data.converteDeData(String.valueOf(rs.getDate("dataFim"))) %>
    <%if(rs.getString("status").equals("M")) {%><input type="button" name="concluir" onclick="javascript: window.location.href='sis_finalizar_servico.jsp?servicoID=<%=rs.getString("servicoID")%>'" style="background-color:transparent; background-image:url(images/icone-financeiro.png); background-repeat:no-repeat; width:200px; height:22px; border:0; background-size:15% 100%;
-webkit-background-size:15% 100%;
-o-background-size: 15% 100%;
-khtml-background-size: 15% 100%;
-moz-background-size: 15% 100%;" value="" title="Pagamentos" /><%} %></td>
    </tr>
  <tr bgcolor="#FFFF99">
   <td colspan="4" align="center">Descri&ccedil;&atilde;o do Servi&ccedil;o&nbsp;<a href="sis_update_descricao_servico.jsp?servicoID=<%=rs.getString("servicoID")%>" style="font-size:10px" title="Editar Descriçao do Serviço">[editar]</a></td>
   </tr>
  <tr>
   <td colspan="4" align="center">
    <pre style="white-space:pre-line; width:696px; text-align:left"><%=rs.getString("descricao")%></pre>   </td>
  </tr>
  <tr>
    <td colspan="4" align="center"><hr color="#FFFF99" /></td>
  </tr>
  <!-- <tr valign="middle">
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
  </tr>-->
  <tr align="center" valign="middle" bgcolor="#52658C">
    <td colspan="4"><font color="#FFFFFF">Adicionar Toldos </font><a href="javascript: addToldo(<%=rs.getString("servicoID")%>)" ><img src="ico/ico_add.png" width="18" height="18" border="0" align="absmiddle" title="+ Adicionar Produto" /></a></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
    
      
        <%
        	int i = 0;
        	while(rs02.next()){
         %>
        <table width="690" align="center">
        <tr align="center" valign="middle" bgcolor="#CCCCCC">
        	<td>Produto</td><td colspan="2" align="left">Dimensoes(Alt x Larg)</td><td>Valor</td><td></td>
        </tr>
         <tr>
          <td  align="left"><%=rs02.getString("nome") %></td>
          <td  align="left"><%=rs02.getString("altura") %></td>
          <td  align="left"><%=rs02.getString("largura") %></td>
          <td  align="left"><%=formato.format(rs02.getDouble("valor")) %></td>
          <td  align="center"><a href="javascript: excluirProd(<%=rs02.getString("servicoprodutoID")%>, <%=rs02.getString("servicoID")%>, <%=rs02.getString("produtoID") %>)"><img src="ico/ico_cancelar.png" width="18" height="18" border="0" title="Excluir Produto" /></a></td>
         </tr>
		</table>
		<%i++;
		rs03 = st03.executeQuery(servicoproduto.listaProdutosNovo(rs02.getString("produtoID"), i)); %>
		<table width="690" align="center">
		<tr align="center" valign="middle" bgcolor="#CCCCCC"><td colspan="7" color="#CCCCCC"><font color="">Detalhes Material do Produto</font></td></tr>
		<tr>
          <td  align="left">Nome</td>
          <td  align="left" colspan="2">Dimensoes (Altura x Largura)</td>
          <td  align="left" colspan="2">Dimensoes Reais (Altura x Largura)</td>
          <td  align="left" >Quantidade</td>
          <td  align="left">Quantidade Real</td>
        </tr>
		<%while(rs03.next()){ %>
		
		<tr>
          <td  align="left"><%=rs03.getString("nome") %></td>
          <td  align="left"><%=rs03.getString("altura") %></td>
          <td  align="left"><%=rs03.getString("largura") %></td>
          <td  align="left"><%=rs03.getString("alturaReal") %></td>
          <td  align="left"><%=rs03.getString("larguraReal") %></td>
          <td  align="left"><%=rs03.getString("Quantidade") %></td>
          <td  align="left"><%=rs03.getString("quantidadeReal") %></td>
        </tr>
		
         	<%} %>
         	<tr>
          <td align="center" colspan="7"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         </table>	
         <%} %>
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
<table width="690" align="center">
<tr><td colspan="7"><%if(rs.getString("nivelUsuario").equals("1") || rs.getString("nivelUsuario").equals("2")){%><a <%=id %>><input type="submit" name="abrirOS" value="Abrir OS" onclick="(dataprevistaVerifica())" ></input></a><%} %></td></tr>
</table>
</table>
</form>
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