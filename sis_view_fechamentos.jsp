<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="lancamento" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<jsp:useBean id="retirada" class="caixaloja.Retiradas" scope="page"></jsp:useBean>


<%
//Instancia um Objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
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
%>

<%
//Recupera o Nivel do Usuário
String nivel = String.valueOf(session.getAttribute("nivel"));
%>

<%
//Verifica se o usuário logado não é Nivel 1 ou Nivel 2
if(nivel.equals("1") || nivel.equals("2")){
	//Pesquisa todos os fechamentos Ordenado por ID Decrescente
	rs = st.executeQuery(caixa.listaFechamentos(dataInicio, dataFim));
}else{
	caixa.usuario.login = (String)session.getAttribute("usuario");
	rs = st.executeQuery(caixa.listaFechamentosPorUsuario(dataInicio, dataFim));
}
%>


<%
String dataFechamento = "";
String horaFechamento = "";
String funcionario = "";
String valorInicial = "";

%>


<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
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
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_abrir_caixa.jsp'" value="Caixa" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">

 <table align="center">
  <tr>
    <td align="center"><font size="4"><strong>FECHAMENTOS DE CAIXA DE: <font color="#0033CC">- <%=data.retornaData(Integer.parseInt(mes)) %> - <%=ano %></font></strong></font></td>
   </tr>
  <tr>
   <td align="center">
   
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
   <td align="center">
   
   <table width="900" align="center" cellpadding="2" cellspacing="2">
    <tr bgcolor="#EEEEEE">
     <td width="98" align="left"><strong>Codigo</strong></td>
     <td width="79" align="left"><strong>Data</strong></td>
     <td width="91" align="left"><strong>Horario</strong></td>
     <td width="240" align="left"><strong>Funcionario</strong></td>
     <td width="110" align="center"><strong>Valor Inicial</strong></td>
     <td width="110" align="center"><strong>Valor Final</strong></td>
     <td width="60" align="center"><strong>RT</strong></td>
     <td width="60" align="center"><strong>IM</strong></td>
    </tr>
<%while(rs.next()){ %>

<%

//Alimenta o objeto caixa com o resultado da pesquisa acima
	caixa.usuario.login = rs.getString("usuario");
	caixa.caixaID = rs.getInt("caixaID");
	dataFechamento = data.converteDeData(String.valueOf(rs.getDate("data")));
	horaFechamento = String.valueOf(rs.getTime("data"));
	funcionario = rs.getString("funcionarioNome");
	caixa.valorInicial = rs.getFloat("valorInicial");
	caixa.vendaInicial = rs.getInt("vendaInicial");
	caixa.vendaFinal = rs.getInt("vendaFinal");
	caixa.lancamentoInicial = rs.getInt("lancamentoInicial");
	caixa.lancamentoFinal = rs.getInt("lancamentoFinal");
	caixa.retiradaInicial = rs.getInt("retiradaInicial");
	caixa.retiradaFinal = rs.getInt("retiradaFinal");
%>


<%
//Pesquisa a soma de todas as vendas desse usuário enquanto esse caixa estava aberto
venda.usuario.login = caixa.usuario.login;
rs01 = st01.executeQuery(venda.somaVendas(caixa.vendaInicial, caixa.vendaFinal));

	//Atribui o valor da Pesquisa à Variável
	float totalVenda = 0;
	if(rs01.next()){
		totalVenda = rs01.getFloat("totalVendas");
	}





//Pesquisa a soma de todos os lançamentos do tipo 'R' (Recebimento) , com forma de pagamento 7, 6, 5 e 4
//realizados por esse usuário do Sistema, dentro desse periodo entre o lançamento inicial e o final
lancamento.usuario.login = caixa.usuario.login;
rs02 = st02.executeQuery(lancamento.somaLancamentos(caixa.lancamentoInicial, caixa.lancamentoFinal));

	//Atribui o valor da Pesquisa à Variável	
	float totalLancamento = 0;
	if(rs02.next()){
		totalLancamento = rs02.getFloat("totalLancamentos");
	}

	

//Pesquisa a soma de todas as retiradas com caixaID igual ao do que está aberto
retirada.caixa.caixaID = caixa.caixaID;
rs03 = st03.executeQuery(retirada.somaRetiradas());

	//Atribui o valor da Pesquisa à Variável
	float totalRetirada = 0;
	if(rs03.next()){
		totalRetirada = rs03.getFloat("totalRetiradas");
	}
	

%>

<%
//Soma o Total que entrou no Caixa (Dinheiro vendas + Cheque dos recebimentos + Dinheiro dos recebimentos)
//float totalGeral = (caixa.valorFinal+lancamentosCheque+totalVenda);
float totalGeral = (totalVenda+totalLancamento+caixa.valorInicial-totalRetirada);
%>

    <tr>
     <td height="30" align="left" valign="middle"><%=caixa.caixaID %></td>
     <td height="30" align="left" valign="middle"><%=dataFechamento %></td>
     <td height="30" align="left" valign="middle"><%=horaFechamento %></td>
     <td height="30" align="left" valign="middle"><%=funcionario %></td>
     <td height="30" align="right" valign="middle"><%=formato.format(caixa.valorInicial) %></td>
     <td height="30" align="right" valign="middle"><%=formato.format(totalGeral) %></td>
     <td height="30" align="center" valign="middle"><a href="sis_view_retiradas.jsp?caixaID=<%=caixa.caixaID%>"><img src="ico/ico_retirada.png" width="20" height="20" title="Retiradas" /></a></td>
     <td height="30" align="center" valign="middle"><a href="#" onclick="javascript: window.open('sis_print_fechamento_caixa_2.jsp?caixaID=<%=caixa.caixaID%>', 'Lista' , 'height = 600 , width = 670');"><img src="ico/ico_print.png" width="20" height="20" title="Detalhes do Fechamento" /></a></td>
    </tr>
    <tr>
     <td colspan="8" align="center"><hr style="border:1px solid #333333" /></td>
    </tr>
    <%} %>
   </table>
   
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
</html>