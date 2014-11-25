<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="item" class="pdv.VendaItem" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="formatar" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="forma" class="pdv.FormaPagamento" scope="page"></jsp:useBean>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statemenet para auxiliar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
ResultSet rs06 = null;
%>

<%
//Verifica se foi passado vendaID como parametro via URL
if(request.getParameter("vendaID")!=null){
	item.venda.vendaID = Integer.parseInt(request.getParameter("vendaID"));
	venda.vendaID = Integer.parseInt(request.getParameter("vendaID"));
}else{
	response.sendRedirect("sis_menu.jsp");
}
%>

<%
//Usado para formatar Valores
Currency currency = Currency.getInstance("BRL");     
DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<%
//Pesquisa os itens relacionados a venda
rs = st.executeQuery(item.listaItensPorID());
%>

<%
//Pesquisa os dados da Empresa para colocar no Cupom
rs01 = st01.executeQuery(empresa.dadosEmpresa());
%>

<%
//Pesquisa dados da Venda
rs02 = st02.executeQuery(venda.dadosVenda());
%>

<%
//Pesquisa o nome do Operador que está Logado
if(rs02.next()){
	usuario.login = rs02.getString("usuario");
}
rs04 = st04.executeQuery(usuario.usuarioPorLogin());
%>

<%
//Pesquisa dados do Cliente
cliente.clienteID = Integer.parseInt(rs02.getString("clienteID"));

//Variaveis que irá receber os dados do Cliente
String nome = "";
String cpf = "";

rs05 = st05.executeQuery(cliente.clientePorID());

//Atribui os valores as variaveis

if(rs05.next()){
	nome = rs05.getString("clienteNomeFantasia");
	cpf = rs05.getString("clienteCnpj");
}
%>

<%
//Pesquisa dados do cliente da Venda
rs06 = st06.executeQuery(venda.clienteVendaID());
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
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_livro_caixa.jsp'" value="Lista Bancos" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <table width="518" align="center">

<tr>
 <td height="20" colspan="3" align="center" bgcolor="#EEEEEE"><strong>DETALHES DA VENDA</strong></td>
</tr>

<%
String dataSemFormatacao = String.valueOf(rs02.getDate("data"));
String data = formatar.converteDeData(dataSemFormatacao);
%>
<tr>
 <td align="left">N&deg; da Venda: <%=rs02.getString("vendaID") %></td>
 <td align="center">Data: <%=data %></td>
 <td align="right">Hor&aacute;rio: <%=rs02.getTime("data") %></td>
</tr>

<tr>
 <td align="left" colspan="3" height="15">Cliente: 
	<%
	if(rs06.next()){
    	//Verifica se ele vendeu para um Cliente Cadastrado ou nao e trata a informaçao
    	if(rs06.getString("clienteNomeFantasia")==null){
    	%>
    	<font color="#666666">N&Atilde;O CADASTRADO</font>
    	<%}else{ %>
    	<font color="#000099"><%=rs06.getString("clienteNomeFantasia") %></font>
    	<%}
	}
    %>
 
 </td>
</tr>
<%if(rs01.next()){ %>
<%if(rs04.next()){ %>
<%} %>

<%} %>
<tr bgcolor="#EEEEEE">
  <td colspan="3" align="center">ITENS DA VENDA</td>
</tr>
<tr>
 <td align="left" colspan="3"><hr></td>
</tr>

<%
//Enquanto nao for final de arquivo lista os produtos adicionados ao pedido
while(rs.next()){
%>

  <%
    String preco = null;
	String total = null;
          
            
	preco = formato.format(rs.getDouble("valor"));
	total = formato.format(rs.getDouble("total"));
  %>

 <tr>
  <td width="151" align="left"><%=rs.getString("codigo")%></td>
  <td colspan="2" align="left"><%=rs.getString("tipo")%> <%=rs.getString("nome")%></td>
  </tr>
 <tr>
  <td align="left"><%=preco%> <%=rs.getString("unidade")%></td>
  <td width="159" align="left">qtd: <%=rs.getString("quantidade")%></td>
  <td width="159" align="left">total <%=total%></td>
 </tr>
 <tr>
  <td colspan="3" height="15"></td>
 </tr>

<%} %>

<tr>
 <td align="left" colspan="3"><hr></td>
</tr>
<tr>
 <td align="left" colspan="3" height="10"></td>
</tr>

<%
//Declara variaveis para receber valor formatado para Moeda
String total;
String totalParcial;
String desconto;
String pago;
String troco;
String faltaPagar;
double devendo;
String valorParcela;
%>

<%
//Formata os valores para Moeda e atribui as variaveis
total = formato.format(rs02.getDouble("valor") + rs02.getDouble("desconto"));
totalParcial = formato.format(rs02.getDouble("valor"));
desconto = formato.format(rs02.getDouble("desconto"));
pago = formato.format(rs02.getDouble("entrada"));
troco = formato.format(rs02.getDouble("troco"));
faltaPagar = formato.format(rs02.getDouble("valor") - rs02.getDouble("entrada"));
devendo = rs02.getDouble("valor") - rs02.getDouble("entrada");
valorParcela = formato.format(devendo / rs02.getDouble("vezes"));
%>

<%
//Recupera o ID da Forma de Pagamento e pesquisa o nome
forma.formPagID = rs02.getInt("formPagID");

String formaPagamento = "";

rs03 = st03.executeQuery(forma.formaPorID());

//Verifica se retornou algum resultado e atribui a variavel
if(rs03.next()){
	formaPagamento = rs03.getString("descricao");
}
%>

<tr>
 <td align="left">Total do Pedido</td>
 <td colspan="2" align="left"><strong><%=total %></strong></td>
 </tr>
<tr>
 <td align="left">Desconto</td>
 <td colspan="2" align="left"><%=desconto %></td>
 </tr>
<%if(rs02.getDouble("desconto") > 0){%>
<tr>
 <td align="left">Total com Desconto</td>
 <td colspan="2" align="left"><strong><%=totalParcial%></strong></td>
 </tr>
<%}%>

<% if(forma.formPagID != 1){ %>
<tr>
 <td align="left">Entrada</td>
 <td colspan="2" align="left"><%=pago%></td>
 </tr>
<tr>
 <td align="left"><%=formaPagamento%></td>
 <td colspan="2" align="left"><%=faltaPagar%></td>
 </tr>
<%}%>

<tr>
 <td align="left">Total Pago</td>
 <td colspan="2" align="left">
   <%if(forma.formPagID != 1 && forma.formPagID != 7){%>
   <strong><%=totalParcial%></strong>
   <%}else{%>
   <strong><%=pago%></strong>
   <%}%> </td>
 </tr>
<tr>
 <td align="left">Troco</td>
 <td colspan="2" align="left"><%=troco %></td>
 </tr>
<tr>
 <td align="left" colspan="3"><hr></td>
</tr>
<% if(forma.formPagID != 1){ %>

 <%
 String vezes = "";
 if(rs02.getInt("vezes") == 1){
	 vezes = "Á Vista ";
 }else{
	 vezes = rs02.getString("vezes")+" x ";
 }
 %>

<tr>
 <td align="center" colspan="3">Forma Pgto - <%=formaPagamento %>, <%=vezes%><%=valorParcela%></td>
</tr>
<%}else{%>
<tr>
 <td align="center" colspan="3">Forma Pgto - <%=formaPagamento %></td>
</tr>
<%}%>

<tr>
 <td align="center" colspan="3"><input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" /></td>
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