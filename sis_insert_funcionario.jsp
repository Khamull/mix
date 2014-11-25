<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="funcionario" class="cadastro.Funcionario" scope="page"></jsp:useBean>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do Tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Pesquisa todos os cargos que Existe
rs = st.executeQuery(cargo.listaCargosAtivos());
%>

<%
//Trata mensagens
//variaveis que serao utilizadas para verificaçao
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = funcionario.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>


<!-- Faça o include da lib do jQuery -->
<script type="text/javascript" src="js/cep.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript" src="js/MascaraValidacao.js"></script> 

<script type="text/javascript">
	// Função única que fará a transação
	function getEndereco() {
			// Se o campo CEP não estiver vazio
			if($.trim($("#cep").val()) != ""){
				/* 
					Para conectar no serviço e executar o json, precisamos usar a função
					getScript do jQuery, o getScript e o dataType:"jsonp" conseguem fazer o cross-domain, os outros
					dataTypes não possibilitam esta interação entre domínios diferentes
					Estou chamando a url do serviço passando o parâmetro "formato=javascript" e o CEP digitado no formulário
					http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val()
				*/
				$.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val(), function(){
					// o getScript dá um eval no script, então é só ler!
					//Se o resultado for igual a 1
			  		if(resultadoCEP["resultado"]){
						// troca o valor dos elementos
						$("#rua").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));
						$("#bairro").val(unescape(resultadoCEP["bairro"]));
						$("#cidade").val(unescape(resultadoCEP["cidade"]));
						$("#estado").val(unescape(resultadoCEP["uf"]));
					}else{
						alert("Endereço não encontrado");
					}
				});				
			}			
	}
</script>

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->

<script type="text/javascript">

//Verificar e Formulário
function verForm(){

	if(document.form1.funcionarioNome.value == ""){
	alert("Favor informar o nome do Funcionario!");
	document.form1.funcionarioNome.focus();
	return false;
	}
	
	if(document.form1.cargoID.value == ""){
	alert("Favor informar o Cargo do Funcionario!");
	document.form1.cargoID.focus();
	return false;
	}
	
	if(document.form1.funcionarioNascimento.value == ""){
	alert("Favor informar a Data de Nascimento!");
	document.form1.funcionarioNascimento.focus();
	return false;	
	}

	if(document.form1.funcionarioCpf.value.length < 11){
	alert("Favor informar o CPF!");
	document.form1.funcionarioCpf.focus();
	return false;
	}

	if(document.form1.cep.value == ""){
	alert("Favor informar o Cep!");
	document.form1.cep.focus();
	return false;
	}

	if(document.form1.rua.value == ""){
	alert("Favor informar o Endereço!");
	document.form1.rua.focus();
	return false;
	}

	if(document.form1.funcionarioNumero.value == ""){
	alert("Favor informar o Número!");
	document.form1.funcionarioNumero.focus();
	return false;
	}	

	if(document.form1.bairro.value == ""){
	alert("Favor informar o Bairro!");
	document.form1.bairro.focus();
	return false;
	}

	if(document.form1.cidade.value == ""){
	alert("Favor informar o Cidade!");
	document.form1.cidade.focus();
	return false;
	}	
	
	if(document.form1.funcionarioUf.value == ""){
	alert("Favor informar o Estado (UF)!");
	document.form1.funcionarioUf.focus();
	return false;
	}

	if(document.form1.funcionarioTelefone.value.length < 8){
	alert("Favor informar o número de telefone!");
	document.form1.funcionarioTelefone.value = "";
	document.form1.funcionarioTelefone.focus();
	return false;
	}		
	
			
}

//Valida se o Campo é Numérico
function numero()	{
if (event.keyCode<48 || event.keyCode>57){return false;} 
}


