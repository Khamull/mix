<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="data0" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="data1" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="lancamentos" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
%>


<%
//Instancia um objeto do tipo ResultSet para receber o resultado da consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
%>


<%
//Verifica se foi passado paramentro via URL
if(request.getParameter("livroID")!=null){
	caixa.livroID = Integer.parseInt(request.getParameter("livroID"));
	lancamentos.livro.livroID = caixa.livroID;
}else{
	response.sendRedirect("sis_view_livro_caixa.jsp");
}

//Pesquisa Informações sobre o Banco Selecionado
rs = st.executeQuery(caixa.bancoPorID());
%>


<%
//Variaveis que serão usadas para a Data
String diaInicio;;
String diaFim;;

String mesInicio;
String mesFim;

String anoInicio;
String anoFim;

String dataInicio;
String dataFim;


//Verifica se foi passado parametro de data e Trata a Data
if(request.getParameter("BUSCAR")!=null){
	diaInicio = request.getParameter("diaA");
	diaFim = request.getParameter("diaB");
	mesInicio = request.getParameter("mesA");
	mesFim = request.getParameter("mesB");
	anoInicio = request.getParameter("anoA");
	anoFim = request.getParameter("anoB");
}else{
	diaInicio = "1";
	diaFim = "31";
	mesInicio = data.mesAtual();
	mesFim = data.mesAtual();
	anoInicio = data.anoAtual();
	anoFim = data.anoAtual();
}

//Forma a Data para a Pesquisa
dataInicio = anoInicio+"-"+mesInicio+"-"+diaInicio;
dataFim = anoFim+"-"+mesFim+"-"+diaFim;


	//Retira um dia da Data Inicio para a Pesquisa de Valor Anterior
	String ultimaData = data.subtrairIntervalo(dataInicio, -1);


//Verifica se está no livro caixa da Loja e realiza a pesquisa somente pela loja
if(request.getParameter("livroID").equals("1")){
	//Pesquisa os Lançamentos pelas datas passada e pela Loja que está logada
	lancamentos.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	rs01 = st01.executeQuery(lancamentos.listaRecebimentosPorEmpresa(dataInicio, dataFim));
}else{	
	//Pesquisa os Lançamentos de Acordo com a Data Passada
	rs01 = st01.executeQuery(lancamentos.listaRecebimentos(dataInicio, dataFim));
}
%>



<%
//Verifica se está no livro caixa da Loja e realiza a pesquisa somente pela loja
if(request.getParameter("livroID").equals("1")){
	//Verifica o Total de Entrada e o Total de Saida pela Loja q o usuário está logado
	lancamentos.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	rs02 = st02.executeQuery(lancamentos.listaRecebimentosPorEmpresa(dataInicio, dataFim));
}else{
	//Verifica o Total de Entrada e o Total de Saida
	rs02 = st02.executeQuery(lancamentos.listaRecebimentos(dataInicio, dataFim));
}

double totalEntrada = 0;
double totalSaida = 0;

while(rs02.next()){
	
	String tipoA = rs02.getString("tipo");
	  if(tipoA.equals("R")){
		  totalEntrada += rs02.getDouble("valor");
	  }else if(tipoA.equals("P")){
		  totalSaida += rs02.getDouble("valor");		  
	  }else if(tipoA.equals("D")){
		  totalEntrada += rs02.getDouble("valor");
	  }else if(tipoA.equals("T")){
		  totalSaida += rs02.getDouble("valor");
	  }else if(tipoA.equals("S")){
	  	  totalEntrada += rs02.getDouble("valor");
	  }
	
}
%>

