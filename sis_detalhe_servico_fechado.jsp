<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoitem" class="servico.ServicoItem" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="forma" class="pdv.FormaPagamento" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01;
ResultSet rs02;
ResultSet rs03;
%>


<%
//Recupera o ID do Serviço trazido via URL e atribui ao objeto servico
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
%>


<%
//Pesquisa informações sobre o Serviço
rs = st.executeQuery(servico.pesquisaServico());
%>


<%
//Psquisa todos os itens adicionados ao Serviço
servicoitem.servico.servicoID = servico.servicoID;
rs01 = st01.executeQuery(servicoitem.listaItens());
%>


<%
//Pesquisa todos os produtos adicionados ao Servico
servicoproduto.servico.servicoID = servico.servicoID;
rs02 = st02.executeQuery(servicoproduto.listaProdutos());
%>

<%
//Converte para o Formato Data
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
}


function addServico(servicoID){
	if (confirm("Adicionar Servico?")){
		window.open("sis_add_servico.jsp?servicoID="+servicoID+" ", "Adicionar", "width=450px, height=250px");
	}	
}

function addProduto(servicoID){
	if (confirm("Adicionar Produto?")){
		window.open("sis_add_produto.jsp?servicoID="+servicoID+" ", "Adicionar", "width=500px, height=250px");
	}
}

function excluir(servicoitemID, servicoID){
	if(confirm("Tem certeza que deseja Excluir esse Serviço?")){
		window.location.href="sis_exc_manager_servico.jsp?servicoitemID="+servicoitemID+"&servicoID="+servicoID;
	}
}

