
<%
//   ###### LEIA ATENTAMENTE ######
//
//Essa página em jsp tem um conteúdo muito extenso e por isso foi dividido em blocos;
//Cada bloco Filtra Niveis diferentes de Usuário
//Para facilitar a Busca na hora da Manutenção:
	// - Selecione o seguinte caracter:  §
	// - Aperte ( Ctrl + F );

//Cada Find que você clicar irá para o próximo bloco
//
//   ###############################
%>








<%
//Variavel que recebe o valor da URL TOTAL
String urlTotal = String.valueOf(request.getRequestURL());

//Variavel que recebe o nivel do Usuário
String nivelUsuario = String.valueOf(session.getAttribute("nivel"));;

//Quebra a URL em pedaços em um Split por ( / )
String[] urlQuebrada  = urlTotal.split("/");

//Verifica qual o ultimo parametro da URL e atribui ele à variavel urlCaminho
int tamanho = urlQuebrada.length;

String urlCaminho = urlQuebrada[tamanho-1];










//############ § Trata Nivel 2 de Usuário #########################################

//Bloqueia visualizar todos os livros caixa
if(urlCaminho.equals("sis_view_livro_caixa.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}
//Bloqueia Alterar informações do Livro caixa
if(urlCaminho.equals("sis_update_livro_caixa.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Criação de novos bancos
if(urlCaminho.equals("sis_insert_livro_caixa.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Transferencia
if(urlCaminho.equals("sis_traferencia.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novas contas a pagar
if(urlCaminho.equals("sis_insert_conta_pagar.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Pagamento da Conta
if(urlCaminho.equals("sis_insert_pagamento.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de uma conta à Pagar
if(urlCaminho.equals("sis_update_conta_pagar.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização das contas à Pagar
if(urlCaminho.equals("sis_conta_pagar.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização das contas à Pagar
if(urlCaminho.equals("sis_conta_pagar_separada.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos cheques que voltaram
if(urlCaminho.equals("sis_view_cheques_voltaram.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de cheques que voltaram
if(urlCaminho.equals("sis_cheques_voltaram.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de uma conta à Receber
if(urlCaminho.equals("sis_update_conta_receber.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o recebimento de uma Conta
if(urlCaminho.equals("sis_insert_recebimento.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização das Contas à Receber
if(urlCaminho.equals("sis_conta_receber.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização das Contas à Receber
if(urlCaminho.equals("sis_conta_receber_separada.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}











//############ § Trata Nivel 3 de Usuário #########################################

//Bloqueia a visualização dos dados da Empresa
if(urlCaminho.equals("sis_update_empresa.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos cargos existentes no sistema
if(urlCaminho.equals("sis_view_cargos.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novos cargos 
if(urlCaminho.equals("sis_insert_cargo.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração dos cargos
if(urlCaminho.equals("sis_update_cargo.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos funcionarios
if(urlCaminho.equals("sis_insert_funcionario.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização um funcionario
if(urlCaminho.equals("sis_detalhe_funcionario.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração dos usuários
if(urlCaminho.equals("sis_update_funcionario.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os funcionarios
if(urlCaminho.equals("sis_view_funcionarios.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de Produtos
if(urlCaminho.equals("sis_insert_produto.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de tipos de Produto
if(urlCaminho.equals("sis_insert_tipo.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos tipos de Produto
if(urlCaminho.equals("sis_view_tipos.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Alimentação de Estoque
if(urlCaminho.equals("sis_insert_estoque.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de Produto
if(urlCaminho.equals("sis_update_produto.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de Retiradas dos Produtos
if(urlCaminho.equals("sis_view_retiradas_estoque.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Retirada de Produto do estoque
if(urlCaminho.equals("sis_insert_retirada_estoque.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização de um Fornecedor
if(urlCaminho.equals("sis_detalhe_fornecedor.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de um Fornecedor
if(urlCaminho.equals("sis_update_fornecedor.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de um novo Fornecedor
if(urlCaminho.equals("sis_insert_fornecedor.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os Fornecedores
if(urlCaminho.equals("sis_view_fornecedores.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia visualizar todos os livros caixa
if(urlCaminho.equals("sis_view_livro_caixa.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}
//Bloqueia Alterar informações do Livro caixa
if(urlCaminho.equals("sis_update_livro_caixa.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Criação de novos bancos
if(urlCaminho.equals("sis_insert_livro_caixa.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização da Receita de um Livro Caixa
if(urlCaminho.equals("sis_resumo.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Transferencia
if(urlCaminho.equals("sis_traferencia.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novas contas a pagar
if(urlCaminho.equals("sis_insert_conta_pagar.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Pagamento da Conta
if(urlCaminho.equals("sis_insert_pagamento.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de uma conta à Pagar
if(urlCaminho.equals("sis_update_conta_pagar.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização das contas à Pagar
if(urlCaminho.equals("sis_conta_pagar.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos cheques que voltaram
if(urlCaminho.equals("sis_view_cheques_voltaram.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de cheques que voltaram
if(urlCaminho.equals("sis_cheques_voltaram.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de uma conta à Receber
if(urlCaminho.equals("sis_update_conta_receber.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o recebimento de uma Conta
if(urlCaminho.equals("sis_insert_recebimento.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização das Contas à Receber
if(urlCaminho.equals("sis_conta_receber.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização de todos os Relatórios
if(urlCaminho.equals("sis_view_relatorios.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}








//############ § Trata Nivel 4 de Usuário #########################################

//Bloqueia a visualização dos dados da Empresa
if(urlCaminho.equals("sis_update_empresa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos cargos existentes no sistema
if(urlCaminho.equals("sis_view_cargos.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novos cargos 
if(urlCaminho.equals("sis_insert_cargo.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração dos cargos
if(urlCaminho.equals("sis_update_cargo.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos funcionarios
if(urlCaminho.equals("sis_insert_funcionario.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização um funcionario
if(urlCaminho.equals("sis_detalhe_funcionario.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração dos usuários
if(urlCaminho.equals("sis_update_funcionario.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os funcionarios
if(urlCaminho.equals("sis_view_funcionarios.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}


//Bloqueia o cadastro de Produtos
if(urlCaminho.equals("sis_insert_produto.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de tipos de Produto
if(urlCaminho.equals("sis_insert_tipo.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos tipos de Produto
if(urlCaminho.equals("sis_view_tipos.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Alimentação de Estoque
if(urlCaminho.equals("sis_insert_estoque.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de Produto
if(urlCaminho.equals("sis_update_produto.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de Retiradas dos Produtos
if(urlCaminho.equals("sis_view_retiradas_estoque.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Retirada de Produto do estoque
if(urlCaminho.equals("sis_insert_retirada_estoque.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização de um Fornecedor
if(urlCaminho.equals("sis_detalhe_fornecedor.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de um Fornecedor
if(urlCaminho.equals("sis_update_fornecedor.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de um novo Fornecedor
if(urlCaminho.equals("sis_insert_fornecedor.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os Fornecedores
if(urlCaminho.equals("sis_view_fornecedores.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de retiradas do caixa
if(urlCaminho.equals("sis_view_retiradas.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os fechamentos
if(urlCaminho.equals("sis_view_fechamentos.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a abertura de caixa
if(urlCaminho.equals("sis_abrir_caixa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia visualizar todos os livros caixa
if(urlCaminho.equals("sis_view_livro_caixa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}
//Bloqueia Alterar informações do Livro caixa
if(urlCaminho.equals("sis_update_livro_caixa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Criação de novos bancos
if(urlCaminho.equals("sis_insert_livro_caixa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização da Receita de um Livro Caixa
if(urlCaminho.equals("sis_resumo.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Transferencia
if(urlCaminho.equals("sis_traferencia.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novas contas a pagar
if(urlCaminho.equals("sis_insert_conta_pagar.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Pagamento da Conta
if(urlCaminho.equals("sis_insert_pagamento.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de uma conta à Pagar
if(urlCaminho.equals("sis_update_conta_pagar.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização das contas à Pagar
if(urlCaminho.equals("sis_conta_pagar.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos cheques que voltaram
if(urlCaminho.equals("sis_view_cheques_voltaram.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de cheques que voltaram
if(urlCaminho.equals("sis_cheques_voltaram.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de uma conta à Receber
if(urlCaminho.equals("sis_update_conta_receber.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o recebimento de uma Conta
if(urlCaminho.equals("sis_insert_recebimento.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização das Contas à Receber
if(urlCaminho.equals("sis_conta_receber.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização de todos os Relatórios
if(urlCaminho.equals("sis_view_relatorios.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}









//############ § Trata Nivel 5 de Usuário #########################################

//Bloqueia a visualização dos dados da Empresa
if(urlCaminho.equals("sis_update_empresa.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos cargos existentes no sistema
if(urlCaminho.equals("sis_view_cargos.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novos cargos 
if(urlCaminho.equals("sis_insert_cargo.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração dos cargos
if(urlCaminho.equals("sis_update_cargo.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos funcionarios
if(urlCaminho.equals("sis_insert_funcionario.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização um funcionario
if(urlCaminho.equals("sis_detalhe_funcionario.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração dos usuários
if(urlCaminho.equals("sis_update_funcionario.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os funcionarios
if(urlCaminho.equals("sis_view_funcionarios.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de Cliente
if(urlCaminho.equals("sis_update_cliente.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de Produtos
if(urlCaminho.equals("sis_insert_produto.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de tipos de Produto
if(urlCaminho.equals("sis_insert_tipo.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos tipos de Produto
if(urlCaminho.equals("sis_view_tipos.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Alimentação de Estoque
if(urlCaminho.equals("sis_insert_estoque.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de Produto
if(urlCaminho.equals("sis_update_produto.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de Retiradas dos Produtos
if(urlCaminho.equals("sis_view_retiradas_estoque.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Retirada de Produto do estoque
if(urlCaminho.equals("sis_insert_retirada_estoque.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}


//Bloqueia o cadastro de um novo Fornecedor
if(urlCaminho.equals("sis_insert_fornecedor.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de retiradas do caixa
if(urlCaminho.equals("sis_view_retiradas.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os fechamentos
if(urlCaminho.equals("sis_view_fechamentos.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a abertura de caixa
if(urlCaminho.equals("sis_abrir_caixa.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia gerar novo orçamento
if(urlCaminho.equals("sis_insert_orcamento.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}











//############ § Trata Nivel 6 de Usuário #########################################

//Bloqueia a visualização dos dados da Empresa
if(urlCaminho.equals("sis_update_empresa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos cargos existentes no sistema
if(urlCaminho.equals("sis_view_cargos.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novos cargos 
if(urlCaminho.equals("sis_insert_cargo.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração dos cargos
if(urlCaminho.equals("sis_update_cargo.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos funcionarios
if(urlCaminho.equals("sis_insert_funcionario.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização um funcionario
if(urlCaminho.equals("sis_detalhe_funcionario.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração dos usuários
if(urlCaminho.equals("sis_update_funcionario.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os funcionarios
if(urlCaminho.equals("sis_view_funcionarios.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de Cliente
if(urlCaminho.equals("sis_update_cliente.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de divida por Cliente
if(urlCaminho.equals("sis_divida_cliente.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos clientes
if(urlCaminho.equals("sis_insert_cliente.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de um cliente
if(urlCaminho.equals("sis_detalhe_cliente.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os clientes
if(urlCaminho.equals("sis_view_clientes.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de retiradas do caixa
if(urlCaminho.equals("sis_view_retiradas.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os fechamentos
if(urlCaminho.equals("sis_view_fechamentos.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a abertura de caixa
if(urlCaminho.equals("sis_abrir_caixa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia visualizar todos os livros caixa
if(urlCaminho.equals("sis_view_livro_caixa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}
//Bloqueia Alterar informações do Livro caixa
if(urlCaminho.equals("sis_update_livro_caixa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Criação de novos bancos
if(urlCaminho.equals("sis_insert_livro_caixa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização da Receita de um Livro Caixa
if(urlCaminho.equals("sis_resumo.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Transferencia
if(urlCaminho.equals("sis_traferencia.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novas contas a pagar
if(urlCaminho.equals("sis_insert_conta_pagar.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Pagamento da Conta
if(urlCaminho.equals("sis_insert_pagamento.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de uma conta à Pagar
if(urlCaminho.equals("sis_update_conta_pagar.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização das contas à Pagar
if(urlCaminho.equals("sis_conta_pagar.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização dos cheques que voltaram
if(urlCaminho.equals("sis_view_cheques_voltaram.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de cheques que voltaram
if(urlCaminho.equals("sis_cheques_voltaram.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a alteração de uma conta à Receber
if(urlCaminho.equals("sis_update_conta_receber.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o recebimento de uma Conta
if(urlCaminho.equals("sis_insert_recebimento.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualização das Contas à Receber
if(urlCaminho.equals("sis_conta_receber.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização das vendas fechadas
if(urlCaminho.equals("sis_vendas_fechadas.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}


//Bloqueia a geração de novos orçamentos
if(urlCaminho.equals("sis_insert_orcamento.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualização de todos os orçamentos fechados
if(urlCaminho.equals("sis_view_orcamentos.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}



//out.println(urlCaminho);
%>