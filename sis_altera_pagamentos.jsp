<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<jsp:useBean id="data_" class="formatar.Datas" scope="page"></jsp:useBean>
<%


Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");

int 	parcelas = 0;
if(request.getParameter("parcelas") != null){
	parcelas 		= Integer.parseInt(request.getParameter("parcelas"));
}
int 	formID = 0;
if(request.getParameter("formID") != null){
	formID 			= Integer.parseInt(request.getParameter("formID"));
}
int   	clienteID = 0;
if(request.getParameter("clientID") != null){
	clienteID 		= Integer.parseInt(request.getParameter("clientID"));	
}
float 	desconto = 0;
if(request.getParameter("desconto") != null){
	desconto 		= Float.parseFloat(request.getParameter("desconto").replace(",","."));
}
float 	entrada = 0;
if(request.getParameter("entrada") != null && !request.getParameter("entrada").equals("")){
		entrada 		= Float.parseFloat(request.getParameter("entrada").replace(",","."));
}
float 	troco = 0;
if(request.getParameter("troco") != null && !request.getParameter("troco").equals("")){
 		troco 			= Float.parseFloat(request.getParameter("troco").replace(",","."));
}
float 	valorTotalVenda = 0;
if(request.getParameter("valorTotal") != null){
	valorTotalVenda= Float.parseFloat(request.getParameter("valorTotal").replace(",","."));
}
int 	servicoID = 0;
if(request.getParameter("servicoID") != null){
	 	servicoID 		= Integer.parseInt(request.getParameter("servicoID"));
}
float ValorASerParcelado = valorTotalVenda;
if(entrada != 0 && entrada != 0.00)
{
	ValorASerParcelado = ValorASerParcelado - entrada;
}
if(desconto != 0 && desconto != 0.00)
{
	ValorASerParcelado = ValorASerParcelado - desconto;
}
float valorParcelas = 0;
if(parcelas != 0 && parcelas != 1)
{
	 valorParcelas = ValorASerParcelado/parcelas;
}

String data = "";
String datepicker = "#datepicker";
for(int i = 0; i<parcelas; i++){
	data += "\t $( \""+datepicker+i+"\" ).datepicker(";
	data +="\t {	dateFormat: \"dd/mm/yy\"";
	data +="\t ,dayNamesMin: [ \"Dom\", \"Se\", \"Ter\", \"Qua\", \"Qui\", \"Sex\", \"Sab\"]";
	data +="\t ,dayNamesShort: [\"Dom\", \"Se\", \"Ter\", \"Qua\", \"Qui\", \"Sex\", \"Sab\"]";
	data +="\t ,monthNames: [\"Janeiro\", \"Fevereiro\", \"Mar\u00e7o\", \"Abril\", \"Maio\", \"Junho\", \"Julho\", \"Agosto\", \"Setembro\", \"Outubro\", \"Novembro\",\"Dezembro\"]";
	data +="\t ,monthNamesShort: [\"Jan\",\"Fev\",\"Mar\",\"Abr\",\"Mai\",\"Jun\",\"Jul\",\"Ago\",\"Set\",\"Out\",\"Nov\",\"Dec\" ]";
	data +="\t ,numberOfMonths: [ 1, 2 ]";
	data +="\t}";
	data +="\t);";
}

//Datas que seriam usadas normalmente.
//##### VENCIMENTOS #####
//Trata a data de Vencimento
 String [] dataAtual = new String[parcelas];
