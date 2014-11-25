<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/acesso_nivel.jsp" %>

<jsp:useBean id="cheque" class="financeiro.Cheques" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

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
//Lista todos os cheques que voltaram ou busca por número
if(request.getParameter("numero") != null && request.getParameter("numero") != ""){
	rs = st.executeQuery(cheque.buscaCheques(request.getParameter("numero")));
}else{
	rs = st.executeQuery(cheque.listaCheques());
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
	msg = cheque.mensagem(numeroMsg);
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

<link type="text/css" href="css/paging.css" rel="stylesheet" />	
<script type="text/javascript" src="js/paging.js"></script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
  <td height="25" bgcolor="#EEEEEE">
    <input type="button" class="botao" onclick="javascript: window.location.href='sis_conta_receber.jsp'" value="Contas a Receber" />&nbsp;
    <input type="button" class="botao" onclick="javascript: window.location.href='sis_cheques_voltaram.jsp'" value="Cheques que Voltaram" />
    </td>
</tr>
<tr>
  <td valign="top" align="center">
    <br />
    <table width="690" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="7" align="center"><strong>LISTA DE CHEQUES QUE VOLTARAM</strong></td>
        </tr>
      <tr>
        <td colspan="7" height="15"></td>
        </tr>
      <tr>
        <td colspan="7" height="40" align="left" valign="middle">
          
          <form name="formBusca" method="post">
            <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
              <tr>
                <td width="259" align="right">
                  <input type="text" name="numero" maxlength="100" size="50" style="background-image:url(images/buscacheque.png); height:18px; border:none"  onclick="this.style.backgroundImage = 'none'" onblur="if(this.value == '')this.style.backgroundImage = 'url(images/buscacheque.png)'"/>
                  </td>
                <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="Buscar" /></td>
                </tr>
              </table>
            </form>
          
          </td>
        </tr>
      <tr bgcolor="#EEEEEE">
        <td width="230" align="left"><strong>Cliente</strong></td>
        <td width="180" align="left"><strong>N&deg; Cheque</strong></td>
        <td width="100" align="left"><strong>Telefone</strong></td>
        <td width="120" align="center"><strong>Vencimento</strong></td>
        <td width="60" align="center"><strong>Vs</strong></td>
        </tr>
      <tr>
        <td colspan="7">
          <table id="tb1" width="690" align="center" cellpadding="0" cellspacing="0">  
            <tr>
              <td colspan="7" height="5"></td>
              </tr> 
  <%
//Enquanto a Consulta retonar um resultada, Liste os Funcionarios do Sistema
while (rs.next()){
%>
            
            <tr>
              <td height="30" width="230" align="left"><%=rs.getString("clienteNomeFantasia") %></td>
              <td height="30" width="180" align="left"><%=rs.getString("numeroCheque") %></td>
              <td height="30" width="100" align="left"><%=rs.getString("clienteTelefone") %></td>
              <td height="30" width="120" align="center"><%=data.converteDeData(rs.getString("vencimentoCheque")) %></td>
              <td height="30" width="60" align="center"><a href="sis_detalhe_cheque_devolvido.jsp?receberID=<%=rs.getString("receberID")%>"><img src="ico/ico_visualizar.png" width="20" height="20" border="0" title="Visualizar Cheque do <%=rs.getString("clienteNomeFantasia")%>" /></a></td>
              </tr>
            <tr>
              <td colspan="7" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
              </tr>
            
  <%
}
%>
            </table>
          </td>
        </tr>
      
      <tr>
        <td colspan="7" align="center"><font color="#ff0000"><%=msg %></font></td>
        </tr>
      <tr>
        <td colspan="7" align="center">
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
        var pager = new Pager('tb1', 12); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNav'); 
        pager.showPage(1);
    </script>

</body>
</html>