<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="financeiro.Lancamentos"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>


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



	<%!double totalPorLoja = 0; %>
    <%!String tpLoja = ""; %>
    	
        <%if(rs.getString("livroID").equals("1")){%>
    	
    	<%
        //Se o livro caixa for o Livro 1 então o total será somado apenas com as vendas e recebimentos relacionados
        //a empresa que está logada.
        
        //Atribui o ID da empresa, que está logada na sessão, ao objeto lancamento para realizar a pesquisa
        lancamentos.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
    	
    	//Atrobio o ID do livro caixa ao objeto lançamento
    	lancamentos.livro.livroID = rs.getInt("livroID");
        
        String dtInicio = rs.getString("dataInicio");
        String dtFim = data1.converteParaData(data1.dataAtual());
        
        
        rs04 = st04.executeQuery(lancamentos.listaRecebimentosPorEmpresa(dtInicio, dtFim));
        
        double ttEntrada = 0;
        double ttSaida = 0;


        while(rs04.next()){
        	
        	String tipoA = rs04.getString("tipo");
        	  if(tipoA.equals("R")){
        		  ttEntrada += rs04.getDouble("valor");
        	  }else if(tipoA.equals("P")){
        		  ttSaida += rs04.getDouble("valor");		  
        	  }else if(tipoA.equals("D")){
        		  ttEntrada += rs04.getDouble("valor");
        	  }else if(tipoA.equals("T")){
        		  ttSaida += rs04.getDouble("valor");
        	  }else if(tipoA.equals("S")){
	  	  		  ttEntrada += rs04.getDouble("valor");
	  		  }
        	
        }
        
        totalPorLoja = (ttEntrada-ttSaida);
        //Converte para o formato Moeda
        tpLoja = formato.format(totalPorLoja);
        
        //out.println(lancamentos.empresa.empresaID+" - "+lancamentos.livro.livroID+" - "+dtInicio+" / "+dtFim+" // "+data.diaAtual()+"-"+data.mesAtual()+"-"+data.anoAtual());
        
        %>
    
    	<%}%>
	



 <%
 //Atribui os valores de data de criação do caixa e saldo inicial às variaveis
 String dataCriacaoBanco = rs.getString("dataInicio");
 double valorInicial = rs.getDouble("valorInicial");
 
 //Variavel que irá receber o valor total antes da pesquisa
 double valorEmCaixa = 0;

 
//Verifica se está no livro caixa da Loja e realiza a pesquisa somente pela loja
 if(request.getParameter("livroID").equals("1")){
	 
 	//Pesquisa os Lançamentos desde quando criou o Banco até a primeira data passada
 	lancamentos.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
 	rs03 = st03.executeQuery(lancamentos.listaRecebimentosPorEmpresa(dataCriacaoBanco, ultimaData));
 	
 }else{
	 
	// Pesquisa os Lançamentos desde quando criou o Banco até a primeira data passada
	rs03 = st03.executeQuery(lancamentos.listaRecebimentos(dataCriacaoBanco, ultimaData));
	 
 }
 
 
 	while(rs03.next()){
		if(rs03.getString("tipo").equals("R") && rs03.getString("vendaID").equals("0")){
			valorEmCaixa += rs03.getDouble("valor");
		}else if(rs03.getString("tipo").equals("C")){
			valorEmCaixa -= rs03.getDouble("valor");	
		}else if(rs03.getString("tipo").equals("R")){
 			valorEmCaixa += rs03.getDouble("valor");
 		}else if(rs03.getString("tipo").equals("P")){
 			valorEmCaixa -= rs03.getDouble("valor");
 		}else if(rs03.getString("tipo").equals("D")){
 			valorEmCaixa += rs03.getDouble("valor");
 		}else if(rs03.getString("tipo").equals("T")){
 			valorEmCaixa -= rs03.getDouble("valor");
 		}else if(rs03.getString("tipo").equals("S")){
	  	  	valorEmCaixa += rs03.getDouble("valor");
	  	}
 	}
 	
 	valorEmCaixa += valorInicial; //Soma todos os lançamentos com o valor inicial do caixa
 	
 %>

<%//=valorEmCaixa %>

 <%
 //Trata o Saldo
 String saldo = "0";
 saldo = formato.format(rs.getDouble("saldo"));
 %>
 
<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_livro_caixa.jsp'" value="Lista Bancos" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_livro_caixa.jsp'" value="+ Novo Banco" />
 </td>
