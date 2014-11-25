<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet que irá receber o resultado da Consulta
ResultSet rs = null;
%>

<%
//Atribui o ID da empresa passado via URL ao objeto empresa
empresa.empresaID = Integer.parseInt(request.getParameter("empresaID"));
//Pesquisa os dados da Empresa Cadastrada
rs = st.executeQuery(empresa.dadosGerais());
%>

<%
//Trata mensagens
//variaveis que serao utilizadas para verificaçao
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = empresa.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
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

	if(document.form1.nomeFantasia.value == ""){
	alert("Favor informar o nome Fantasia!");
	document.form1.nomeFantasia.focus();
	return false;
	}
	

	if(document.form1.cnpj.value.length < 11){
	alert("Favor informar o CNPJ!");
	document.form1.cnpj.focus();
	return false;
	}
	
	if(document.form1.cep.value.lenght < 8){
	alert("Favor informar o Cep!");
	document.form1.cep.focus();
	return false;
	}

	if(document.form1.rua.value == ""){
	alert("Favor informar o Endereço!");
	document.form1.rua.focus();
	return false;
	}

	if(document.form1.numero.value == ""){
	alert("Favor informar o Número!");
	document.form1.numero.focus();
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
	
	if(document.form1.uf.value == ""){
	alert("Favor informar o Estado (UF)!");
	document.form1.uf.focus();
	return false;
	}

	if(document.form1.responsavel.value == ""){
	alert("Favor informar o nome do Responsavel!");
	document.form1.responsavel.focus();
	return false;
	}
	
	if(document.form1.telefone.value.length < 8){
	alert("Favor informar o número de telefone!");
	document.form1.telefone.value = "";
	document.form1.telefone.focus();
	return false;
	}		
	
			
}

//Valida se o Campo é Numérico
function numero()	{
if (event.keyCode<48 || event.keyCode>57){return false;} 
}

</script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>

