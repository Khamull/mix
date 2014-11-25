<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ include file="inc/seguranca.jsp" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="produtos" class="cadastro.Produtos" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Recupera o Nivel do Usuário
String nivel = String.valueOf(session.getAttribute("nivel"));
%>

<%
//Trata Ações
//variaveis que serão utilizadas para verificação
String acao = "";
int numeroAcao;
//verifica se passado alguma acao via URL
if(request.getParameter("acao") != null){
	produtos.produtoID = Integer.parseInt(request.getParameter("produtoID"));
	numeroAcao = Integer.parseInt(request.getParameter("acao"));
	st.execute(produtos.statusProduto(numeroAcao));
	response.sendRedirect("sis_view_produtos_mix_publicidade.jsp");
}
%>

<%
//Pesquisa Todos os Fornecedores ou busca por nome
if(request.getParameter("nome") != null){
	rs = st.executeQuery(produtos.pesquisaProdutos(request.getParameter("nome")));
}else if(request.getParameter("codigo") != null){
	String codigo_ = request.getParameter("codigo");
	rs = st.executeQuery(produtos.pesquisaProdutoPorCodigo(codigo_));
}else{
	rs = st.executeQuery(produtos.pesquisaProdutosTodos());
}

%>

<%
//Atribui o objeto salvo na sessao ao objeto empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
//Pesquisa a Unidade que está logada de acordo com a variavel que foi salva na sessao
rs02 = st02.executeQuery(empresa.dadosGerais());
%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = produtos.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Currency"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
 function excluir(produtoID){
	if(confirm("Tem certeza que deseja Excluir esse produto?")){
		window.location.href="sis_delete_manager_produtos.jsp?produtoID="+produtoID;//alterar aqui
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

<link type="text/css" href="css/paging.css" rel="stylesheet" />	
<script type="text/javascript" src="js/paging.js"></script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" /></head>
<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">

<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_produtos_mix_publicidade.jsp'" value="+ Novo Produto" />&nbsp;
 <!-- <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_tipo.jsp'" value="+ Novo Tipo de Produto" />&nbsp;-->
 <!-- <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_tipos.jsp'" value="Lista Tipos de Produto" />&nbsp;-->
 <!-- <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_estoque.jsp'" value="Alimentar Estoque" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_produtos.jsp'" value="Ver Estoque Total" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_transferencia_estoque.jsp'" value="Transfer&ecirc;ncia" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_lista_compras.jsp'" value="Lista de Compras" />-->
 </td>
</tr>
<tr>
 <td valign="top">
 <br />
  <table width="940" align="center" cellpadding="0" cellspacing="0">
  <%if(rs02.next()){ %>
   <tr>
    <td colspan="11" align="center"><strong>LISTA DE PRODUTOS</strong></td>
   </tr>
  <%} %>
   <tr>
     <td colspan="11" height="15" align="center"></font></td>
   </tr>
   <%if(request.getParameter("msg")!=null && request.getParameter("msg")!=""){%>
   <tr>
     <td colspan="11" height="15" align="center"><font color="#ff0000"><%=msg %></font></td>
   </tr>
   <%}%>
   <tr>
    <td colspan="11" height="40" align="left" valign="middle">
    
    <table width="730" align="left">
    <tr>
    <td width="356">
    
    <!-- Busca por Código -->
    <form name="formBuscaCodigo" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" name="codigo" maxlength="100" size="50" style="background-image:url(images/buscacodigo.png); height:18px; border:none"  onclick="this.style.backgroundImage = 'none'" onblur="if(this.value == '')this.style.backgroundImage = 'url(images/buscacodigo.png)'"/>
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCARCODIGO" value="Buscar" /></td>
      </tr>
     </table>
    </form>
    <!-- Fim da Busca por Código -->
    </td>
    <td width="382">
    <!-- Busca por Marca -->  
    <form name="formBusca" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" name="nome" maxlength="100" size="50" style="background-image:url(images/buscamarca.png); height:18px; border:none"  onclick="this.style.backgroundImage = 'none'" onblur="if(this.value == '')this.style.backgroundImage = 'url(images/buscamarca.png)'"/>
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="Buscar" /></td>
      </tr>
     </table>
    </form>
    <!-- Fim da Busca por Marca-->
    </td>
    </tr>
    </table>
    
    </td>
   </tr>
   <tr bgcolor="#EEEEEE">
    <td width="80" align="left"><strong>Codigo</strong></td>
    <td width="200" align="left"><strong>Produto / Descri&ccedil;&atilde;o</strong></td>
    <!-- <td width="160" align="left"><strong>Tipo</strong></td>-->
    <td width="40" align="center"></td>
    <td width="90" align="left"></td>
    <td width="70" align="center"></td>
    <td width="40" align="center"></td>
    <td width="40" align="center"></td>
    <td width="60" align="center"><strong>Ed</strong></td>
    <td width="60" align="center"><strong>At</strong></td>
    <td width="60" align="center"></td>
    <td width="60" align="center">
    <%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
    <strong>Ex</strong>
    <%}%>
    </td>
   </tr>
   <tr>
    <td colspan="11">
     <table id="tb1" width="940" align="center" cellpadding="0" cellspacing="0">  
      <tr>
       <td colspan="10" height="5"></td>
      </tr> 
<%
//Enquanto a Consulta retonar um resultada, Liste os Usuários do Sistema
while (rs.next()){
%>
   
   
<%
//String valor = null;

//Currency currency = Currency.getInstance("BRL");

//DecimalFormat formato = new DecimalFormat("R$ #,##0.00");

//valor = formato.format(rs.getDouble("precoCusto"));
%>


<%
//Pesquisa o Estoque relacionado ao produto de acordo com a unidade em que o usuário
//está logado no Sistema
//produtoEstoque.produto.produtoID = rs.getInt("produtoID");
//produtoEstoque.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));

//rs01 = st01.executeQuery(produtoEstoque.pesquisaEstoque());
%>

   <tr>
    <td height="30" width="80" align="left"><font size="1"><%=rs.getString("codigo")%></font></td>
    <td height="30" width="200" align="left"><%=rs.getString("nome")%></td>
    <td width="40" align="center"></td>
    <td height="30" width="90" align="left"></td>
    <td width="70" align="center"></td>
    <td width="40" align="right"></td>
    <td height="30" width="60" align="center"><a href="sis_update_produtos.jsp?produtoID=<%=rs.getString("produtoID")%>"><img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar <%=rs.getString("nome")%>" /></a></td>
    <td height="30" width="60" align="center">
     <%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
     <%if(rs.getString("ativo").equals("S")){ %>	
     <a href="sis_view_produtos_mix_publicidade.jsp?acao=1&produtoID=<%=rs.getString("produtoID")%>"><img src="ico/ico_ativo.png" width="20" height="20" border="0" title="Desativar <%=rs.getString("nome")%>" /></a>
     <%}else{%>
    	<a href="sis_view_produtos_mix_publicidade.jsp?acao=2&produtoID=<%=rs.getString("produtoID")%>"><img src="ico/ico_inativo.png" width="20" height="20" border="0" title="Ativar <%=rs.getString("nome")%>" /></a>
     <%}%>
    </td>
	
    
    <td height="30" width="60" align="center"></td>
    <td height="30" width="60" align="center">
    <%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
    <a href="javascript:excluir(<%=rs.getString("produtoID")%>)"><img src="ico/ico_excluir.png" width="20" height="20" border="0" title="Excluir <%=rs.getString("nome")%>" /></a>
    <%}%>
    </td>
   </tr>
   <tr>
    <td colspan="11" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>

<%
}
}
%>
   </table>
   </td>
   </tr>
	
	<tr>
	 <td colspan="11" align="center"></td>
	</tr>
    <tr>
     <td colspan="11" align="center">
      <!-- div onde será criados os links da paginaçao -->
	  <div id="pageNav"></div>
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

	<script>
        var pager = new Pager('tb1', 24); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNav'); 
        pager.showPage(1);
    </script>

</body>
</html>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>