</tr>
<tr>
 <td height="25">
 
 <form name="form1" method="post">
 <table align="center" width="900">
  <tr>
   <td width="78" align="left">PER&Iacute;ODO</td>
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
   <td width="60" align="left">
   <select name="anoA" style="width:60px">
    <option value="<%=data0.anoAtual() %>" selected="selected"><%=data0.anoAtual() %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-1 %>"><%=Integer.parseInt(data0.anoAtual())-1 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-2 %>"><%=Integer.parseInt(data0.anoAtual())-2 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-3 %>"><%=Integer.parseInt(data0.anoAtual())-3 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-4 %>"><%=Integer.parseInt(data0.anoAtual())-4 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-5 %>"><%=Integer.parseInt(data0.anoAtual())-5 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-6 %>"><%=Integer.parseInt(data0.anoAtual())-6 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-7 %>"><%=Integer.parseInt(data0.anoAtual())-7 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-8 %>"><%=Integer.parseInt(data0.anoAtual())-8 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-9 %>"><%=Integer.parseInt(data0.anoAtual())-9 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-10 %>"><%=Integer.parseInt(data0.anoAtual())-10 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-11 %>"><%=Integer.parseInt(data0.anoAtual())-11 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-12 %>"><%=Integer.parseInt(data0.anoAtual())-12 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-13 %>"><%=Integer.parseInt(data0.anoAtual())-13 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-14 %>"><%=Integer.parseInt(data0.anoAtual())-14 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-15 %>"><%=Integer.parseInt(data0.anoAtual())-15 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-16 %>"><%=Integer.parseInt(data0.anoAtual())-16 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-17 %>"><%=Integer.parseInt(data0.anoAtual())-17 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-18 %>"><%=Integer.parseInt(data0.anoAtual())-18 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-19 %>"><%=Integer.parseInt(data0.anoAtual())-19 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-20 %>"><%=Integer.parseInt(data0.anoAtual())-20 %></option>
   </select>
   </td>
   <td width="69" align="center">&Agrave;</td>
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
      <option value="31">31</option>                
   </select>
   </td>
   <td width="110" align="left">
   <select name="mesB" style="width:110px">
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
   <td width="76" align="left">
   <select name="anoB" style="width:60px">
    <option value="<%=data0.anoAtual() %>" selected="selected"><%=data0.anoAtual() %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-1 %>"><%=Integer.parseInt(data0.anoAtual())-1 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-2 %>"><%=Integer.parseInt(data0.anoAtual())-2 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-3 %>"><%=Integer.parseInt(data0.anoAtual())-3 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-4 %>"><%=Integer.parseInt(data0.anoAtual())-4 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-5 %>"><%=Integer.parseInt(data0.anoAtual())-5 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-6 %>"><%=Integer.parseInt(data0.anoAtual())-6 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-7 %>"><%=Integer.parseInt(data0.anoAtual())-7 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-8 %>"><%=Integer.parseInt(data0.anoAtual())-8 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-9 %>"><%=Integer.parseInt(data0.anoAtual())-9 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-10 %>"><%=Integer.parseInt(data0.anoAtual())-10 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-11 %>"><%=Integer.parseInt(data0.anoAtual())-11 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-12 %>"><%=Integer.parseInt(data0.anoAtual())-12 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-13 %>"><%=Integer.parseInt(data0.anoAtual())-13 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-14 %>"><%=Integer.parseInt(data0.anoAtual())-14 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-15 %>"><%=Integer.parseInt(data0.anoAtual())-15 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-16 %>"><%=Integer.parseInt(data0.anoAtual())-16 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-17 %>"><%=Integer.parseInt(data0.anoAtual())-17 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-18 %>"><%=Integer.parseInt(data0.anoAtual())-18 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-19 %>"><%=Integer.parseInt(data0.anoAtual())-19 %></option>
    <option value="<%=Integer.parseInt(data0.anoAtual())-20 %>"><%=Integer.parseInt(data0.anoAtual())-20 %></option>
   </select>
   </td>
   <td width="257" align="left"><input name="BUSCAR" type="submit" class="botao" value="Buscar" /> 
   <%//=dataInicio%> <%//=dataFim%>
   </td>
  </tr>
 </table>
 </form>
 
 </td>