<%if(rs.next()){ %>

<body onload="javascript: document.form1.unidade.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">

<!--INICIO DO FORMULÁRIO DE CADASTRO-->
 <form name="form1" method="post" action="sis_update_manager_empresa.jsp" id="form1" onSubmit="return verForm(this)">
   <table width="985" height="440">
    <tr>
    <td height="25" bgcolor="#EEEEEE" colspan="2">
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_filial.jsp'" value="+ Nova Filial" />&nbsp;
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_unidades.jsp'" value="Lista Unidades" />
    </td>
    </tr>
    <tr>
     <td height="20" colspan="2" align="center"><strong>ATUALIZAR DADOS DA EMPRESA</strong></td>
    </tr>
    <%if(request.getParameter("msg") != null){ %>
     <tr>
      <td align="center" colspan="2"><font color="#ff0000"><strong><%=msg %></strong></font></td>
     </tr>
    <%}%>
    <tr>
    <!--PRIMEIRA COLUNA-->
     <td valign="top">
     
      <table align="center">
       <tr>
         <td align="left">Nome da Unidade</td>
       </tr>
       <tr>
         <td colspan="3" align="center"><input type="text" name="unidade" size="70" maxlength="40" value="<%=rs.getString("unidade")%>"/></td>
       </tr>
       <tr>
         <td align="left">Nome Fantasia</td>
       </tr>
       <tr>
        <td colspan="3" align="left"><input type="text" name="nomeFantasia" id="nomeFantasia" size="70" maxlength="40" value="<%=rs.getString("nomeFantasia")%>" /></td>
       </tr>
       <tr>
        <td align="left">Razao Social</td>
       </tr>
       <tr>
        <td colspan="3" align="left"><input type="text" name="razaoSocial" id="razaoSocial" size="70" maxlength="60" value="<%=rs.getString("razaoSocial")%>" /></td>
       </tr>
       <tr>
         <td align="left">Ramo de Atividade</td>
       </tr>
       <tr>
        <td colspan="3" align="left"><input type="text" name="ramo" id="ramo" size="70" maxlength="30" value="<%=rs.getString("ramo")%>" /></td>
       </tr>
       <tr align="left">
        <td>CNPJ</td>
        <td>Inscriçao Estadual</td>
        <td>Inscriçao Municipal</td>
       </tr>
       <tr>
        <td align="left"><input type="text" name="cnpj" id="cnpj" size="14" maxlength="18" style="width:120px" onblur="ValidarCNPJ(form1.cnpj)" onKeyPress="MascaraCNPJ(form1.cnpj);"  value="<%=rs.getString("cnpj")%>" /></td>
        <td align="left"><input type="text" name="inscEstadual" id="inscEstadual" size="14" maxlength="14" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("inscEstadual")%>" /></td>
        <td align="left"><input type="text" name="inscMunicipal" id="inscMunicipal" size="14" maxlength="14" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("inscMunicipal")%>" /></td>
       </tr>
       <tr valign="middle" bgcolor="#CCCCCC">
         <td colspan="3" align="center" height="30">Busque o Endere&ccedil;o pelo CEP:           <input name="cep" id="cep" type="text" style="width:120px" onKeyPress="return numero(this)" maxlength="8" onBlur="getEndereco()" size="14"  value="<%=rs.getString("cep")%>" /></td>
         </tr>
       <tr>
        <td colspan="2" align="left">Endereço</td>
        <td align="left">Número</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="rua" id="rua" type="text" size="45" maxlength="40" value="<%=rs.getString("rua")%>" /></td>
        <td align="left"><input name="numero" type="text" id="numero" style="width:120px" onKeyPress="return numero(this)" size="14" maxlength="6" value="<%=rs.getString("numero")%>" /></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Bairro</td>
        <td align="left">&nbsp;</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="bairro" id="bairro" type="text" size="45" maxlength="30"  value="<%=rs.getString("bairro")%>" /></td>
        <td align="left">&nbsp;</td>
       </tr>
       <tr>
        <td colspan="2" align="left">Cidade</td>
        <td align="left">UF</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="cidade" id="cidade" type="text" size="45" maxlength="30"  value="<%=rs.getString("cidade")%>" /></td>
        <td align="left">
        <select name="uf" id="uf" style="width:48px">
          <option selected="selected" value="<%=rs.getString("uf")%>"><%=rs.getString("uf")%></option> 
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
          <option value="SP">SP</option>
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
            <td colspan="3" align="left"><input type="text" name="complemento" id="complemento" size="70" maxlength="200" value="<%=rs.getString("complemento")%>" /></td>
          </tr>
          <tr align="left">
            <td width="131">Respons&aacute;vel</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input type="text" name="responsavel" id="responsavel" size="70" maxlength="50" value="<%=rs.getString("responsavel")%>" /></td>
          </tr>
          <tr align="left">
            <td width="131">Telefone</td>
            <td width="131">Fax</td>
            <!--<td width="133">Radio</td>-->
          </tr>
          <tr align="left">
           <td><input type="text" name="telefone" id="telefone" size="14" onKeyPress="MascaraTelefone(form1.telefone);" maxlength="14"  onBlur="ValidaTelefone(form1.telefone);" style="width:120px" value="<%=rs.getString("telefone")%>" /></td>
           <td><input type="text" name="fax" id="fax" size="14" maxlength="14" style="width:120px" value="<%=rs.getString("fax")%>" /></td>
           <td></td
           ></tr>
           <tr align="left">
            <td width="131" align="left">Celular</td>
            <td align="left"></td>
            <td width="133"></td>
          </tr>
          <tr align="left">
          <td align="left"><input type="text" name="celular" id="celular" size="14" onKeyPress="MascaraTelefone(form1.celular);" maxlength="15"  onBlur="ValidaTelefone(form1.celular);" style="width:120px" value="<%=rs.getString("celular")%>" />
            
          <td align="left">
          <select name="operadora" id="operadora" style="width:48px">
          <option value="<%=rs.getString("operadora")%>" selected><%=rs.getString("operadora")%></option>
          <option value="TIM">TIM</option>
          <option value="OI">OI</option>
          <option value="VIVO">VIVO</option>
          <option value="CLARO">CLARO</option>
          <option value="Brasil Telecom">Brasil Telecom</option>
          <option value="CTBC">CTBC</option>                      
          </select>
          </td> 
           <td></td>
          </tr>
          <tr align="left">
            <td width="131">E-mail</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input type="text" name="email" id="email" style="text-transform:lowercase;" size="70" maxlength="100" value="<%=rs.getString("email")%>" /></td>
          </tr>
          <tr align="left">
            <td width="131">Site</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input type="text" name="site" id="site" style="text-transform:lowercase;" size="70" maxlength="100" value="<%=rs.getString("site")%>" /></td>
          </tr>
          <tr align="left">
           <td></td>
          </tr>
          <tr align="left">
           <td colspan="2"><input type="submit" name="Cadastrar" class="botao" value="Cadastrar" />             <input type="reset" class="botao" value="Apagar" /></td>
           </tr>
          <tr align="left">
           <td><input type="hidden" name="empresaID" value="<%=rs.getString("empresaID")%>" /></td>
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

<%} %>

</html>