package cadastro;

public class Fornecedor {
	
	public int	fornecedorID;
	public String nomeFantasia;
	public String razaoSocial;
	public String cnpj;
	public String inscEstadual;
	public String inscMunicipal;
	public Endereco endereco = new Endereco();
	public String contato;
	public String telefone;
	public String fax;
	public String radio;
	public String celular;
	public String operadoraCelular;
	public String email;
	public String site;
	public Usuario usuario = new Usuario();
	public Empresa empresa = new Empresa();
	

	//Pesquisa todos os Fornecedores cadastrados
	public String listaFornecedores(){
		return "SELECT * FROM fornecedor ORDER BY fornecedorID DESC";
	}
	
	//Pesquisa todos os Fornecedores cadastrados Ativos
	public String listaFornecedoresAtivos(){
		return "SELECT * FROM fornecedor WHERE fornAtivo = 'S' ORDER BY fornecedorID DESC";
	}
	
	//Pesquisa Fornecedor por ID
	public String fornecedorPorID(){
		return "SELECT * FROM fornecedor WHERE fornecedorID = '"+fornecedorID+"'";
	}
	
	//Busca Fornecedor por nome
	public String pesquisaFornecedor(String keyWord) {
		return "SELECT * FROM fornecedor WHERE fornAtivo = 'S' AND fornNomeFantasia LIKE '%"+keyWord+"%' ORDER BY fornecedorID DESC";
	}
	
	
	//Busca os Fornecedores Ativos em Ordem Alfabética(Usado no Relatório)
	public String listaFornecedoresOrdenados() {
		return "SELECT * FROM fornecedor ORDER BY fornNomeFantasia ASC";		
	}
	
	//Verifica se ja existe um fornecedor cadastrado com esse CPF / CNPJ
	public String verificaCnpj(){
		return "SELECT fornCnpj FROM fornecedor WHERE fornCnpj = '"+cnpj+"'";
	}
	
	//Verifica se já existe um fornecedor cadastrado com esse CPF / CNPJ antes de Alterar o Cliente
	public String verificaCnpjAlterar() {
		return "SELECT fornCnpj FROM fornecedor WHERE fornCnpj = '"+cnpj+"' AND fornecedorID <> '"+fornecedorID+"'";		
	}
	
	//Salva os dados na tabela Fornecedor
	public String salvarFornecedor(){
		String salvaCli = "INSERT INTO fornecedor (fornNomeFantasia, fornRazaoSocial, fornCnpj, fornInscEstadual, ";
		salvaCli += "fornInscMunicipal, fornEndereco, fornNumero, fornBairro, fornCep, fornCidade, fornUf, ";
		salvaCli += "fornComplemento, fornContato, fornTelefone, fornFax, fornRadio, fornCelular, operadoraCelular, ";
		salvaCli += "fornEmail, fornSite, fornUsuario, empresaID) VALUES ('"+nomeFantasia+"', '"+razaoSocial+"', ";
		salvaCli += "'"+cnpj+"', '"+inscEstadual+"', '"+inscMunicipal+"', '"+endereco.logradouro+"', '"+endereco.numero+"', ";
		salvaCli += "'"+endereco.bairro+"', '"+endereco.cep+"', '"+endereco.cidade+"', '"+endereco.uf+"', '"+endereco.complemento+"', ";
		salvaCli += "'"+contato+"', '"+telefone+"', '"+fax+"', '"+radio+"', '"+celular+"', ";
		salvaCli += "'"+operadoraCelular+"', '"+email+"', '"+site+"', '"+usuario+"', '"+empresa.empresaID+"')";
		
		return salvaCli;
	}
	
	//Edita os dados na tabela Fornecedor
	public String alteraFornecedor(){
		String editaForn = "UPDATE  fornecedor SET  ";
		editaForn += "fornNomeFantasia =  '"+nomeFantasia+"', ";
		editaForn += "fornRazaoSocial =  '"+razaoSocial+"', ";
		editaForn += "fornCnpj =  '"+cnpj+"', ";
		editaForn += "fornInscEstadual =  '"+inscEstadual+"', ";
		editaForn += "fornInscMunicipal =  '"+inscMunicipal+"', ";
		editaForn += "fornEndereco =  '"+endereco.logradouro+"', ";
		editaForn += "fornNumero =  '"+endereco.numero+"', ";
		editaForn += "fornBairro =  '"+endereco.bairro+"', ";
		editaForn += "fornCep =  '"+endereco.cep+"', ";
		editaForn += "fornCidade =  '"+endereco.cidade+"', ";
		editaForn += "fornUf =  '"+endereco.uf+"', ";
		editaForn += "fornComplemento =  '"+endereco.complemento+"', ";
		editaForn += "fornContato =  '"+contato+"', ";
		editaForn += "fornTelefone =  '"+telefone+"', ";
		editaForn += "fornFax =  '"+fax+"', ";
		editaForn += "fornRadio =  '"+radio+"', ";
		editaForn += "fornCelular =  '"+celular+"', ";
		editaForn += "operadoraCelular =  '"+operadoraCelular+"', ";
		editaForn += "fornEmail =  '"+email+"', ";
		editaForn += "fornSite =  '"+site+"', ";
		editaForn += "fornUsuario =  '"+usuario.nome+"', ";
		editaForn += "empresaID = '"+empresa.empresaID+"' ";
		editaForn += "WHERE  fornecedorID = '"+fornecedorID+"'";
		
		return editaForn;
	}
	
	//Exclui Fornecedor
	public String excluirFornecedor() {
		return "DELETE FROM fornecedor WHERE fornecedorID = '"+fornecedorID+"'";
	}
	
	//Muda Status do Fornecedor para ATIVO(S) OU INATIVO(N)
	public String statusFornecedor(int numeroAcao){
		
		if(numeroAcao == 1){
			return "UPDATE fornecedor SET fornAtivo = 'N' WHERE fornecedorID = '"+fornecedorID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE fornecedor SET fornAtivo = 'S' WHERE fornecedorID = '"+fornecedorID+"'";
		}
		
		return null;
	}
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Fornecedor Cadastrado com Sucesso!";
			
		case 2:
			return "Fornecedor Alterado com Sucesso!";
			
		case 3:
			return "Fornecedor Excluido com Sucesso!";
			
		case 4:
			return "Impossível Cadastrar! Já existe um fornecedor cadastrado com esse CNPJ.";
		
		case 5:
			return "Impossível Alterar! Já existe um fornecedor cadastrado com esse CNPJ.";

		default:
			return "";
		}
	}
	
}
