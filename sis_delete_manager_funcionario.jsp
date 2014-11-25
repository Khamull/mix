<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="funcionario" class="cadastro.Funcionario" scope="page"></jsp:useBean>

<%
//Recupera o ID do funcionario que irá ser excluido e adiciona ao Objeto
funcionario.funcionarioID = Integer.parseInt(request.getParameter("funcionarioID"));

//chama o Metodo que irá excluir esse funcionario
st.execute(funcionario.excluirFuncionario());

//direciona para a página que lista os funcionarios
response.sendRedirect("sis_view_funcionarios.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>