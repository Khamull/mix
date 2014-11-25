<table align="center">
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td>
<div class="dock" id="dock">
  <div class="dock-container">
  <%
  String nivel_ = (String) session.getAttribute("nivel");
  int nivelfinal = Integer.parseInt(nivel_);
  if(nivelfinal == 1 || nivelfinal == 2){ %>
  <a class="dock-item" href="sis_menu.jsp"><img src="ico/ico_menu.png" alt="Principal" /><span>Menu Principal</span></a> 
  <a class="dock-item" href="sis_view_usuarios.jsp"><img src="ico/ico_usuarios.png" alt="Usuarios" /><span>Usuários</span></a> 
  <a class="dock-item" href="sis_view_op_produtos.jsp"><img src="ico/ico_produto.png" alt="Site" /><span>Materiais/Produtos</span></a>
  <a class="dock-item" href="sis_insert_novo_orcamento.jsp?orcamento=1"><img src="ico/ico_orcamento.png" alt="Relatorios" /><span>Or&ccedil;amentos</span></a> 
  <%if(request.getQueryString() != null){%>
  	<a class="dock-item" href="<%=request.getRequestURL()+"?"+request.getQueryString()%>"><img src="ico/ico_atualizar.png" alt="Atualizar" /><span>Atualizar</span></a> 
  <%}else{%>
  	<a class="dock-item" href="<%=request.getRequestURL()%>"><img src="ico/ico_atualizar.png" alt="Atualizar" /><span>Atualizar</span></a>
  <%}%>
  <%} %> 
  <a class="dock-item" href="sis_menu.jsp?sair=ok"><img src="ico/ico_sair.png" alt="Sair" /><span>Sair do Sistema</span></a> 
</div>
</div>
 </td>
</tr>
</table>