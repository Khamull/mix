<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>



<%
//Trata mensagens
//variaveis que serăo utilizadas para verificaçăo
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
 <td height="25" bgcolor="#EEEEEE"></td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <table width="880" align="center">
  <tr>
   <td colspan="4" align="center"><strong>LISTA DE RELAT&Oacute;RIOS DO SISTEMA</strong></td>
  </tr>
  <tr>
   <td colspan="4" align="center" height="20"></td>
  </tr>
  <tr>
   <td width="220" align="left"><a href="#" onclick="javascript: window.open('relatorios/rep_usuarios_relacao.jsp', 'Fornecedores', 'width = 800; height = 600; scrollbars=yes')">&gt; Usu&aacute;rios</a></td>
   <td width="220" align="left"><a href="relatorios/select_retiradas_estoque.jsp">&gt; Retiradas do Estoque</a></td>
   <td width="220" align="left"><a href="relatorios/select_contas_receber.jsp">&gt; Contas a Receber</a></td>
   <td width="200" align="left"><a href="relatorios/select_contas_pagar.jsp">&gt; Contas a Pagar</a></td>
  </tr>
  <tr>
   <td align="left"><a href="#" onclick="javascript: window.open('relatorios/rep_funcionarios_relacao.jsp', 'Fornecedores', 'width = 800; height = 600; scrollbars=yes')">&gt; Funcion&aacute;rios</a></td>
   <td align="left"><a href="relatorios/select_transferencias_bancaria.jsp">&gt; Transferencias Bancaria</a></td>
   <td align="left"><a href="relatorios/select_contas_recebidas.jsp">&nbsp;&nbsp;&nbsp;- Contas Recebidas</a></td>
   <td align="left"><a href="relatorios/select_contas_pagas.jsp">&nbsp;&nbsp;&nbsp;- Contas Pagas</a></td>
  </tr>
  <tr>
   <td align="left"><a href="#" onclick="javascript: window.open('relatorios/rep_clientes_relacao.jsp', 'Fornecedores', 'width = 800; height = 600; scrollbars=yes')">&gt; Clientes</a></td>
   <td align="left"><a href="relatorios/select_produtos.jsp">&gt; Produtos</a></td>
   <td align="left"><a href="relatorios/select_vendas.jsp">&gt; Vendas</a></td>
   <td align="left"><a href="relatorios/select_livro_caixa.jsp">&gt; Livro Caixa</a></td>
  </tr>
  <tr>
    <td align="left"><a href="#" onclick="javascript: window.open('relatorios/rep_fornecedores_relacao.jsp', 'Fornecedores', 'width = 800; height = 600; scrollbars=yes')">&gt; Fornecedores</a></td>
    <td align="left"><a href="relatorios/select_produtos_sempreco.jsp">&nbsp;&nbsp;&nbsp;- Produtos (sem preco)</a></td>
    <td align="left"><a href="#" onclick="javascript: window.open('relatorios/rep_quantidade_produto.jsp', 'Fornecedores', 'width = 800; height = 600; scrollbars=yes')">&gt; Qtd Produto em Estoque</a></td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left"></td>
    <td align="left"></td>
    <td align="left"></td>
  </tr>
  <tr>
   <td align="left">&nbsp;</td>
   <td align="left"></td>
   <td align="left"></td>
   <td align="left"></td>
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