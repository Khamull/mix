<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formulário de Cadastro de Clientes
//Atrubui eles ao objeto cliente

cliente.clienteID				= Integer.parseInt(request.getParameter("clienteID"));
cliente.tipoPessoa				= request.getParameter("tipoCliente");
cliente.nomeFantasia 			= request.getParameter("clienteNomeFantasia");
cliente.razaoSocial 			= request.getParameter("clienteRazaoSocial");
cliente.cnpj 					= request.getParameter("clienteCnpj");
cliente.inscEstadual 			= request.getParameter("clienteInscEstadual");
cliente.inscMunicipal 			= request.getParameter("clienteInscMunicipal");
cliente.endereco.logradouro		= request.getParameter("rua");
cliente.endereco.numero 		= request.getParameter("clienteNumero");
cliente.endereco.bairro 		= request.getParameter("bairro");
cliente.endereco.cep 			= request.getParameter("cep");
cliente.endereco.cidade 		= request.getParameter("cidade");
cliente.endereco.uf 			= request.getParameter("clienteUf");
cliente.endereco.complemento 	= request.getParameter("clienteComplemento");
cliente.contato 				= request.getParameter("clienteContato");
cliente.telefone 				= request.getParameter("clienteTelefone");
cliente.fax 					= request.getParameter("clienteFax");
cliente.radio 					= request.getParameter("clienteRadio");
cliente.celular 				= request.getParameter("clienteCelular");
cliente.operadoraCelular 		= request.getParameter("operadoraCelular");
cliente.email 					= request.getParameter("clienteEmail");
cliente.site 					= request.getParameter("clienteSite");
cliente.limiteCredito 			= request.getParameter("limiteCredito");
cliente.usuario.nome			= request.getParameter("clienteUsuario");


//Valida se é CNPJ ou CPF
if(cliente.cnpj.equals("")){
	cliente.cnpj = request.getParameter("clienteCpf");
}
%>

<%
//Verifica se já existe um usuário com esse Nome
rs = st.executeQuery(cliente.verificaCnpjAlterar());

if(rs.next()){
	//Caso exista um Cliente com esse CPF / CNPJ, retorna para a Página de Cadastro
	response.sendRedirect("sis_update_cliente.jsp?msg=5&clienteID="+cliente.clienteID);
}else{
	//Senão: Executa a Função que irá Alterar os dados na Base de Dados
	st.execute(cliente.alteraCliente());
	response.sendRedirect("sis_view_clientes.jsp?msg=2");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>