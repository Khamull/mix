<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>


<%
//Pesquisa a lista completa de unidades cadastradas
rs = st.executeQuery(empresa.listaTodasEmpresas());
%>


<%
//Trata Açoes
//variaveis que serao utilizadas para verificaçao
String acao = "";
int numeroAcao;
//verifica se passado alguma acao via URL
if(request.getParameter("acao") != null){
	empresa.empresaID = Integer.parseInt(request.getParameter("empresaID"));
	numeroAcao = Integer.parseInt(request.getParameter("acao"));
	st01.execute(empresa.statusEmpresa(numeroAcao));
	response.sendRedirect("sis_view_unidades.jsp");
}
%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = empresa.mensagem(numeroMsg);
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
<table width="985" align="center" height="385">
<tr>
 <td height="25" bgcolor="#EEEEEE">
  <input type="button" class="botao" onclick="javascript: window.location.href='sis_update_empresa.jsp'" value="Matriz" />&nbsp;
  <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_filial.jsp'" value="+ Nova Filial" />
 </td>
</tr>
<tr>
 <td height="25" align="center"><strong>LISTA DE UNIDADES</strong></td>
</tr>
<%if(request.getParameter("msg") != null){ %>
 <tr>
  <td height="20" align="center"><font color="#ff0000"><strong><%=msg %></strong></font></td>
 </tr>
<%}%>
<tr>
 <td valign="top" align="center">
 
  <table width="910" align="center" cellpadding="0" cellspacing="0">
   <tr>
     <td colspan="5" align="center">&nbsp;</td>
   </tr>
   <tr bgcolor="#EEEEEE">
    <td width="495" align="left"><strong>Unidade</strong></td>
    <td width="121" align="left"><strong>Telefone</strong></td>
    <td width="172" align="left"><strong>Respons&aacute;vel</strong></td>
    <td width="60" align="center"><strong>Vs</strong></td>
    <td width="60" align="center"><strong>Ed</strong></td>
   </tr>
   
   <%while(rs.next()){ %>
   <tr>
    <td width="495" height="30" align="left">
    <font color="#003399"><%=rs.getString("unidade") %></font> - <%=rs.getString("cidade") %> <b>|</b> <%=rs.getString("rua") %>, <%=rs.getString("numero") %>,
	<%=rs.getString("bairro") %>, <%=rs.getString("uf") %>
    </td>
    <td width="121" align="left"><%=rs.getString("telefone") %></td>
    <td width="172" align="left"><%=rs.getString("responsavel") %></td>
    <%
	//Verifica o status se está ativo ou nao
	String status = rs.getString("empresaAtiva");
	if(status.equals("S")){
	%>
    <td height="30" width="60" align="center"><a href="sis_view_unidades.jsp?acao=1&empresaID=<%=rs.getString("empresaID")%>"><img src="ico/ico_ativo.png" width="20" height="20" border="0" title="Desativar <%=rs.getString("unidade")%>" /></a></td>
    <%}else if(status.equals("N")){%>
    <td height="30" width="60" align="center"><a href="sis_view_unidades.jsp?acao=2&empresaID=<%=rs.getString("empresaID")%>"><img src="ico/ico_inativo.png" width="20" height="20" border="0" title="Ativar <%=rs.getString("unidade")%>" /></a></td>
    <%}%>
    <td width="60" align="center">
    
    <%
    //Na linha de baixo é feita uma verificação para saber se a empresa é a Matriz,
    //caso seja a Matriz não permitiremos editar a descrição da unidade,
    //sendo assim o usuário é redirecionado para a página de editar a Matriz
    %>    
    <%if(rs.getString("empresaID").equals("1")){ %>
     <a href="sis_update_empresa.jsp">
     <img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar <%=rs.getString("unidade") %>" />
     </a>
    <%}else{ %>
     <a href="sis_update_unidade.jsp?empresaID=<%=rs.getString("empresaID") %>">
     <img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar <%=rs.getString("unidade") %>" />
     </a>
    <%} %>
    
    </td>
   </tr>
   <tr>
    <td align="center" colspan="5" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>
   <%} %>
   
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