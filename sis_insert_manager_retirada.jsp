<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="retirada" class="caixaloja.Retiradas" scope="page"></jsp:useBean>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>


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
//Atribui o usuario logado ao objeto usuario
usuario.login = (String)session.getAttribute("usuario");
//Pesquisa o nome do Usuário Logado
rs01 = st01.executeQuery(usuario.usuarioPorLogin());
//atribui o valor da pesquisa ao objeto usuário
if(rs01.next()){
	usuario.nome = rs01.getString("usuarioNome");
}
%>

<%
//Recupera valores trazidos do Formulário
//Atrubui eles ao objeto usuario
retirada.caixa.caixaID = Integer.parseInt(request.getParameter("caixaID"));

	//Trata o valor
	String valor = request.getParameter("valor");
	retirada.valor = Float.parseFloat(valor.replace(",","."));

retirada.usuario.login = usuario.login;
retirada.usuario.nome = usuario.nome;
retirada.responsavel.login = (String)session.getAttribute("adm");
retirada.observacao = request.getParameter("observacao");
retirada.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
%>

<%
//Cadastra essa retirada
st.execute(retirada.retirar());
%>

<%
//Elimina esse acesso de Administrador da Sessão para que o caixa
//não venha acessar posteriormente usando esse mesmo acesso.
session.setAttribute("adm", "");
%>


<html>
<body>

<br><br>Responsavel pela Retirada: <b><%=retirada.responsavel.login %></b><br><br>
Caixa: <%=retirada.caixa.caixaID %><br><br>
Valor: <%=retirada.valor %><br><br>
Usuário: <%=retirada.usuario.nome %><br><br>
Observacoes: <%=retirada.observacao %>


<%
//Apos cadastrada a Retirada, Redireciona para a Página de Fechar Caixa
response.sendRedirect("sis_fechar_caixa.jsp");
%>
</body>
</html>
