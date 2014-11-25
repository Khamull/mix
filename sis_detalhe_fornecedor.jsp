<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="fornecedor" class="cadastro.Fornecedor" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera o ID do Fornecedor
fornecedor.fornecedorID = Integer.parseInt(request.getParameter("fornecedorID"));

//Pesquisa dados do Fornecedor 
rs = st.executeQuery(fornecedor.fornecedorPorID());
%>

<%
//Trata mensagens
//variaveis que serao utilizadas para verificaçao
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = fornecedor.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
 function excluir(fornecedorID){
	if(confirm("Tem certeza que deseja Excluir esse fornecedor?")){
		window.location.href="sis_delete_manager_fornecedor.jsp?fornecedorID="+fornecedorID;
	}
 }
</script>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->

<script type="text/javascript">

//Verificar e Formulário
function verForm(){

	if(document.form1.clienteNomeFantasia.value == ""){
	alert("Favor informar o nome Fantasia!");
	document.form1.fornNomeFantasia.focus();
	return false;
	}
	

	if(document.form1.clienteCnpj.value.length < 11){
	alert("Favor informar o CPF / CNPJ!");
	document.form1.fornCnpj.focus();
	return false;
	}


	if(document.form1.clienteEndereco.value == ""){
	alert("Favor informar o Endereço!");
	document.form1.fornEndereco.focus();
	return false;
	}

	if(document.form1.clienteNumero.value == ""){
	alert("Favor informar o Número!");
	document.form1.fornNumero.focus();
	return false;
	}	

	if(document.form1.clienteBairro.value == ""){
	alert("Favor informar o Bairro!");
	document.form1.fornBairro.focus();
	return false;
	}
	
	if(document.form1.clienteCep.value.lenght < 8){
	alert("Favor informar o Cep!");
	document.form1.fornCep.focus();
	return false;
	}

	if(document.form1.clienteCidade.value == ""){
	alert("Favor informar o Cidade!");
	document.form1.fornCidade.focus();
	return false;
	}	
	
	if(document.form1.clienteUf.value == ""){
	alert("Favor informar o Estado (UF)!");
	document.form1.fornUf.focus();
	return false;
	}

	if(document.form1.clienteContato.value == ""){
	alert("Favor informar o nome do Contato (Representante)!");
	document.form1.fornContato.focus();
	return false;
	}
	
	if(document.form1.clienteTelefone.value.length < 8){
	alert("Favor informar o número de telefone!");
	document.form1.fornTelefone.value = "";
	document.form1.fornTelefone.focus();
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
<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">

<!--INICIO DO FORMULÁRIO DE CADASTRO-->
 <form name="form1" action="sis_update_manager_fornecedor.jsp" method="POST" id="form1" onSubmit="return verForm(this)">
   <table width="985" height="440">
    <tr>
    <td height="25" bgcolor="#EEEEEE" colspan="2">
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_fornecedores.jsp'" value="Lista Fornecedores" /> &nbsp;
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_fornecedor.jsp'" value="+ Novo Fornecedor" />
    </td>
    </tr>
    <tr>
     <td height="20" colspan="2" align="center"><strong>VISUALISAR FORNECEDOR</strong></td>
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
         <td align="left">Nome Fantasia</td>
       </tr>
       <tr>
        <td colspan="3" align="left"><input name="fornNomeFantasia" type="text" id="fornNomeFantasia" value="<%=rs.getString("fornNomeFantasia")%>" size="70" maxlength="40" readonly="readonly"/></td>
       </tr>
       <tr>
        <td align="left">Razao Social</td>
       </tr>
       <tr>
        <td colspan="3" align="left"><input name="fornRazaoSocial" type="text" id="fornRazaoSocial" value="<%=rs.getString("fornRazaoSocial")%>" size="70" maxlength="40" readonly="readonly"/></td>
       </tr>
       <tr align="left">
        <td>CNPJ</td>
        <td>Inscriçao Estadual</td>
        <td>Inscriçao Municipal</td>
       </tr>
       <tr>
        <td align="left"><input name="fornCnpj" type="text" id="fornCnpj" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("fornCnpj")%>" size="14" maxlength="14" readonly="readonly"></td>
        <td align="left"><input name="fornInscEstadual" type="text" id="fornInscEstadual" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("fornInscEstadual")%>" size="14" maxlength="14" readonly="readonly"></td>
        <td align="left"><input name="fornInscMunicipal" type="text" id="fornInscMunicipal" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("fornInscMunicipal")%>" size="14" maxlength="14" readonly="readonly"></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Endereço</td>
        <td align="left">Número</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="fornEndereco" type="text" id="fornEndereco" value="<%=rs.getString("fornEndereco")%>" size="45" maxlength="40" readonly="readonly"/></td>
        <td align="left"><input name="fornNumero" type="text" id="fornNumero" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("fornNumero")%>" size="14" maxlength="6" readonly="readonly"/></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Bairro</td>
        <td align="left">CEP</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="fornBairro" type="text" id="fornBairro" value="<%=rs.getString("fornBairro")%>" size="45" maxlength="40" readonly="readonly"/></td>
        <td align="left"><input name="fornCep" type="text" id="fornCep" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("fornCep")%>" size="14" maxlength="10" readonly="readonly"/></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Cidade</td>
        <td align="left">UF</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="fornCidade" type="text" id="fornCidade" value="<%=rs.getString("fornCidade")%>" size="45" maxlength="40" readonly="readonly"/></td>
        <td align="left">
        <select name="fornUf" id="fornUf" style="width:48px">
          <option  value="<%=rs.getString("fornUf")%>" selected="selected"><%=rs.getString("fornUf")%></option>
          <!--<option value="AC">AC</option>
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
          <option value="TO">TO</option> -->                       
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
            <td colspan="3" align="left"><input name="fornComplemento" type="text" id="fornComplemento" value="<%=rs.getString("fornComplemento")%>" size="70" maxlength="200" readonly="readonly"/></td>
          </tr>
          <tr align="left">
            <td width="131">Contato</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input name="fornContato" type="text" id="fornContato" value="<%=rs.getString("fornContato")%>" size="70" maxlength="30" readonly="readonly"/></td>
          </tr>
          <tr align="left">
            <td width="131">Telefone</td>
            <td width="131">Fax</td>
            <!--<td width="133">Radio</td>-->
          </tr>
          <tr align="left">
           <td><input name="fornTelefone" type="text" id="fornTelefone" style="width:120px" value="<%=rs.getString("fornTelefone")%>" size="14" maxlength="14" readonly="readonly"></td>
           <td><input name="fornFax" type="text" id="fornFax" style="width:120px" value="<%=rs.getString("fornFax")%>" size="14" maxlength="14" readonly="readonly"></td>
           <td><input type="hidden" name="fornRadio" id="fornRadio" size="14" maxlength="14" style="width:120px" value="<%=rs.getString("fornRadio")%>"></td
           ></tr>
           <tr align="left">
            <td width="131" align="left">Celular</td>
            <td align="left"></td>
            <td width="133"></td>
          </tr>
          <tr align="left">
          <td align="left"><input name="fornCelular" type="text" id="fornCelular" style="width:120px" value="<%=rs.getString("fornCelular")%>" size="14" maxlength="14" readonly="readonly">
            
          <td align="left">
          <select name="operadoraCelular" id="operadoraCelular" style="width:48px">
          <option  value="<%=rs.getString("operadoraCelular")%>" selected="selected"><%=rs.getString("operadoraCelular")%></option>
          <!--<option value="TIM">TIM</option>
          <option value="OI">OI</option>
          <option value="VIVO">VIVO</option>
          <option value="CLARO">CLARO</option>
          <option value="Brasil Telecom">Brasil Telecom</option>
          <option value="CTBC">CTBC</option>-->                      
          </select>
          </td> 
           <td></td>
          </tr>
          <tr align="left">
            <td width="131">E-mail</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input name="fornEmail" type="text" id="fornEmail" style="text-transform:lowercase;" value="<%=rs.getString("fornEmail")%>" size="70" maxlength="100" readonly="readonly"/></td>
          </tr>
          <tr align="left">
            <td width="131">Site</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input name="fornSite" type="text" id="fornSite" style="text-transform:lowercase;"  value="<%=rs.getString("fornSite")%>" size="70" maxlength="100" readonly="readonly"></td>
          </tr>
          <tr align="left">
           <td>
            <input type="hidden" name="fornUsuario" id="fornUsuario" value="<%=session.getAttribute("usuario")%>">
            <input type="hidden" name="fornecedorID" value="<%=rs.getString("fornecedorID")%>" />
           </td>
          </tr>
          <tr align="left">
           <td colspan="2"><input type="button" onclick="javascript: window.location.href='sis_view_fornecedores.jsp'" value="&lt;&lt; Voltar" class="botao" /></td>
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
<%} %>
</html>