<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>





<%


//Instancia um Objeto do tipo Statement para ajudar na Query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
%>

<%
//Instancia um Objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
ResultSet rs06 = null;

%>

<%
//Pesquisa informações relacionadas à Empresa
rs01 = st01.executeQuery(empresa.dadosEmpresa());

int St = 0;
String dtInic = "";
String dtFim = "";
String dtInicPrev = "";
String dtFimPrev = "";
String depart = "";
Boolean prazo = false;
if(request.getParameter("st") != null)
{
	St = Integer.parseInt(request.getParameter("st"));
}
if(request.getParameter("dataInicPrev")!=null)
{
	dtInicPrev = request.getParameter("dataInicPrev");
	if(!dtInicPrev.equals(""))
	{
		if(dtInicPrev.substring(2,3).equals("/")){
			dtInicPrev = data.converteParaData(dtInicPrev);
		}
	}
}
if(request.getParameter("dataFimPrev")!=null){
	
	dtFimPrev = request.getParameter("dataFimPrev");
	if(!dtFimPrev.equals(""))
	{
		if(dtFimPrev.substring(2,3).equals("/"))
		{
			dtFimPrev = data.converteParaData(dtFimPrev);
		}
	}
}

if(request.getParameter("dataInic")!=null)
{
	dtInic = request.getParameter("dataInic");
	if(!dtInic.equals(""))
	{
		if(dtInic.substring(2,3).equals("/")){
			dtInic = data.converteParaData(dtInic);
		}
	}
}
if(request.getParameter("dataFim")!=null){//Perido final do interval0
	
	dtFim = request.getParameter("dataFim");
	if(!dtFim.equals(""))
	{
		if(dtFim.substring(2,3).equals("/"))
		{
			dtFim = data.converteParaData(dtFim);
		}
	}
}
if(request.getParameter("depart") != null){
	depart = request.getParameter("depart");
}
if(request.getParameter("prazo") != null){
	prazo =  Boolean.valueOf(request.getParameter("prazo"));
}
rs02 = st02.executeQuery(servico.listaServicosRelatorios(dtInic,dtInicPrev, dtFim, dtFimPrev, depart, St,prazo));
rs06 = st06.executeQuery(servico.listaServicosRelatorios(dtInic,dtInicPrev, dtFim, dtFimPrev, depart, St,prazo));

Double valTotal = 0.0;
Double valEntradas = 0.0;
Double valFaltantes = 0.0;

String Total = "";
String Entradas = "";
String Faltantes = "";

Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");


while(rs06.next()){
	valTotal += rs06.getDouble("valor");
	valEntradas += rs06.getDouble("entrada");
	valFaltantes += rs06.getDouble("valor") - rs06.getDouble("entrada");
}

Total = formato.format(valTotal);
Entradas = formato.format(valEntradas);
Faltantes = formato.format(valFaltantes);


GregorianCalendar cal = new GregorianCalendar();	

%>