Calendar hoje = Calendar.getInstance();

 int dia = 0;
 int mes = 0;
 int ano = 0;
 
 dia = Integer.parseInt(data_.diaAtual());
 mes = hoje.get(Calendar.MONTH)+ 1;//Peguei o mes atual e somei mais um pois (Estranhamente) o Calendar está trazendo o mês anterior
 
 String dataOk = data_.verificaSeExiste(dia, mes);
 String[] vetor = new String[2];
 
 vetor = dataOk.split("-");
 
 dia = Integer.parseInt(vetor[0]);
 mes = Integer.parseInt(vetor[1]);
 ano = Integer.parseInt(data_.anoAtual());
 
 for(int i = 0; i< parcelas; i++)
 {
	 String m = String.valueOf(i+mes);
	 String d = String.valueOf(dia);
	 
	 String dataOk2 = data_.verificaSeExiste(Integer.parseInt(d), Integer.parseInt(m));
	 
	 String[] vetor2 = new String[2];
	 
	 vetor2 = dataOk2.split("-");
	 
	 d = vetor2[0];
	 m = vetor2[1];
	 
		//verifica se não veio com duas casas e converte para duas casas
		if(m.length() < 2){
			m = "0"+m;
		}
		
		//verifica se não veio com duas casas e converte para duas casas
		if(d.length() < 2){
			d = "0"+d;
		}
	 //Junta as tres informações em uma String
	 String dataAtual_ = d+"/"+m+"/"+ano;
	 dataAtual[i] =   data_.converteDeData(data_.trataData(dataAtual_));
 }
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Altere as datas e valores dos pagamentos</title>
  <link rel="stylesheet" href="jquery/jquery-ui.css">
  <style type="text/css">
    .Table
    {
        display: table;
        
    }
    .Title
    {
        display: table-caption;
        text-align: center;
        font-weight: bold;
        font-size: larger;
    }
    .Heading
    {
        display: table-row;
        font-weight: bold;
        text-align: center;
    }
    .Row
    {
        display: table-row;
    }
    .Cell
    {
        display: table-cell;
        border:gray;
        border-width: 0;
        padding-left: 0px;
        padding-right: 0px;
    }
	</style>
  <script src="jquery\external\jquery\jquery.js"></script>
  <script src="jquery/jquery-ui.js"></script>
 <script>
  $(function() {
    //$( "#datepicker" ).datepicker(
    //		{	dateFormat: "dd-mm-yy"//Define Formato
   	//		,dayNamesMin: [ "Dom", "Se", "Ter", "Qua", "Qui", "Sex", "Sab" ]//Define nomes reduzidos para apresentação na tela
   	//		,dayNamesShort: ["Dom", "Se", "Ter", "Qua", "Qui", "Sex", "Sab"]
   	//		,monthNames: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "outubro", "Novembro", "Dezembro"]
   	//		,monthNamesShort: [ "Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dec" ]
   	//		,numberOfMonths: [ 1, 2 ]
   	//	}
    //);
    <%=data%>
  });
  </script>
</head>
<body>
<form name="form1" method="post" action="sis_finalizar_manager_servico.jsp?OS=<%=request.getParameter("OS") %>&Ano=<%=request.getParameter("Ano") %>&alteradata=1" id="form1">
<table align="center" >
<tr>
<td>
<div align="center">
<div class="Table">
    <div class="Heading">
        <div class="Cell">
            <p>Parcela</p>
        </div>
        <div class="Cell">
            <p>Valor</p>
        </div>
        <div class="Cell">
            <p>Data</p>
        </div>
    </div>
    <%for(int i = 1; i<parcelas; i++) {%>
	<div class="Row" align="center">
        <div class="Cell">
            <p><%=i %></p>
        </div>
        <div class="Cell">
            <p>
            		<%=formato.format(valorParcelas) %>
            </p>
        </div>
        <div class="Cell">
            <p><input type="text" name="dataParcela[]" id="datepicker<%=i %>" value="<%=dataAtual[i]%>" style="text-align: right; width: 100px; required="required"" /></p>
        </div>
    </div>
	<%} %>
</div>
</div>
</td>
</tr>
<tr>
<td>
<div align="left">
<div class="Table">
<div class="Row">
        <div class="Cell">
            <p>Valor </p>
        </div>
        <div class="Cell">
            <p><%=formato.format(valorTotalVenda) %></p>
        </div>
        <div class="Cell" align="center">
            <p>Entrada</p>
        </div>
        <div class="Cell">
            <p><%=formato.format(entrada) %></p>
        </div>
    </div>
     <div class="Row" align="center">   
        <div class="Cell">
            <p>Desconto </p>
        </div>
        <div class="Cell">
            <p><%=formato.format(desconto) %></p>
        </div>
        <div class="Cell">
            <p>Fim </p>
        </div>
        <div class="Cell">
            <p><%=formato.format(ValorASerParcelado) %> </p>
        </div>
     </div>
   </div>
</div>
</td>
<tr>
</table>        
<div align="center">
	<input type="submit" value="Gravar"/>
</div>
</form>
</body>
</html>
