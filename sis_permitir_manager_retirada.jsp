<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>



<%
//Verifica se foi passado parametro via URL
if(request.getParameter("administrador")!=null && request.getParameter("senha")!=null){
	usuario.login = request.getParameter("administrador");
	usuario.senha = request.getParameter("senha");
	
	
	//Faz a pesquisa para saber se o usuário é do tipo Administrador
	rs = st.executeQuery(usuario.logarAdm());
	
	if(rs.next()){
		//Salva na Sessão que Tem um Administrador Logado
		session.setAttribute("adm", rs.getString("usuarioNome"));
		response.sendRedirect("sis_insert_retirada.jsp");
	}else{
		response.sendRedirect("sis_permitir_retirada.jsp?erro=2");
	}
	
}else{
	response.sendRedirect("sis_menu.jsp");
}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>