</tr>
<tr>
 <td valign="top" align="center">

	<%
	//Trata a entrada e saída para tipo Moeda
	String totalEnt = "0";
	String totalSai = "0";

	totalEnt = formato.format(totalEntrada);
	totalSai = formato.format(totalSaida);
	%>

 <table align="center" width="900" cellpadding="2" cellspacing="2">
  <tr bgcolor="#003366">
   <td colspan="8" align="center"><font color="#FFFFFF" size="4"><strong>RELAT&Oacute;RIO LIVRO CAIXA - <%=rs.getString("banco") %></strong></font></td>
  </tr>
  <tr bgcolor="#CCCCCC">
   <td colspan="3" rowspan="2" align="center"><font color="#000000" size="6"><strong>RESUMO</strong></font></td>
   <td colspan="2" align="right"><strong>Total Entrada:&nbsp;</strong></td>
   <td width="115" align="left"><%=totalEnt %></td>
   <td width="105" align="right"><strong>Saldo:&nbsp;</strong></td>
   <td width="145" align="left">
   <strong>
   <%if(rs.getString("livroID").equals("1")){%>
   
   <%=tpLoja%>
   
   <%}else{%>
   
   <%if(rs.getDouble("saldo")<=0){%>
   <font color="#FF0000"><%=saldo %></font>
   <%}else{%>
   <%=saldo %>
   <%}%>
   
   <%}%>
   </strong></td>
  </tr>
  <tr>
   <td colspan="2" align="right" bgcolor="#CCCCCC"><strong>Total Saida:&nbsp;</strong></td>
   <td align="left" bgcolor="#CCCCCC"><%=totalSai %></td>
   <td align="left" bgcolor="#CCCCCC"></td>
   <td align="left" bgcolor="#CCCCCC"></td>
  </tr>
   
  <tr>
    <td colspan="3" align="left">&nbsp;</td>
    <td width="106" align="center">&nbsp;</td>
    <td width="165" align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr bgcolor="#DDDDDD">
   <td width="28" align="center">&nbsp;</td>
   <td width="86" align="left" bgcolor="#DDDDDD"><strong>Lan&ccedil;amento</strong></td>
   <td width="98" align="left" bgcolor="#DDDDDD"><strong>N&deg; Documento</strong></td>
   <td colspan="2" align="left" bgcolor="#DDDDDD"><strong>Hist&oacute;rico</strong></td>
   <td align="left" bgcolor="#DDDDDD"><strong>Entrada</strong></td>
   <td align="left" bgcolor="#DDDDDD"><strong>Sa&iacute;da</strong></td>
   <td align="center" bgcolor="#DDDDDD"><strong>Total</strong></td>
  </tr>
  
  <%
  //Variavel que irá receber os valores de ACRESCIMO e DECRESCIMO para sempre mostrar o Total
  double totalAtual = valorEmCaixa;
  String total = "0";
  %>
  
  <%
  //Contador 
  int i = 0;//contará quantas vezes foi passado pelo laço ( while )
  int j = 0;//receberá o MOD da divisão por 2 ( 0 ou 1 )
  %>
  
  <%
  //Muda a cor da Linha
  String[] cor = new String[2];
  cor[0] = "#F1F1F1";
  cor[1] = "#FFFFFF";
  %>
  
  <%while(rs01.next()){ %>
  
  <%
  //Verifica a cor que será usada
  j = (i % 2); //Essa divisão atribuirá à variavel "j" apenas o Resto da Divisão
  %>
  
  <%
  //Trata a Data
  Date dataLancamento = rs01.getDate("data");
  String dataLanc = String.valueOf(dataLancamento);
  dataLanc = data.converteDeData(dataLanc);
  
  //Trata valor
  String valor = "0";
  valor = formato.format(rs01.getDouble("valor"));
  
  %>
  
  <%
  //Verifica se é um um pagamento ou um Recebimento antes de mostrar na tela
  String tipo = rs01.getString("tipo");
  String venID = rs01.getString("vendaID");
  if(tipo.equals("R") && venID.equals("0")){
  %>
  
  <%
  //Soma valor ao total
  totalAtual += rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td align="left"><%=dataLanc %></td>
   <td align="left"><%=rs01.getString("lancamentoID") %></td>
   <td colspan="2" align="left"><a href="sis_detalhe_cheque.jsp?receberID=<%=rs01.getString("receberID") %>" title="Informa&ccedil;&otilde;es sobre o Cheque Devolvido que foi Pago">Cheque Devolvido (Pago)</a></td>
   <td align="left"><font color="#009900"><%=valor %></font></td>
   <td align="left"></td>
   <td align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  <%}else if(tipo.equals("C")){ %>
  
  <%
  //Subtrai valor ao total
  totalAtual -= rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td align="left"><%=dataLanc %></td>
   <td align="left"><%=rs01.getString("lancamentoID") %></td>
   <td colspan="2" align="left"><a href="sis_detalhe_cheque_devolvido.jsp?receberID=<%=rs01.getString("receberID")%>" title="Informa&ccedil;&otilde;es sobre o Cheque Devolvido">Cheque Devolvido</a></td>
   <td align="left"></td>
   <td align="left"><font color="#990000"><%=valor %></font></td>
   <td align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  
  <%}else if(tipo.equals("R")){ %>
  
  <%
  //Soma valor ao total
  totalAtual += rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td align="left"><%=dataLanc %></td>
   <td align="left"><%=rs01.getString("lancamentoID") %></td>
   <td colspan="2" align="left">
   <a href="sis_detalhe_receber.jsp?receberID=<%=rs01.getString("receberID") %>" title="Informa&ccedil;&otilde;es sobre a Venda">Venda N&deg; <%=rs01.getString("vendaID") %> - 
   <%if(rs01.getString("formID").equals("4") || rs01.getString("formID").equals("5")){%>
   Cheque
   <%}else{%>
   <%=rs01.getString("descricao") %>
   <%}%>
   </a></td>
   <td align="left"><font color="#009900"><%=valor %></font></td>
   <td align="left"></td>
   <td align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  
  <%}else if(tipo.equals("S")){ %>
  
  <%
  //Soma valor ao total
  totalAtual += rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td align="left"><%=dataLanc %></td>
   <td align="left"><%=rs01.getString("lancamentoID") %></td>
   <td colspan="2" align="left">
   <a href="sis_detalhe_receber.jsp?receberID=<%=rs01.getString("receberID") %>&servico=s" title="Informa&ccedil;&otilde;es sobre o Servi&ccedil;o">Servi&ccedil;o N&deg; <%=rs01.getString("vendaID") %> - 
   <%if(rs01.getString("formID").equals("4") || rs01.getString("formID").equals("5")){%>
   Cheque
   <%}else{%>
   <%=rs01.getString("descricao") %>
   <%}%>
   </a></td>
   <td align="left"><font color="#009900"><%=valor %></font></td>
   <td align="left"></td>
   <td align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  
  <%}else if(tipo.equals("P")){ %>
  
  <%
  //Subtrai valor ao total
  totalAtual -= rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td align="left"><%=dataLanc %></td>
   <td align="left"><%=rs01.getString("lancamentoID") %></td>
   <td colspan="2" align="left"><a href="sis_detalhe_pagar.jsp?pagarID=<%=rs01.getString("pagarID")%>" title="Informa&ccedil;&otilde;es sobre a Conta a Pagar"><%=rs01.getString("favorecido") %></a></td>
   <td align="left"></td>
   <td align="left"><font color="#990000"><%=valor %></font></td>
   <td align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  <%}else if(tipo.equals("D")){ %>
  
  <%
  //Soma valor ao total
  totalAtual += rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td align="left"><%=dataLanc %></td>
   <td align="left"><%=rs01.getString("lancamentoID") %></td>
   <td colspan="2" align="left"><a href="sis_detalhe_transferencia.jsp?transferenciaID=<%=rs01.getString("transferenciaID")%>" title="Informa&ccedil;&otilde;es sobre a Transferencia">Transferencia Banc&aacute;ria</a></td>
   <td align="left"><font color="#009900"><%=valor %></font></td>
   <td align="left"></td>
   <td align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  
  <%}else if(tipo.equals("T")){ %>
  
  
  <%
  //Subtrai valor ao total
  totalAtual -= rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td align="left"><%=dataLanc %></td>
   <td align="left"><%=rs01.getString("lancamentoID") %></td>
   <td colspan="2" align="left"><a href="sis_detalhe_transferencia.jsp?transferenciaID=<%=rs01.getString("transferenciaID")%>" title="Informa&ccedil;&otilde;es sobre a Transferencia">Transferencia Banc&aacute;ria</a></td>
   <td align="left"></td>
   <td align="left"><font color="#990000"><%=valor %></font></td>
   <td align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  
  <%} //Fim do if %>
  
  <%
  //Acrescenta valor do contador ( i )
  i++;
  %>
  
  <%} //Fim do while %>
  
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
