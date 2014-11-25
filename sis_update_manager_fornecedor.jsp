<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="fornecedor" class="cadastro.Fornecedor" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formulário de Cadastro de Fornecedor
//Atrubui eles ao objeto cliente

fornecedor.fornecedorID				= Integer.parseInt(request.getParameter("fornecedorID"));
fornecedor.nomeFantasia 			= request.getParameter("fornNomeFantasia");
fornecedor.razaoSocial 				= request.getParameter("fornRazaoSocial");
fornecedor.cnpj 					= request.getParameter("fornCnpj");
fornecedor.inscEstadual 			= request.getParameter("fornInscEstadual");
fornecedor.inscMunicipal 			= request.getParameter("fornInscMunicipal");
fornecedor.endereco.logradouro		= request.getParameter("rua");
fornecedor.endereco.numero 			= request.getParameter("fornNumero");
fornecedor.endereco.bairro 			= request.getParameter("bairro");
fornecedor.endereco.cep 			= request.getParameter("cep");
fornecedor.endereco.cidade 			= request.getParameter("cidade");
fornecedor.endereco.uf 				= request.getParameter("fornUf");
fornecedor.endereco.complemento 	= request.getParameter("fornComplemento");
fornecedor.contato 					= request.getParameter("fornContato");
fornecedor.telefone 				= request.getParameter("fornTelefone");
fornecedor.fax 						= request.getParameter("fornFax");
fornecedor.radio 					= request.getParameter("fornRadio");
fornecedor.celular 					= request.getParameter("fornCelular");
fornecedor.operadoraCelular 		= request.getParameter("operadoraCelular");
fornecedor.email 					= request.getParameter("fornEmail");
fornecedor.site 					= request.getParameter("fornSite");
fornecedor.usuario.nome				= request.getParameter("fornUsuario");
fornecedor.empresa.empresaID		= Integer.parseInt((String)session.getAttribute("empresaID"));

%>

<%
//Verifica se já existe um Fornecedor com esse CNPJ
rs = st.executeQuery(fornecedor.verificaCnpjAlterar());

if(rs.next()){
	//Caso exista um Fornecedor com esse CPF / CNPJ, retorna para a Página de Cadastro
	response.sendRedirect("sis_update_fornecedor.jsp?msg=5&fornecedorID="+fornecedor.fornecedorID);
}else{
	//Senão: Executa a Função que irá Alterar os dados na Base de Dados
	st.execute(fornecedor.alteraFornecedor());
	response.sendRedirect("sis_view_fornecedores.jsp?msg=2");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>