<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>


<%
//Recupera valores trazidos do Formulário de Cadastro de Empresa
//Atrubui eles ao objeto empresa

empresa.empresaID					= Integer.parseInt(request.getParameter("empresaID"));
empresa.unidade						= request.getParameter("unidade");
empresa.nomeFantasia				= request.getParameter("nomeFantasia");
empresa.razaoSocial					= request.getParameter("razaoSocial");
empresa.ramo						= request.getParameter("ramo");
empresa.cnpj						= request.getParameter("cnpj");
empresa.inscEstadual				= request.getParameter("inscEstadual");
empresa.inscMunicipal				= request.getParameter("inscMunicipal");
empresa.cep							= request.getParameter("cep");
empresa.rua							= request.getParameter("rua");
empresa.numero						= request.getParameter("numero");
empresa.bairro						= request.getParameter("bairro");
empresa.cidade						= request.getParameter("cidade");
empresa.uf							= request.getParameter("uf");
empresa.complemento					= request.getParameter("complemento");
empresa.responsavel					= request.getParameter("responsavel");
empresa.telefone					= request.getParameter("telefone");
empresa.fax							= request.getParameter("fax");
empresa.celular						= request.getParameter("celular");
empresa.operadora					= request.getParameter("operadora");
empresa.email						= request.getParameter("email");
empresa.site						= request.getParameter("site");

%>

<%
//Altera os Dados da Empresa na Base de Dados
st.execute(empresa.alterarEmpresa());
response.sendRedirect("sis_view_unidades.jsp?msg=2");
%>

<%
 //fecha a consulta
 st.close();
%>