<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoitem" class="servico.ServicoItem" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o valor de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Verifica se fois passado parametro via URL dando ordem para inclusão
if(request.getParameter("incluir")!=null){
	
	//Recupera os valores trazidos do formulário e atribui ao objeto servicoitem
	servicoitem.servico.servicoID 	= Integer.parseInt(request.getParameter("servicoID"));
	servicoitem.descricao 			= request.getParameter("descricao");
	servicoitem.valor 				= Float.parseFloat(request.getParameter("valor"));
	//Atribui o valor ao objeto servico
	servico.servicoID				= servicoitem.servico.servicoID;
	
	
	//Insere o servico na base de dados
	st.execute(servicoitem.salvaItem());
	
	//Pesquisa o valor total atual desse serviço
	rs01 = st01.executeQuery(servico.pesquisaServico());
	
	float valorAtual = 0;
	boolean alterado = false;
	
	if(rs01.next()){
		valorAtual = rs01.getFloat("valor");
		alterado = true;
	}
	
	//Soma ao novo valor vindo do formulário
	servico.valor = (valorAtual + servicoitem.valor);
	
	//Altera o valor total do servico
	st.execute(servico.atualizaValorServico());
	
	
	//Muda o Status de visualizado para (Não-Visualizado)
	st.execute(servico.naoVisualizado());
	
	
	//Após alterado fecha a página e atualiza a página de pai
	if(alterado){%>
		
		<script type="text/javascript">
		 window.close();  
		 window.opener.location.reload();
		</script>
		
	<%}
	
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar Servico</title>


<style type="text/css">

body{
	background-color:#FFFFFF;
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}

input.botao {
	background-color:#FFFFFF;
	border:1px solid #003366;
	color:#333;
	font-family:arial, Geneva, sans-serif;
	font-size:13px;
	}

</style>

<script type="text/javascript">

function verForm(){
	
	if(document.form1.valor.value == ""){
		alert("Informe o valor desse serviço!");
		document.form1.valor.focus();
		return false;
	}
	
	if(document.form1.descricao.value == ""){
		alert("Descreva em poucas palavras o serviço");
		document.form1.descricao.focus();
		return false;
	}

	verPonto();
}



//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}


//Verifca se tem "," ao invés de "." e Substitui
function verPonto(){
	var valor = document.form1.valor.value;
		
	valor = valor.replace(",",".");
		
	document.form1.valor.value = valor;
}

</script>

</head>
<body onLoad="javascript: document.form1.valor.focus()">

<form name="form1" method="get" action="sis_add_servico.jsp" onSubmit="return verForm(this)" >
<table border="0" cellpadding="2" cellspacing="2" align="center">
 <tr bgcolor="#EEEEEE">
  <td colspan="2" align="center"><strong>INSERIR NOVO SERVI&Ccedil;O</strong></td>
 </tr>
 <tr>
  <td width="46" align="left">Valor</td>
  <td width="351" align="left"><input name="valor" type="text" onKeyPress="return numero(this.value)" value="0,00" maxlength="10" ></td>
 </tr>
 <tr>
  <td align="center" colspan="2">Descri&ccedil;&atilde;o do Servi&ccedil;o
  <input type="hidden" name="servicoID" value="<%=request.getParameter("servicoID")%>" >
  <input type="hidden" name="incluir" value="1">
  </td>
 </tr>
  <tr>
  <td align="center" colspan="2"><textarea name="descricao" style="width:400px; height:100px"></textarea></td>
 </tr>
 <tr>
  <td align="right" colspan="2"><input type="submit" name="CADASTRAR" value="Incluir Serviço" class="botao" ></td>
 </tr>
</table>
</form>

</body>
</html>