<%
//Verifica se a consulta retornou algum valor e atribui às Variaveis
String nomeFantasia = "";
String endereco = "";
String bairro = "";
String cidade = "";
String telefone = "";

	if(rs01.next()){
		nomeFantasia = rs01.getString("nomeFantasia");
		endereco = rs01.getString("rua")+", "+rs01.getString("numero");
		bairro = rs01.getString("bairro");
		cidade = rs01.getString("cidade");
		telefone = rs01.getString("telefone");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RELATÓRIO - OS's</title>
<script type="text/javascript">
function EnviarPesquisa(dataInic, dataInicPrev, dataFimPrev,dataFim, depart, prazo)
{
	//alert(dataInic.value+" "+dataFim.value+" "+depart.value+" "+st.value+" "+prazo.value);
	var st =0;
	if(document.getElementById('status1').checked){
		st =  document.getElementById('status1').value;
	}
	if(document.getElementById('status2').checked){
		st =  document.getElementById('status2').value;
	}
	if(document.getElementById('status3').checked){
		st =  document.getElementById('status3').value;
	}
	window.location.href="rep_ordensdeservio.jsp?dataInic="+dataInic.value+"&dataInicPrev="+dataInicPrev.value+"&dataFimPrev="+dataFimPrev.value+"&dataFim="+dataFim.value+"&depart="+depart.value+"&st="+st+"&prazo="+prazo.checked;
	
		
}
</script>
<style type="text/css">
 body, html{
	 margin:0px;
	 border:0px;
	 font-family:Arial, Helvetica, sans-serif;
	 font-size:12px;
 }
 
 .borda{
	border:1px dashed #666; 
	text-align:left;
	height:18px;
	padding:2px;
 }
</style>

</head>
<body>

<!-- PRIMEIRA PÁGINA -->
<table align="center" cellpadding="0" cellspacing="0" width="1024" style="1px solid border:#000000">
 <tr>
  <td align="center" >
  
  <!-- Borda 1 -->
   <table width="590"  cellpadding="0" cellspacing="0" style="border:1px solid none" align="center">
    <tr>
     <td align="center" valign="top" height="120">
	      <!-- Esse é o espaço para que apareça o cabeçalho -->
	      <table width="585" height="120" border="0" align="center" cellpadding="0" cellspacing="3">
	       <tr>
	        <td  rowspan="5" align="center" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
	        <td colspan="2"  height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
	        <td  rowspan="5" align="center">&nbsp;</td>
	        <td>&nbsp;</td>
	       </tr>
	       <tr>
	        <td colspan="2" height="15" align="center"><strong><%=endereco %></strong></td>
	        </tr>
	       <tr>
	        <td colspan="2" height="15" align="center"><strong><%=bairro %></strong></td>
	        </tr>
	       <tr>
	        <td colspan="2" height="15" align="center"><strong><%=cidade %></strong></td>
	        </tr>
	       <tr>
	        <td colspan="2" height="15" align="center"><strong><%=telefone %></strong></td>
	        </tr>
	       <tr>
	        <td align="center" colspan="4"><hr></td>
	       </tr>
	       <tr>
	        <td height="15" align="left"><strong>RELATORIO - OS's</strong></td>
		   		<td align="left">
		   			Valor Total <%=Total %> 
		   		</td>
		   		<td align="left">
		   			Entradas Total <%=Entradas %> 
		   		</td>
		   		<td align="left">
		   			Faltante Total <%=Faltantes %>
		   		</td>
	       </tr>
	       <tr>
	        <td align="center" colspan="4"><hr></td>
	       </tr>
	      </table>
      </td>
      </tr>
      </table>
   </td>
   </tr>
   <tr>
   	<td>
	   		<table border="0" cellspacing="4" cellpadding="4" align="center">
	   		<tr>
	   			
	   			<td align="left">
	   				<table>
	   					<tr>
	   						<td>
	   							Data Inicio(Abertura) 
	   						</td>
	   						<td>
	   							<input type="date" name="dataInic" id="dataInic" value="" placeholder="dd/mm/aaaa"/>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>
	   							Data Fim(abertura)
	   						</td>
	   						<td>
	   							<input type="date" name="dataFim" id="dataFim" value="" placeholder="dd/mm/aaaa"/>
	   						</td>
	   					</tr>
		       		</table>
		       	</td>
		       	<td>
		       	<table>
	   					<tr>
	   						<td>
	   							Data Inicio(Previsão) 
	   						</td>
	   						<td>
	   							<input type="date" name="dataInicPrev" id="dataInicPrev" value="" placeholder="dd/mm/aaaa"/>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>
	   							Data Fim(Previsão)
	   						</td>
	   						<td>
	   							<input type="date" name="dataFimPrev" id="dataFimPrev" value="" placeholder="dd/mm/aaaa"/>
	   						</td>
	   					</tr>
		       		</table>
		       	</td>	
		       	<td>
		       		Departamento <select name="depart" value="" id="depart">
		       							<option value="-1">Selecione...</option>
										<option value="2">Atendimento</option>
										<option value="3">Arte Final</option>
										<option value="4">Impressão</option>
										<option value="5">Acabamento</option>
										<option value="8">Produção</option>
										<option value="6">Instalação</option>
										<option value="7">Orçamento</option>
									</select>
		       	</td>
		       	<td>
			       	<table>
			       	<tr>
			       		<td>
			       			<input type="radio" name="status" id="status1" value="0" checked="checked"/>Todos
		   					 
		   				</td>
		   			</tr>
		   			<tr>	
		   				<td>
		   					<input type="radio" name="status" id="status2" value="1" />Em Andamento	 
		   					 
		   				</td>
		   			</tr>
		   			<tr>	
		   				<td>
		   					<input type="radio" name="status" id="status3" value="2"/>Finalizado
		   				</td>
		   			</tr>
		   			</table>
		   		</td>	
	   			<td align="left" >
	   				 <input type="checkbox" name="prazoVencido" id="prazoVencido"/>Prazo Vencido
	   			</td>
	   		</tr>
	   		<tr>
	   			<td colspan="5" align="center">
	   				<input type='button' value="pesquisar" onclick="EnviarPesquisa(document.getElementById('dataInic'), document.getElementById('dataInicPrev'), document.getElementById('dataFimPrev'), document.getElementById('dataFim'),document.getElementById('depart'), document.getElementById('prazoVencido'))"/>
	   			</td>
	   		</tr>
		 	</table>
		 	</td>
   </tr>
   <tr>
         	
   	<td align="center">
   		<table border="0" cellpadding="5" cellspacing="5">
   			<tr style="background-color: gray">
   				<td colspan="7"><font color="white"><strong>OS</strong></font></td>
   				<td colspan="4"><font color="white"><strong>Valores</strong></font></td>
   			</tr>
   			<tr style="background-color: lightgrey; font-weight: bold;">
   				<td title="Data Abertura OS">Abertura</td>
   				<td title="Numero OS">OS</td>
   				<td title="Em Aberto/Finalizado/Para Finalizar">Status</td>
   				<td title="Qual passo atual">Departamento</td>
   				<td align="center" title="Data Prevista no Momento da Abertura da OS">Prevista</td>
   				<td align="center" title="Sempre traz a data da ultima alteração da OS">Data Fim</td>
   				<td title="Nome Cliente">Cliente</td> 
   				<td title="Total da OS">Total</td>
   				<td title="Valor dado pelo cliente">Entrada</td>
   				<td title="Quanto falta">Faltante</td>
   				<td title="Caso tenha sido parcelado">Vezes</td>
   			</tr>
   			<%while(rs02.next()){ %>
   			<tr>
   				<td title="Data Abertura OS"><%=data.converteDeData(rs02.getString("dataInicio")) %></td>
   				<td title="Numero OS"><%=rs02.getString("OS")+"/"+rs02.getString("anoServico").substring(0,4) %></td>
   				<%if(rs02.getString("status").equals("M")){ %>
   					<td title="Em Andamento/Finalizado">Em Andamento</td>
   				<%}else{ %><td title="Em Andamento/Finalizado">Finalizado</td><%} %>
   				<%if(rs02.getString("nivelUsuario").equals("1")){%>
   					<td title="">Gerencia</td>
   				<%} %>
   				<%if(rs02.getString("nivelUsuario").equals("2")){%>
   					<td title="">Atendimento</td>
   				<%} %>
   				<%if(rs02.getString("nivelUsuario").equals("3")){%>
   					<td title="">Arte Final</td>
   				<%} %>
   				<%if(rs02.getString("nivelUsuario").equals("4")){%>
   					<td title="">Impressão</td>
   				<%} %>
   				<%if(rs02.getString("nivelUsuario").equals("5")){%>
   					<td title="">Acabamento</td>
   				<%} %>
   				<%if(rs02.getString("nivelUsuario").equals("6")){%>
   					<td title="">Instalação</td>
   				<%} %>
   				<%if(rs02.getString("nivelUsuario").equals("7")){%>
   					<td title="">Vendedor/Orçamento</td>
   				<%} %>
   				<%if(rs02.getString("nivelUsuario").equals("8")){%>
   					<td title="">Produção</td>
   				<%} %>
   				<td title="Data Prevista no Momento da Abertura da OS"><%=data.converteDeData(rs02.getString("dataprevista"))%></td>
   				<%if(data.verificaDataVencimento2(rs02.getString("dataprevista")).equals("menor") && rs02.getString("status").equals("M")) {%>
   					<td align="center" title="Sempre traz a data da ultima alteração da OS">
   						<font style="color: white; background-color: red;">
   							<%=data.converteDeData(rs02.getString("dataFim").substring(0,10)) %>
   						</font>
   					</td>
   				<%}else if(data.verificaDataVencimento2(rs02.getString("dataprevista")).equals("maior") && rs02.getString("status").equals("M")) {%>
   					<td align="center" title="Sempre traz a data da ultima alteração da OS">
   							<%=data.converteDeData(rs02.getString("dataFim").substring(0,10)) %>
   					</td>
   				<%}else if (data.verificaDataVencimento2(rs02.getString("dataprevista")).equals("igual") && rs02.getString("status").equals("M")) {%>
   					<td align="center" title="Sempre traz a data da ultima alteração da OS">
   						<font style="color: black; background-color: yellow;">
   							<%=data.converteDeData(rs02.getString("dataFim").substring(0,10)) %>
   						</font>	
   					</td>
   				<%}else if (data.verificaDataVencimento2(rs02.getString("dataprevista")).equals("menor") && rs02.getString("status").equals("F")){%>
   					<td align="center" title="Sempre traz a data da ultima alteração da OS">
   						<font style="color: white; background-color: green;">
   							<%=data.converteDeData(rs02.getString("dataFim").substring(0,10)) %>
   						</font>	
   					</td>
   				<%} %>
   				<td title="Nome Cliente"><%=rs02.getString("clienteNomeFantasia") %></td> 
   				<td title="Total da OS"><%=rs02.getString("valor") %></td>
   				<td title="Valor dado pelo cliente"><%=rs02.getString("entrada") %></td>
   				<td title="Quanto falta"><%=rs02.getFloat("valor")-rs02.getFloat("entrada") %></td>
   				<td title="Caso tenha sido parcelado"><%=rs02.getString("vezes") %></td>
   			</tr>
   			<tr>
   				<td colspan="11">
   					<hr/>
   					
   				</td>
   			</tr>	
   			<%} %>
   		</table>
   	</td>
   </tr>
</table>



</body>
</html>