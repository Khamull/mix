<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ page errorPage="index.jsp?erro=3" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="funcionario" class="cadastro.Funcionario" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>

<%
//Pesquisa todos os usuários cadastrados no sistema
rs = st.executeQuery(funcionario.listaFuncionario());
%>

<%
//Pesquisa todas as unidades cadastradas (empresas)
rs01 = st01.executeQuery(empresa.listaEmpresas());
%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = usuario.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	var funcionarioID = document.form1.funcionarioID.value;
	var login = document.form1.login.value;
	var senhaA = document.form1.senha.value;
	var senhaB = document.form1.confirmaSenha.value;
	var empresaID = document.form1.empresaID.value;
	
	if(funcionarioID.length == ""){
		alert("Favor informar o nome Completo!");
		document.form1.funcionarioID.focus();
		return false;
	}
	
	if(login.length <= 3){
		alert("Cadastre um login com mais de 3 digitos!");
		document.form1.login.focus();
		return false;
	}
	
	// ############  Verificaçoes de SENHA  ############
	if(senhaA == ""){
		alert("O campo Senha é Obrigatório!");
		document.form1.senha.focus();
		return false;
	}
	
	if(senhaA != senhaB){
		alert("As senhas nao sao iguais!\nFavor verificar");
		document.form1.senha.value = "";
		document.form1.confirmaSenha.value = "";
		document.form1.senha.focus();
		return false;
	}
	
	if(senhaA.length <= 3){
		alert("Cadastre uma Senha com mais de 3 Digitos!");
		document.form1.senha.value = "";
		document.form1.confirmaSenha.value = "";
		document.form1.senha.focus();
		return false;
	}
	
	if(senhaA == "1234" || senhaA == "12345" || senhaA == "123456" || senhaA == "1234567" || senhaA == "12345678"){
		alert(senhaA+" é uma senha muito Simples!\nPor favor escolha outra.");
		document.form1.senha.value = "";
		document.form1.confirmaSenha.value = "";
		document.form1.senha.focus();
		return false;
	}
	// ###################################################
	
	if(empresaID == ""){
		alert("Informe em qual unidade esse login será usado!");
		document.form1.empresaID.focus();
		return false;
	}
}
</script>


<script type="text/javascript">

//Funçao utilizada para através do funcionário selecionado recuperar o nome dele para salvar em um outro campo
function recuperaNome(){
	var funID = document.getElementById("funcionarioID").selectedIndex;
	
	if(funID != "" ){
		document.form1.nome.value = form1.funcionarioID.options[funID].text;
	}else{
		document.form1.nome.value = "";	
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

<body onload="javascript:document.form1.funcionarioID.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_usuarios.jsp'" value="Lista de Usu&aacute;rios" />
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
 
 <form name="form1" method="post" action="sis_insert_manager_usuario.jsp" onsubmit="return verForm(this)">
 <table width="400" align="center">
 <%if(request.getParameter("msg") != null){ %>
  <tr>
   <td colspan="3" align="center" bgcolor="#ff0000"><font color="#ffffff"><strong><%=msg %></strong></font></td>
  </tr>
 <%} %>
  <tr>
   <td colspan="3" align="center"><strong>CADASTRO DE USU&Aacute;RIO</strong></td>
  </tr>
  <tr>
   <td width="127" align="left">Funcionario:</td>
   <td colspan="2" align="left">
   
   <select name="funcionarioID" id="funcionarioID" onchange="recuperaNome()">
    <option value="" selected="selected">Selecione um nome...</option>
    <%while(rs.next()){ %>
     <option value="<%=rs.getString("funcionarioID") %>"><%=rs.getString("funcionarioNome") %></option>
    <%} %>
   </select>
   </td>
  </tr>
  <tr>
   <td align="left">Login:</td>
   <td colspan="2" align="left"><input type="text" name="login" maxlength="20" /></td>
  </tr>
  <tr>
   <td align="left" valign="top">Senha:</td>
   <td colspan="2" align="left" valign="top"><input type="password" class="senha password" name="senha" title="Senha" value="" maxlength="20" /></td>
  </tr>
  <tr>
   <td align="left">Confirme sua Senha:</td>
   <td colspan="2" align="left"><input type="password" name="confirmaSenha" maxlength="20"/></td>
  </tr>
  <tr>
   <td align="left">N&iacute;vel de Usu&aacute;rio:</td>
   <td width="133" align="left">
    <select name="nivel" style="width:125px">
     <option value="1" selected="selected">Gerencial</option>
     <option value="2">Atendimento</option>
     <option value="3">Arte Finalista</option>
     <option value="4">Impressão</option>
     <option value="5">Finalização/Acabamento</option>
     <option value="6">Instalação</option>
     <option value="8">Produção</option>
     <option value="7">Vendas</option>
    </select>
   </td>
   <td width="124" align="left"><a href="#" onclick="javascript: window.open('sis_view_niveis.jsp','niveis', 'width = 780; height = 600') "><img src="ico/ico_interrogacao.png" width="20" height="20" border="0" title="Ver Detalhes dos Niveis" /></a></td>
  </tr>
  <tr>
    <td align="left">Unidade:</td>
    <td colspan="2" align="left">
    <select name="empresaID">
     <option value="" selected="selected">Unidade que trabalha...</option>
     <%while(rs01.next()){%>
      <option value="<%=rs01.getString("empresaID")%>"><%=rs01.getString("unidade")%></option>
     <%}%>
    </select>
    </td>
  </tr>
  <tr>
   <td align="left"><input type="submit" name="CADASTRAR" value="Cadastrar" /></td>
   <td colspan="2" align="left"><input name="nome" type="hidden" size="50" maxlength="50" style="background-color:transparent; border:0px"/></td>
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
</html>