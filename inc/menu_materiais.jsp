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
 <td height="15" align="center" bgcolor="#CCCCCC">MENU DE PRODUTOS E MATERIAIS DO SISTEMA - <strong><%=rs01.getString("unidade")%></strong></td>
<tr>
<%}%>
  <td align="center">
  
  <!--Menu Principal -->
  <table width="460" align="center">
   
   <tr>
    <td height="15"></td>
   </tr>
   <tr>
    <td width="160" align="center"><a href="sis_view_produtos_separados.jsp"><img src="images/materiais.png" alt="" width="60" height="60" border="0" title="Materiais" /></a></td>
    <td width="160" align="center"><a href="sis_view_produtos_mix_publicidade.jsp"><img src="images/produtos.png" alt="" width="60" height="60" border="0" title="Produtos" /></a></td>
	</tr>
   <tr>
    <td align="center">Materiais</td>
    <td align="center">Produtos</td>
    </tr>
   
    <tr>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    </tr>
   <tr>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    </tr>
   
   <tr>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center">&nbsp;</td>
    </tr>
   <tr>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     </tr>
   
   
   <%if(request.getParameter("msg") != null){%>
   <tr bgcolor="#FFFFCC">
    <td height="25" colspan="3" align="center" valign="middle"><strong><font color="#FF0000"><%=msg %></font></strong></td>
   </tr>
   <%} %>
  </table>
  <!--Fim Menu Principal-->
    
  </td>
</tr>
</table>