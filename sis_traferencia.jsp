<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="data1" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="lancamentos" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na Query
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
//Verifica se foi passado parametro e atribui o valor ao ID do caixa
if(request.getParameter("livroID")!=null){
	caixa.livroID = Integer.parseInt(request.getParameter("livroID"));
}
%>


<%
//Pesquisa informações do Banco
rs = st.executeQuery(caixa.bancoPorID());
%>

<%
//Pesquisa os bancos 
rs01 = st01.executeQuery(caixa.listaBancos());
%>

<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00"); //Formato Moeda
DecimalFormat formato1 = new DecimalFormat("#,##0.00"); //Formato double ( 2 CASAS DECIMAIS )
%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = caixa.mensagem(numeroMsg);
}
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
	
	if(document.form1.bancoPara.value == "0"){
		alert("Informe o Banco que recebera a Transferencia!");
		document.form1.bancoPara.focus();
		return false;
	}
	
	if(document.form1.valor.value == ""){
		alert("Informe um valor a ser Trasferido!");
		document.form1.valor.focus();
		return false;
	}
	
}


//Verifica valor de Transferencia
function verificaValor(){
	var valor = document.form1.valor.value;
	var saldo = document.form1.saldo.value;
	
	valor = valor.replace(",",".");
	
	var valor2 = parseFloat(valor);
	var saldo2 = parseFloat(saldo);
	
	
	if(valor2 > saldo2){
		alert("Impossivel Transferir esse valor\npois é superior ao Saldo em Banco.");
		document.form1.valor.value = saldo.replace(".",",");
		document.form1.valor.focus();
		return false;	
	}
		
}
</script>

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" src="js/interface.js"></script>

<script type="text/javascript" src="js/MascaraValidacao.js"></script> 

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->   

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}

</script>

</head>

<%if(rs.next()){ %>


<%
//Verifica se o livro caixa é da Loja,
if(String.valueOf(caixa.livroID).equals("1")){
	lancamentos.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	lancamentos.livro.livroID = caixa.livroID;
	
	String dataInicio 	= rs.getString("dataInicio");
	String dataFim		= data1.converteParaData(data1.dataAtual());
	
	rs02 = st02.executeQuery(lancamentos.listaRecebimentosPorEmpresa(dataInicio, dataFim));
}
%>

<%	
double totalPorLoja = 0;
String tpLoja = "";
String tpLoja1 = "";
double ttEntrada = 0;
double ttSaida = 0;

if(String.valueOf(caixa.livroID).equals("1")){

while(rs02.next()){
	
	String tipoA = rs02.getString("tipo");
	  if(tipoA.equals("R")){
		  ttEntrada += rs02.getDouble("valor");
	  }else if(tipoA.equals("P")){
		  ttSaida += rs02.getDouble("valor");		  
	  }else if(tipoA.equals("D")){
		  ttEntrada += rs02.getDouble("valor");
	  }else if(tipoA.equals("T")){
		  ttSaida += rs02.getDouble("valor");
	  }
	
}

}

totalPorLoja = (ttEntrada-ttSaida);
//Converte para o formato Moeda
tpLoja = formato.format(totalPorLoja);
tpLoja1 = formato1.format(totalPorLoja);

tpLoja1 = tpLoja1.replace(",",".");
%>

<body onload="javascript: document.form1.bancoPara.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_livro_caixa.jsp'" value="Lista de Bancos" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_livro_caixa.jsp'" value="+ Novo Banco" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
<table align="center" style="width:450px; height:200px; border:1px solid #333">
 <tr>
 <td>

	<form name="form1" method="post" action="sis_manager_transferencia_caixa.jsp" onsubmit="return verForm(this)">
	<table width="540" align="center">
     <%if(request.getParameter("msg") != null){ %>
  	 <tr>
   	  <td colspan="4" align="center" bgcolor="#FF0000"><font color="#ffffff"><strong><%=msg %></strong></font></td>
     </tr>
 	 <%} %>
     <tr>
      <td colspan="4" align="center"><strong>TRASFERENCIA BANC&Aacute;RIA</strong></td>
     </tr>
     <tr>
       <td height="15" align="left">&nbsp;</td>
       <td align="left">&nbsp;</td>
       <td align="left">&nbsp;</td>
       <td align="left">&nbsp;</td>
     </tr>
     <tr>
       <td align="left">Nome do Banco</td>
       <td align="left"><strong><%=rs.getString("banco") %></strong></td>
       <td align="right">Saldo Atual&nbsp;</td>
       <td align="left"><strong>
       <%if(String.valueOf(caixa.livroID).equals("1")){%>
       	
       	<%=tpLoja %>
       
       <%}else{ %>
       
       	<%
       	//Trata o Valor
       	String saldo = "0";
       	saldo = formato.format(rs.getDouble("saldo"));
       	%>
       	<%=saldo %>
       
       <%} %>
       </strong></td>
     </tr>
     <tr>
       <td align="left">Trasfererir para</td>
       <td align="left">
       <select name="bancoPara">
        <option value="0">Escolha um Banco. . .</option>
        
       <%while(rs01.next()){ %>
        <%if(Integer.parseInt(rs01.getString("livroID"))!= Integer.parseInt(request.getParameter("livroID"))){ %>
        	<option value="<%=rs01.getString("livroID") %>"><%=rs01.getString("banco") %></option>
        <%} %>
       <%} %>
       
       </select>
       </td>
       <td align="right">Valor&nbsp;</td>
       <td align="left"><input name="valor" type="text" size="10" maxlength="10" onKeyPress="return numero(this)" onblur="verificaValor()" /></td>
     </tr>
     <tr>
       <td align="left">
       <input type="hidden" name="bancoDe" value="<%=rs.getString("livroID")%>" />
       <%if(String.valueOf(caixa.livroID).equals("1")){%>
	       <input type="hidden" name="saldo" value="<%=tpLoja1%>" />
       <%}else{%>
    	   <input type="hidden" name="saldo" value="<%=rs.getString("saldo")%>" />
       <%}%>
       </td>
       <td align="left">&nbsp;</td>
       <td align="left">&nbsp;</td>
       <td align="left">&nbsp;</td>
     </tr>
     <tr>
      <td width="99" align="left">&nbsp;</td>
      <td width="228" align="left">&nbsp;</td>
      <td width="69" align="left">&nbsp;</td>
      <td width="124" align="left">&nbsp;</td>
     </tr>
     <tr>
      <td align="left" colspan="4">Observa&ccedil;&otilde;es</td>
     </tr>
     <tr>
      <td align="left" colspan="4"><input type="text" name="observacoes" id="observacoes" maxlength="82" size="105" style="height:80px; text-align:left"/></td>
     </tr>
     <tr>
      <td align="left" colspan="4"><input name="CADASTRAR" type="submit" class="botao" value="Transferir" /></td>
     </tr>
    </table>
 	</form>	
 
 </td>
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