//Valida Data
function validaDat(campo,valor) {
	var date=valor;
	var ardt=new Array;
	var ExpReg=new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
	ardt=date.split("/");
	erro=false;
	if ( date.search(ExpReg)==-1){
		erro = true;
		}
	else if (((ardt[1]==4)||(ardt[1]==6)||(ardt[1]==9)||(ardt[1]==11))&&(ardt[0]>30))
		erro = true;
	else if ( ardt[1]==2) {
		if ((ardt[0]>28)&&((ardt[2]%4)!=0))
			erro = true;
		if ((ardt[0]>29)&&((ardt[2]%4)==0))
			erro = true;
	}
	if (erro) {
		alert("\"" + valor + "\" nao é uma data válida!!!");
		campo.value = "";
		return false;
	}
	return true;
}

//Completa a Data
function completadataNasc(){
	var data = document.form1.funcionarioNascimento.value;
	var novadata;
	
	if(data.length == 2){
		novadata = data + '/';
		document.form1.funcionarioNascimento.value = novadata;
	}
	if(data.length == 5){
		novadata = data + '/';
		document.form1.funcionarioNascimento.value = novadata;
	} 
}
</script>


<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>

<body onload="document.form1.funcionarioNome.focus();">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">

<!--INICIO DO FORMULÁRIO DE CADASTRO-->
 <form name="form1" action="sis_insert_manager_funcionario.jsp" method="post" id="form1" onSubmit="return verForm(this)">
   <table width="985" height="440">
    <tr>
    <td height="25" bgcolor="#EEEEEE" colspan="2">
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_funcionarios.jsp'" value="Lista Funcion&aacute;rios" /> &nbsp;
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_cargos.jsp'" value="Lista Cargos" />&nbsp;
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_cargo.jsp'" value="+ Novo Cargo" />
    </td>
    </tr>
    <tr>
     <td height="20" colspan="2" align="center"><strong>CADASTRAR FUNCION&Aacute;RIO</strong></td>
    </tr>
    <%if(request.getParameter("msg") != null){ %>
     <tr>
      <td align="center" colspan="2" bgcolor="#ff0000"><font color="#ffffff"><strong><%=msg %></strong></font></td>
     </tr>
    <%}%>
    <tr>
    <!--PRIMEIRA COLUNA-->
     <td valign="top">
     
      <table align="center">
       <tr>
         <td align="left">Nome Completo</td>
       </tr>
       <tr>
        <td colspan="3" align="left"><input name="funcionarioNome" type="text" id="funcionarioNome" size="71" maxlength="50"/></td>
       </tr>
       <tr>
        <td align="left">Cargo</td>
       </tr>
       <tr>
        <td colspan="3" align="left">
        <select name="cargoID" style="width:380px;">
         <option value="">selecione um cargo . . .</option>
         
         <%while(rs.next()){%>
          <option value="<%=rs.getString("cargoID")%>"><%=rs.getString("cargoTitulo")%></option>
         <%}%>
         
        </select>
        </td>
       </tr>
       <tr align="left">
        <td>Data de Nascimento</td>
        <td>RG</td>
        <td>CPF</td>
       </tr>
       <tr>
        <td align="left"><input name="funcionarioNascimento" type="text" style="width:120px" size="14" onKeyPress="MascaraData(form1.funcionarioNascimento);" onBlur="validaDat(this,this.value)"  maxlength="10" ></td>
        <td align="left"><input name="funcionarioRg" type="text" style="width:120px" size="14" maxlength="14" ></td>
        <td align="left"><input name="funcionarioCpf" id="cpf" type="text" style="width:120px" onBlur="valida()" onKeyPress="MascaraCPF(form1.funcionarioCpf);" size="14" maxlength="14" ></td>
       </tr>
       <tr>
         <td colspan="2" align="left">&nbsp;</td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr valign="middle" bgcolor="#CCCCCC">
         <td colspan="3" align="center" height="30">Busque o Endere&ccedil;o pelo CEP:           <input name="cep" id="cep" type="text" style="width:120px" onKeyPress="return numero(this)" maxlength="8" onBlur="getEndereco()" size="14" /></td>
         </tr>
       <tr>
        <td colspan="2" align="left">Endereço</td>
        <td align="left">Número</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="rua" id="rua" type="text" size="45" maxlength="40"/></td>
        <td align="left"><input name="funcionarioNumero" type="text" style="width:120px" onKeyPress="return numero(this)" size="14" maxlength="6"/></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Bairro</td>
        <td align="left">&nbsp;</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="bairro" id="bairro" type="text" size="45" maxlength="40" /></td>
        <td align="left">&nbsp;</td>
       </tr>
       <tr>
        <td colspan="2" align="left">Cidade</td>
        <td align="left">UF</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="cidade" id="cidade" type="text" size="45" maxlength="40" /></td>
        <td align="left">
        <select name="funcionarioUf" style="width:48px">
          <option value="AC">AC</option>
          <option value="AL">AL</option>
          <option value="AP">AP</option>
          <option value="AM">AM</option>
          <option value="BA">BA</option>
          <option value="CE">CE</option>
          <option value="DF">DF</option>
          <option value="ES">ES</option>
          <option value="GO">GO</option>
          <option value="MA">MA</option>
          <option value="MT">MT</option>
          <option value="MS">MS</option>
          <option value="MG">MG</option>
          <option value="PA">PA</option>
          <option value="PB">PB</option>
          <option value="PR">PR</option>
          <option value="PE">PE</option>
          <option value="PI">PI</option>
          <option value="SC">SC</option>
          <option value="SE">SE</option>
          <option value="SP" selected="selected">SP</option>
          <option value="RJ">RJ</option>
          <option value="RN">RN</option>
          <option value="RS">RS</option>
          <option value="RO">RO</option>
          <option value="RR">RR</option>
          <option value="TO">TO</option>                        
          </select>
        </td>
       </tr>
      </table>
         
        </td>
        
        <!--SEGUNDA COLUNA--> 
        <td valign="top">
         
         <table align="center">
          <tr align="left">
           <td>Complemento</td>
          </tr>
          <tr align="left">
           <td colspan="3" align="left"><input name="funcionarioComplemento" type="text" size="70" maxlength="100" /></td>
          </tr>
          <tr align="left">
            <td width="131">Telefone</td>
            <td width="131">Celular</td>
            <!--<td width="133">Radio</td>-->
          </tr>
          <tr align="left">
            <td><input name="funcionarioTelefone" type="text" style="width:120px" size="14" onKeyPress="MascaraTelefone(form1.funcionarioTelefone);" maxlength="14"  onBlur="ValidaTelefone(form1.funcionarioTelefone);" ></td>
            <td><input name="funcionarioCelular" type="text" style="width:120px" size="14" onKeyPress="MascaraTelefone(form1.funcionarioCelular);" maxlength="15"  onBlur="ValidaTelefone(form1.funcionarioCelular);" /></td>
            <td width="133"><select name="operadoraCelular" id="operadoraCelular" style="width:48px">
              <option value=""></option>
              <option value="TIM">TIM</option>
              <option value="OI">OI</option>
              <option value="VIVO">VIVO</option>
              <option value="CLARO">CLARO</option>
              <option value="Brasil Telecom">Brasil Telecom</option>
              <option value="CTBC">CTBC</option>
            </select></td
           ></tr>
           <tr align="left">
             <td width="131">E-mail</td>
           </tr>
          <tr align="left">
            <td colspan="3"><input name="funcionarioEmail" type="text" style="text-transform:lowercase;" size="70" maxlength="100" /></td>
          </tr>
          <tr align="left">
            <td>
              <input type="hidden" name="funcionarioUsuario" id="fornUsuario" value="<%=session.getAttribute("usuario")%>"></td>
          </tr>
          <tr align="left">
           <td colspan="2"><input type="submit" name="Cadastrar" class="botao" value="Cadastrar" />             <input type="reset" class="botao" value="Apagar" /></td>
           </tr>
          <tr align="left">
           <td>&nbsp;</td>
          </tr>
          <tr align="left">
           <td colspan="2"><font color="#FF0000"><b></b></font></td>
          </tr>
         </table>
         
        </td>
       </tr>
      </table>
     
     </td>
    </tr>
   </table>
  </form>
  <!--FIM DO FORMULÁRIO-->

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