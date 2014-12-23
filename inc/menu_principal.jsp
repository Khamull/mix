<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="mensagens" class="acesso.Mensagens" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
%>

<%
//Atribui o objeto salvo na sessao ao objeto empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
//Pesquisa a Unidade que está logada de acordo com a variavel que foi salva na sessao
rs01 = st01.executeQuery(empresa.dadosGerais());
%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = mensagens.mensagem(numeroMsg);
}
%>

<table width="985" align="center" height="440">
<%if(rs01.next()){%>
<tr>
 <td height="15" align="center" bgcolor="#CCCCCC">MENU PRINCIPAL DO SISTEMA - <strong><%=rs01.getString("unidade")%></strong></td>
<tr>
<%}%>
  <td align="center">
  
  <!--Menu Principal -->
  <table width="720" align="center">
   <tr>
    <td width="160" align="center"><a href="sis_view_usuarios.jsp"><img src="ico/ico_usuarios.png" width="60" height="60" border="0" title="Usuários do Sistema" /></a></td>
    <td width="160" align="center"><a href="sis_update_empresa.jsp"><img src="ico/ico_empresa.png" width="60" height="60" border="0" title="Dados da Empresa" /></a></td>
    <td width="160" align="center"><a href="sis_view_funcionarios.jsp"><img src="ico/ico_funcionarios.png" width="60" height="60" border="0" title="Funcion&aacute;rios" /></a></td>
    <td width="160" align="center"><a href="sis_view_clientes.jsp"><img src="ico/ico_clientes.png" width="60" height="60" border="0" title="Clientes" /></a></td>
    <td width="160" align="center"><a href="sis_view_fornecedores.jsp"><img src="ico/ico_fornecedores.png" width="60" height="60" border="0" title="Fornecedores" /></a></td>
    </tr>
   <tr>
    <td align="center">Usu&aacute;rios</td>
    <td align="center">Empresa</td>
    <td align="center">Funcion&aacute;rios</td>
    <td align="center">Clientes</td>
    <td align="center">Fornecedores</td>
    </tr>
   <tr>
    <td height="15"></td>
   </tr>
   <tr>
    <!-- <td width="160" align="center"><a href="sis_gerar_venda.jsp"><img src="ico/ico_pedido.png" width="60" height="60" border="0" title="Ponto de Venda" /></a></td>-->
    <td width="160" align="center"><a href="sis_abrir_caixa.jsp"><img src="ico/ico_caixa.png" alt="" width="60" height="60" border="0" title="Caixa" /></a></td>
    <td width="160" align="center"><a href="sis_view_financeiro.jsp"><img src="ico/ico_financeiro.png" alt="" width="60" height="60" border="0" title="Livro Caixa" /></a></td>
	<td width="160" align="center"><a href="sis_view_servicos.jsp"><img src="ico/ico_servico.png" alt="" width="60" height="60" border="0" title="Serviços" /></a></td>
    <!-- <td width="160" align="center"><a href="javascript: window.open('http://www2.varzeapaulista.sp.gov.br:8080/issweb/login/login.aspx','NFE','toolbar=no,fullscreen=yes,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,cop
history=yes,width = 880px; height = 600px')"><img src="ico/ico_nfe.png" alt="" width="60" height="60" border="0" title="Nota Fiscal Eletronica" /></a></td>-->
	<td width="160" align="center"><a href="sis_view_op_produtos.jsp"><img src="ico/ico_produto.png" width="60" height="60" border="0" title="Cadastrar Produtos" /></a></td>
	<td width="160" align="center"><a href="#"onclick="javascript: window.open('relatorios/rep_ordensdeservio.jsp', 'OS', 'width = 1056; height =1024; scrollbars=yes')"><img src="ico/ico_venda_ok.png" alt="" width="60" height="60" border="0" title="Vendas Concluidas" /></a></td>
    </tr>
   <tr>
    <td align="center">Caixa</td>
    <td align="center">Financeiro</td>
    <td align="center">Servi&ccedil;os</td>
    <td align="center">Materias/Produtos</td>
    <td align="center">Vendas</td>
    </tr>
   <tr>
     <td height="5" align="center">&nbsp;</td>
   </tr>
    <tr>
    
    <td width="160" align="center"><a href="sis_insert_novo_orcamento.jsp?orcamento=1"><img src="ico/ico_orcamento.png" alt="" width="60" height="60" border="0" title="Or&ccedil;amentos" /></a></td>
    <td align="center"><a href="sis_view_relatorios.jsp"><img src="ico/ico_relatorios.png" alt="" width="60" height="60" border="0" title="Relat&oacute;rios" /></a></td>
    <td align="center"><a href="sis_menu.jsp?sair=ok"><img src="ico/ico_sair.png" alt="" width="60" height="60" border="0" title="Sair do Sistema" /></a><a href="#"></a></td>
    </tr>
   <tr>
    <td align="center">Or&ccedil;amentos</td>
    <td align="center">Relat&oacute;rios</td>
    <td align="center">Sair</td>
    </tr>
   <tr>
    <td height="15"></td>
   </tr>
   

   <%if(request.getParameter("msg") != null){%>
   <tr bgcolor="#FFFFCC">
    <td height="25" colspan="5" align="center" valign="middle"><strong><font color="#FF0000"><%=msg %></font></strong></td>
   </tr>
   <%} %>
  </table>
  <!--Fim Menu Principal-->
    
  </td>
</tr>
</table>