<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<%
//Recupera o ID do usuario que irá ser excluido e adiciona ao Objeto
usuario.usuarioID = Integer.parseInt(request.getParameter("usuarioID"));

//chama o Metodo que irá excluir esse usuário
st.execute(usuario.excluiUsuario());

//direciona para a página que lista os usuários
response.sendRedirect("sis_view_usuarios.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>