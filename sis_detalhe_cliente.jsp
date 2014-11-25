<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera o ID do Cliente
cliente.clienteID = Integer.parseInt(request.getParameter("clienteID"));

//Pesquisa dados do Cliente 
rs = st.executeQuery(cliente.clienteID());
%>

<%
//Trata mensagens
//variaveis que serao utilizadas para verificaçao
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = cliente.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
 function excluir(clienteID){
	if(confirm("Tem certeza que deseja Excluir esse cliente?")){
		window.location.href="sis_delete_manager_cliente.jsp?clienteID="+clienteID;
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

function tipoCliente(tipoCli){

	if(tipoCli == "0"){
		document.getElementById('nom').style.display = 'inline';
		document.getElementById('nomFan').style.display = 'none';
		document.getElementById('razSoci').style.display = 'none';
		document.getElementById('razSociInput').style.display = 'none';
		document.getElementById('cnp').style.display = 'none';
		document.getElementById('cp').style.display = 'inline';
		document.getElementById('inscEst').style.display = 'none';
		document.getElementById('inscMun').style.display = 'none';
		document.getElementById('inscEstInput').style.display = 'none';
		document.getElementById('inscMunInput').style.display = 'none';
		//document.form1.clienteNomeFantasia.focus();
	}else{
		document.getElementById('nom').style.display = 'none';
		document.getElementById('nomFan').style.display = 'inline';
		document.getElementById('razSoci').style.display = 'inline';
		document.getElementById('razSociInput').style.display = 'inline';
		document.getElementById('cnp').style.display = 'inline';
		document.getElementById('cp').style.display = 'none';
		document.getElementById('inscEst').style.display = 'inline';
		document.getElementById('inscMun').style.display = 'inline';
		document.getElementById('inscEstInput').style.display = 'inline';
		document.getElementById('inscMunInput').style.display = 'inline';
		//document.form1.clienteNomeFantasia.focus();
	}	
	
}


//Muda alguns Campos de acordo com o Tipo de Pessoa Escolhido
function tipoPessoa(){

	var tipo = document.form1.tipoCliente.value;
	
	if(tipo == "0"){
		alert("Cadastro de Pessoa Fisica");
		document.getElementById('nom').style.display = 'inline';
		document.getElementById('nomFan').style.display = 'none';
		document.getElementById('razSoci').style.display = 'none';
		document.getElementById('razSociInput').style.display = 'none';
		document.getElementById('cnp').style.display = 'none';
		document.getElementById('cp').style.display = 'inline';
		document.getElementById('inscEst').style.display = 'none';
		document.getElementById('inscMun').style.display = 'none';
		document.getElementById('inscEstInput').style.display = 'none';
		document.getElementById('inscMunInput').style.display = 'none';
	}else{
		alert("Cadastro de Pessoa Juridica");
		document.getElementById('nom').style.display = 'none';
		document.getElementById('nomFan').style.display = 'inline';
		document.getElementById('razSoci').style.display = 'inline';
		document.getElementById('razSociInput').style.display = 'inline';
		document.getElementById('cnp').style.display = 'inline';
		document.getElementById('cp').style.display = 'none';
		document.getElementById('inscEst').style.display = 'inline';
		document.getElementById('inscMun').style.display = 'inline';
		document.getElementById('inscEstInput').style.display = 'inline';
		document.getElementById('inscMunInput').style.display = 'inline';
	}
	
}


//Verificar e Formulário
function verForm(){

	if(document.form1.clienteNomeFantasia.value == ""){
	alert("Favor informar o nome Fantasia!");
	document.form1.clienteNomeFantasia.focus();
	return false;
	}
	

	if(document.form1.clienteCnpj.value.length < 11){
	alert("Favor informar o CPF / CNPJ!");
	document.form1.clienteCnpj.focus();
	return false;
	}


	if(document.form1.clienteEndereco.value == ""){
	alert("Favor informar o Endereço!");
	document.form1.clienteEndereco.focus();
	return false;
	}

	if(document.form1.clienteNumero.value == ""){
	alert("Favor informar o Número!");
	document.form1.clienteNumero.focus();
	return false;
	}	

	if(document.form1.clienteBairro.value == ""){
	alert("Favor informar o Bairro!");
	document.form1.clienteBairro.focus();
	return false;
	}
	
	if(document.form1.clienteCep.value.lenght < 8){
	alert("Favor informar o Cep!");
	document.form1.clienteCep.focus();
	return false;
	}

	if(document.form1.clienteCidade.value == ""){
	alert("Favor informar o Cidade!");
	document.form1.clienteCidade.focus();
	return false;
	}	
	
	if(document.form1.clienteUf.value == ""){
	alert("Favor informar o Estado (UF)!");
	document.form1.clienteUf.focus();
	return false;
	}

	if(document.form1.clienteContato.value == ""){
	alert("Favor informar o nome do Contato (Representante)!");
	document.form1.clienteContato.focus();
	return false;
	}

    if(document.form1.limiteCredito.value == ""){
	alert("Favor informar o Limite de Credito!");
	document.form1.limiteCredito.focus();
	return false;
	}
	
	if(document.form1.clienteTelefone.value.length < 8){
	alert("Favor informar o número de telefone!");
	document.form1.clienteTelefone.value = "";
	document.form1.clienteTelefone.focus();
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
<body onload="javascript: tipoCliente(<%=rs.getString("tipoPessoa")%>)">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">

<!--INICIO DO FORMULÁRIO DE CADASTRO-->
 <form name="form1" action="sis_insert_manager_cliente.jsp" method="POST" id="form1" onSubmit="return verForm(this)">
   <table width="985" height="440">
    <tr>
    <td height="25" bgcolor="#EEEEEE" colspan="2">
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_clientes.jsp'" value="Lista Clientes" /> &nbsp;
      <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_cliente.jsp'" value="+ Novo Cliente" />
    </td>
    </tr>
    <tr>
     <td height="20" colspan="2" align="center"><strong>VISUALIZAR CLIENTE</strong></td>
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
         <td align="left" colspan="4">
         Selecione o tipo de Cliente:&nbsp;&nbsp;&nbsp;&nbsp;
         <select name="tipoCliente" onchange="tipoPessoa()">
          <option value="<%=rs.getString("tipoPessoa")%>">
          <%
		  //verifica qual tipo de Cliente e mostra na Option
		  String x = rs.getString("tipoPessoa");
		  
		  if(x.equals("0")){%>
          Pessoa Fisica
          <%}else{%>
          Pessoa Juridica
          <%}%>
          </option>
  		  <!--<option value="0">Pessoa Fisica</option>
          <option value="1">Pessoa Juridica</option>-->
 		 </select>
         </td>
         </tr>
       <tr>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
        <td align="left"><div id="nomFan" style="display:none">Nome Fantasia</div><div id="nom">Nome</div></td>
       </tr>
       <tr>
        <td colspan="3" align="left"><input name="clienteNomeFantasia" type="text" id="clienteNomeFantasia" value="<%=rs.getString("clienteNomeFantasia")%>" size="70" maxlength="40" readonly="readonly"/></td>
       </tr>
       <tr>
        <td align="left"><div id="razSoci" style="display:none">Razao Social</div></td>
       </tr>
       <tr>
        <td colspan="3" align="left"><div id="razSociInput" style="display:none"><input type="text" name="clienteRazaoSocial" id="clienteRazaoSocial" size="70" maxlength="40" value="<%=rs.getString("clienteRazaoSocial")%>" readonly="readonly"/></div></td>
       </tr>
       <tr align="left">
        <td><div id="cnp" style="display:none">CNPJ</div><div id="cp">CPF</div></td>
        <td><div id="inscEst" style="display:none">Inscriçao Estadual</div></td>
        <td><div id="inscMun" style="display:none">Inscriçao Municipal</div></td>
       </tr>
       <tr>
        <td align="left"><input name="clienteCnpj" type="text" id="clienteCnpj" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("clienteCnpj")%>" size="14" maxlength="14" readonly="readonly"></td>
        <td align="left"><div id="inscEstInput" style="display:none"><input type="text" name="clienteInscEstadual" id="clienteInscEstadual" size="14" maxlength="14" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("clienteInscEstadual")%>" readonly="readonly"></div></td>
        <td align="left"><div id="inscMunInput" style="display:none"><input type="text" name="clienteInscMunicipal" id="clienteInscMunicipal" size="14" maxlength="14" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("clienteInscMunicipal")%>" readonly="readonly"></div></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Endereço</td>
        <td align="left">Número</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="clienteEndereco" type="text" id="clienteEndereco" value="<%=rs.getString("clienteEndereco")%>" size="45" maxlength="40" readonly="readonly"/></td>
        <td align="left"><input name="clienteNumero" type="text" id="clienteNumero" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("clienteNumero")%>" size="14" maxlength="6" readonly="readonly"/></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Bairro</td>
        <td align="left">CEP</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="clienteBairro" type="text" id="clienteBairro" value="<%=rs.getString("clienteBairro")%>" size="45" maxlength="40" readonly="readonly"/></td>
        <td align="left"><input name="clienteCep" type="text" id="clienteCep" style="width:120px" onKeyPress="return numero(this)" value="<%=rs.getString("clienteCep")%>" size="14" maxlength="10" readonly="readonly"/></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Cidade</td>
        <td align="left">UF</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="clienteCidade" type="text" id="clienteCidade" value="<%=rs.getString("clienteCidade")%>" size="45" maxlength="40" readonly="readonly"/></td>
        <td align="left">
        <select name="clienteUf" id="clienteUf" style="width:48px">
          <option  value="<%=rs.getString("clienteUf")%>" selected="selected"><%=rs.getString("clienteUf")%></option>
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
          <option value="TO">TO</option>-->                        
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
            <td colspan="3" align="left"><input name="clienteComplemento" type="text" id="clienteComplemento" value="<%=rs.getString("clienteComplemento")%>" size="70" maxlength="200" readonly="readonly"/></td>
          </tr>
          <tr align="left">
            <td width="131">Contato</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input name="clienteContato" type="text" id="clienteContato" value="<%=rs.getString("clienteContato")%>" size="70" maxlength="30" readonly="readonly"/></td>
          </tr>
          <!--<tr>
            <td width="131" align="left">Limite de Credito</td>
          </tr>
          <tr>
            <td colspan="3" align="left"><input name="limiteCredito" type="text" id="limiteCredito" style="width:120px" value="0.00" size="14" maxlength="14"/></td>
          </tr>-->
          <tr align="left">
            <td width="131">Telefone</td>
            <td width="131">Fax</td>
            <!--<td width="133">Radio</td>-->
          </tr>
          <tr align="left">
           <td><input name="clienteTelefone" type="text" id="clienteTelefone" style="width:120px" value="<%=rs.getString("clienteTelefone")%>" size="14" maxlength="14" readonly="readonly"></td>
           <td><input name="clienteFax" type="text" id="clienteFax" style="width:120px" value="<%=rs.getString("clienteFax")%>" size="14" maxlength="14" readonly="readonly"></td>
           <td><input type="hidden" name="clienteRadio" id="clienteRadio" size="14" maxlength="14" style="width:120px" value="<%=rs.getString("clienteRadio")%>"></td
           ></tr>
           <tr align="left">
            <td width="131" align="left">Celular</td>
            <td align="left"></td>
            <td width="133"></td>
          </tr>
          <tr align="left">
          <td align="left"><input name="clienteCelular" type="text" id="clienteCelular" style="width:120px" value="<%=rs.getString("clienteCelular")%>" size="14" maxlength="14" readonly="readonly">
            
          <td align="left">
          <select name="operadoraCelular" id="operadoraCelular" style="width:48px">
          <option  value="<%=rs.getString("operadoraCelular")%>" selected="selected"><%=rs.getString("operadoraCelular")%></option>
          <!--<option value="TIM">TIM</option>
          <option value="OI">OI</option>
          <option value="VIVO">VIVO</option>
          <option value="CLARO">CLARO</option>
          <option value="Brasil Telecom">Brasil Telecom</option>
          <option value="CTBC">CTBC</option>  -->                    
          </select>
          </td> 
           <td></td>
          </tr>
          <tr align="left">
            <td width="131">E-mail</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input name="clienteEmail" type="text" id="clienteEmail" style="text-transform:lowercase;" value="<%=rs.getString("clienteEmail")%>" size="70" maxlength="100" readonly="readonly"/></td>
          </tr>
          <tr align="left">
            <td width="131">Site</td>
          </tr>
          <tr align="left">
            <td colspan="3"><input name="clienteSite" type="text" id="clienteSite" style="text-transform:lowercase;"  value="<%=rs.getString("clienteSite")%>" size="70" maxlength="100" readonly="readonly"></td>
          </tr>
          <tr align="left">
           <td>
            <input type="hidden" name="clienteUsuario" id="usuarioNome" value="<%=session.getAttribute("usuario")%>">
            <input name="limiteCredito" type="hidden" id="limiteCredito" style="width:120px" value="0.00" size="14" maxlength="14"/>
           </td>
          </tr>
          <tr align="left">
           <td colspan="2"><input type="button" class="botao" onclick="javascript: window.location.href='sis_view_clientes.jsp'" value="&lt;&lt; Voltar" /> </td>
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