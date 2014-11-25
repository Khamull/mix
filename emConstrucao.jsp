<%@ page errorPage="index.jsp?erro=3" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs = null;

%>

<%
//Atribui valores ao objeto caixa
caixa.usuario.login = (String)session.getAttribute("usuario");

//Pesquisa se já existe um caixa Aberto com esse Usuário que está logado
rs = st.executeQuery(caixa.verificaCaixa());
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>
<script type="text/javascript" src="js/jquery.js"></script>
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

<div id="topo"></div>


<div id="corpo"><jsp:include page="inc/menu_principal.jsp" /></div>


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
