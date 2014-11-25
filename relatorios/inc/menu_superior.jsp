<table align="center">
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td>
<div class="dock" id="dock">
  <div class="dock-container">
  <a class="dock-item" href="../sis_menu.jsp"><img src="../ico/ico_menu.png" alt="Principal" /><span>Menu Principal</span></a> 
  <a class="dock-item" href="../sis_view_usuarios.jsp"><img src="../ico/ico_usuarios.png" alt="Usuarios" /><span>Usuários</span></a> 
  <a class="dock-item" href="../sis_gerar_venda.jsp"><img src="../ico/ico_pedido.png" alt="Pedido" /><span>PDV</span></a>
  <a class="dock-item" href="../sis_view_produtos.jsp"><img src="../ico/ico_produto.png" alt="Site" /><span>Produtos</span></a>
  <a class="dock-item" href="../sis_view_orcamentos.jsp"><img src="../ico/ico_orcamento.png" alt="Relatorios" /><span>Or&ccedil;amentos</span></a> 
  <%if(request.getQueryString() != null){%>
  	<a class="dock-item" href="<%=request.getRequestURL()+"?"+request.getQueryString()%>"><img src="../ico/ico_atualizar.png" alt="Atualizar" /><span>Atualizar</span></a> 
  <%}else{%>
  	<a class="dock-item" href="<%=request.getRequestURL()%>"><img src="../ico/ico_atualizar.png" alt="Atualizar" /><span>Atualizar</span></a>
  <%}%> 
  <a class="dock-item" href="../sis_menu.jsp?sair=ok"><img src="../ico/ico_sair.png" alt="Sair" /><span>Sair do Sistema</span></a> 
</div>
</div>
 </td>
</tr>
</table>