function excluirProd(servicoprodutoID, servicoID){
	if(confirm("Tem certeza que deseja Excluir esse Produto?")){
		window.location.href="sis_exc_manager_produto.jsp?servicoprodutoID="+servicoprodutoID+"&servicoID="+servicoID;
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

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_livro_caixa.jsp'" value="Lista Bancos" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 <%if(rs.next()){ %>
 <table width="696" align="center" cellpadding="2" cellspacing="2">
  <tr bgcolor="#EEEEEE">
   <td colspan="4" align="center"><strong>VISUALIZAR SERVI&Ccedil;O</strong></td>
  </tr>
  <tr>
    <td align="left">N&deg; Servi&ccedil;o</td>
    <td align="left"><%=rs.getString("servicoID") %></td>
    <td width="52" align="left">Cliente</td>
    <td width="240" align="left"><%=rs.getString("clienteNomeFantasia") %></td>
  </tr>
  <tr>
    <td width="66" align="left">Inicio</td>
    <td width="164" align="left"><%=data.converteDeData(rs.getString("dataInicio")) %></td>
    <td colspan="2" align="left">&Uacute;ltima Altera&ccedil;&atilde;o&nbsp; &nbsp; <%=data.converteDeData(String.valueOf(rs.getDate("dataFim"))) %></td>
    </tr>
  <tr bgcolor="#F9F6F2">
    <td align="left">VALOR TOTAL</td>
    <td align="left"><font color="#009900"><strong><%=formato.format(rs.getDouble("valor")) %></strong></font></td>
    <td colspan="2" align="right"></td>
  </tr>
<!--  <tr bgcolor="#FFFF99">
   <td colspan="4" align="center">Descri&ccedil;&atilde;o do Servi&ccedil;o ( DIAGN&Oacute;STICO )</td>
   </tr>
  <tr>
   <td colspan="4" align="center">
    <pre style="white-space:pre-line; width:696px; text-align:left"><%=rs.getString("descricao")%></pre>   </td>
  </tr>
  <tr>
    <td colspan="4" align="center"><hr color="#FFFF99" /></td>
  </tr>-->
  <tr valign="middle">
    <td colspan="4" align="center" bgcolor="#52658C"><font color="#FFFFFF">Servi&ccedil;os Adicionados</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
  		
        <table width="690" align="center">
        <%while(rs01.next()){ %>
         <tr>
          <td width="530" align="left"><%=rs01.getString("descricao") %></td>
          <td width="106" align="center"><%=formato.format(rs01.getDouble("valor")) %></td>
          <td width="38" align="center">&nbsp;</td>
         </tr>
         <tr>
          <td align="center" colspan="3"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         <%} %>
        </table>    </td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr align="center" valign="middle" bgcolor="#52658C">
    <td colspan="4"><font color="#FFFFFF">Produtos Adicionados</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
    
      <table width="690" align="center">
        <%while(rs02.next()){ %>
         <tr>
          <td colspan="2" align="left"><%=rs02.getString("nome") %></td>
          <td width="107" align="center"><%=formato.format(rs02.getDouble("valor")) %></td>
          <td width="38" align="center">&nbsp;</td>
         </tr>
         <tr>
          <td align="center" colspan="4"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         <%} %>
         
         
         
         <tr>
         <td align="left" colspan="4"><hr></td>
        </tr>
        <tr>
         <td align="left" colspan="4" height="30"></td>
        </tr>
        
        <%
        //Declara variaveis para receber valor formatado para Moeda
        String total;
        String totalParcial;
        String desconto;
        String pago;
        String troco;
        String faltaPagar;
        double devendo;
        String valorParcela;
        %>
        
        <%
        //Formata os valores para Moeda e atribui as variaveis
        total = formato.format(rs.getDouble("valor") + rs.getDouble("desconto"));
        totalParcial = formato.format(rs.getDouble("valor"));
        desconto = formato.format(rs.getDouble("desconto"));
        pago = formato.format(rs.getDouble("entrada"));
        troco = formato.format(rs.getDouble("troco"));
        faltaPagar = formato.format(rs.getDouble("valor") - rs.getDouble("entrada"));
        devendo = rs.getDouble("valor") - rs.getDouble("entrada");
        valorParcela = formato.format(devendo / rs.getDouble("vezes"));
        %>
        
        <%
        //Recupera o ID da Forma de Pagamento e pesquisa o nome
        forma.formPagID = rs.getInt("formPagID");
        
        String formaPagamento = "";
        
        rs03 = st03.executeQuery(forma.formaPorID());
        
        //Verifica se retornou algum resultado e atribui a variavel
        if(rs03.next()){
            formaPagamento = rs03.getString("descricao");
        }
        %>
        
        <tr>
         <td width="164" align="left">Total do Pedido</td>
         <td width="361" align="left"><strong><%=total %></strong></td>
         <td align="left">&nbsp;</td>
         <td align="right">&nbsp;</td>
        </tr>
        <tr>
         <td align="left">Desconto</td>
         <td align="left"><%=desconto %></td>
         <td align="left">&nbsp;</td>
         <td align="right">&nbsp;</td>
        </tr>
        <%if(rs.getDouble("desconto") > 0){%>
        <tr>
         <td align="left">Total com Desconto</td>
         <td align="left"><strong><%=totalParcial%></strong></td>
         <td align="left">&nbsp;</td>
         <td align="right">&nbsp;</td>
        </tr>
        <%}%>
        
        <% if(forma.formPagID != 1){ %>
        <tr>
         <td align="left">Entrada</td>
         <td align="left"><%=pago%></td>
         <td align="left">&nbsp;</td>
         <td align="right">&nbsp;</td>
        </tr>
        <tr>
         <td align="left"><%=formaPagamento%></td>
         <td align="left"><%=faltaPagar%></td>
         <td align="left">&nbsp;</td>
         <td align="right">&nbsp;</td>
        </tr>
        <%}%>
        
        <tr>
         <td align="left">Total Pago</td>
         <td align="left"><%if(forma.formPagID != 1 && forma.formPagID != 7){%>
             <strong><%=totalParcial%></strong>
             <%}else{%>
             <strong><%=pago%></strong>
             <%}%>
         </td>
         <td align="left">&nbsp;</td>
         <td align="right">&nbsp;</td>
        </tr>
        <tr>
         <td align="left">Troco</td>
         <td align="left"><%=troco %></td>
         <td align="left">&nbsp;</td>
         <td align="right">&nbsp;</td>
        </tr>
        <tr>
         <td align="left" colspan="4" height="30"></td>
        </tr>
        <tr>
         <td align="left" colspan="4"><hr></td>
        </tr>
        <% if(forma.formPagID != 1){ %>
        
         <%
         String vezes = "";
         if(rs.getInt("vezes") == 1){
             vezes = "Á Vista ";
         }else{
             vezes = rs.getString("vezes")+" x ";
         }
         %>
        
        <tr>
         <td align="center" colspan="4">Forma Pgto - <%=formaPagamento %>, <%=vezes%><%=valorParcela%></td>
        </tr>
        <%}else{%>
        <tr>
         <td align="center" colspan="4">Forma Pgto - <%=formaPagamento %></td>
        </tr>
        <%}%>
        </table>  
        
        
      </td>
    </tr>
  <tr>
    <td colspan="4" align="center"><input type="button" class="botao" onclick="javascript: history.go(-1)" value="&lt;&lt; Voltar" /></td>
    </tr>
 </table>
 <%} %>
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