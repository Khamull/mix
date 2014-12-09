<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs02 = null;

Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>

<%
//Primeiro atualizamos a referencia nos materias do produto, depois do produto
//Selecionamos o proDuto Atual
servicoproduto.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
rs02 = st02.executeQuery(servicoproduto.RetornaRotina());
if(rs02.next()){
	 Integer produtoID = Integer.parseInt(rs02.getString("produtoID"));//Recupero o ID atual, para fazer o update nos materias
	 st03.execute(servicoproduto.updateMateriais(Integer.parseInt(request.getParameter("servicoID")), produtoID, Integer.parseInt(request.getParameter("prd"))));
}


servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
String qtd 		= request.getParameter("qtd");
String largura 	= request.getParameter("largura");
String altura 	= request.getParameter("altura");
String prd 		= request.getParameter("prd");
//Atribui o ID do Serviço ao objeto servico



//Altera todos os campos do produto
st.execute(servico.UPProdutoServico(prd, qtd, altura, largura));
%>

<%
//Após alterado direciona para a página de visualização de Serviços
response.sendRedirect("sis_update_os.jsp?servicoID="+request.getParameter("servicoID"));
%>

<%
 //fecha a consulta
 st.close();
%>
