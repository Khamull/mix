package cadastro;

public class Cliente {
	
	public int	clienteID;
	public String tipoPessoa;
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
	public String limiteCredito;

	//Pesquisa todos os Clientes cadastrados
	public String listaClientes(){
		return "SELECT * FROM cliente ORDER BY clienteNomeFantasia ASC";
	}
	
	//Pesquisa todos os Clientes cadastrados Ativos
	public String listaClientesaAtivos(){
		return "SELECT * FROM cliente WHERE clienteAtivo = 'S' ORDER BY clienteNomeFantasia ASC";
	}
	
	//Lista todos os Clientes Ativos Ordenados por Nome
	public String listaClientesOrdenados() {
		return "SELECT * FROM cliente WHERE clienteAtivo = 'S' ORDER BY clienteNomeFantasia ASC";
	}
	
	//Pesquisa Cliente por ID
	public String clienteID(){
		return "SELECT * FROM cliente WHERE clienteID = '"+clienteID+"'";
	}
	
	//Pesquisa Cliente que não tenha ID
		public String clienteDiferenteID(){
			return "SELECT * FROM cliente WHERE clienteID <> '"+clienteID+"' and clienteAtivo = 'S' ORDER BY clienteNomeFantasia ASC";
		}
	
	//Busca de Cliente por nome
	public String pesquisaCliente(String keyWord) {
		return "SELECT * FROM cliente WHERE clienteAtivo = 'S' AND clienteNomeFantasia LIKE '%"+keyWord+"%' ORDER BY clienteID DESC";
	}
	
	//Verifica se ja existe um cliente cadastrado com esse CPF / CNPJ
	public String verificaCnpj(){
		return "SELECT clienteCnpj FROM cliente WHERE clienteCnpj = '"+cnpj+"'";
	}
	
	//Verifica se já existe um cliente cadastrado com esse CPF / CNPJ antes de Alterar o Cliente
	public String verificaCnpjAlterar() {
		return "SELECT clienteCnpj FROM cliente WHERE clienteCnpj = '"+cnpj+"' AND clienteID <> '"+clienteID+"'";		
	}
	
	//Salva os dados na tabela Cliente
	public String salvarCliente(){
		String salvaCli = "INSERT INTO cliente (tipoPessoa, clienteNomeFantasia, clienteRazaoSocial, clienteCnpj, clienteInscEstadual, ";
		salvaCli += "clienteInscMunicipal, clienteEndereco, clienteNumero, clienteBairro, clienteCep, clienteCidade, clienteUf, ";
		salvaCli += "clienteComplemento, clienteContato, clienteTelefone, clienteFax, clienteRadio, clienteCelular, operadoraCelular, ";
		salvaCli += "clienteEmail, clienteSite, clienteUsuario, limiteCredito) VALUES ('"+tipoPessoa+"', '"+nomeFantasia+"', '"+razaoSocial+"', ";
		salvaCli += "'"+cnpj+"', '"+inscEstadual+"', '"+inscMunicipal+"', '"+endereco.logradouro+"', '"+endereco.numero+"', ";
		salvaCli += "'"+endereco.bairro+"', '"+endereco.cep+"', '"+endereco.cidade+"', '"+endereco.uf+"', '"+endereco.complemento+"', ";
		salvaCli += "'"+contato+"', '"+telefone+"', '"+fax+"', '"+radio+"', '"+celular+"', ";
		salvaCli += "'"+operadoraCelular+"', '"+email+"', '"+site+"', '"+usuario+"', '"+limiteCredito+"')";
		
		return salvaCli;
	}
	
	//Edita os dados na tabela Cliente
	public String alteraCliente(){
		String editaCli = "UPDATE  cliente SET  ";
		editaCli += "tipoPessoa = '"+tipoPessoa+"', ";
		editaCli += "clienteNomeFantasia =  '"+nomeFantasia+"', ";
		editaCli += "clienteRazaoSocial =  '"+razaoSocial+"', ";
		editaCli += "clienteCnpj =  '"+cnpj+"', ";
		editaCli += "clienteInscEstadual =  '"+inscEstadual+"', ";
		editaCli += "clienteInscMunicipal =  '"+inscMunicipal+"', ";
		editaCli += "clienteEndereco =  '"+endereco.logradouro+"', ";
		editaCli += "clienteNumero =  '"+endereco.numero+"', ";
		editaCli += "clienteBairro =  '"+endereco.bairro+"', ";
		editaCli += "clienteCep =  '"+endereco.cep+"', ";
		editaCli += "clienteCidade =  '"+endereco.cidade+"', ";
		editaCli += "clienteUf =  '"+endereco.uf+"', ";
		editaCli += "clienteComplemento =  '"+endereco.complemento+"', ";
		editaCli += "clienteContato =  '"+contato+"', ";
		editaCli += "clienteTelefone =  '"+telefone+"', ";
		editaCli += "clienteFax =  '"+fax+"', ";
		editaCli += "clienteRadio =  '"+radio+"', ";
		editaCli += "clienteCelular =  '"+celular+"', ";
		editaCli += "operadoraCelular =  '"+operadoraCelular+"', ";
		editaCli += "clienteEmail =  '"+email+"', ";
		editaCli += "clienteSite =  '"+site+"', ";
		editaCli += "clienteUsuario =  '"+usuario.nome+"', ";
		editaCli += "limiteCredito =  '"+limiteCredito+"' ";
		editaCli += "WHERE  clienteID = '"+clienteID+"'";
		
		return editaCli;
	}
	
	//Exclui Cliente
	public String excluirCliente() {
		return "DELETE FROM cliente WHERE clienteID = '"+clienteID+"'";
	}
	
	//Muda Status do cliente para ATIVO(S) OU INATIVO(N)
	public String statusCliente(int numeroAcao){
		
		if(numeroAcao == 1){
			return "UPDATE cliente SET clienteAtivo = 'N' WHERE clienteID = '"+clienteID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE cliente SET clienteAtivo = 'S' WHERE clienteID = '"+clienteID+"'";
		}
		
		return null;
	}
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Cliente Cadastrado com Sucesso!";
			
		case 2:
			return "Cliente Alterado com Sucesso!";
			
		case 3:
			return "Cliente Excluido com Sucesso!";
			
		case 4:
			return "Impossível Cadastrar! Já existe um cliente cadastrado com esse CPF / CNPJ.";
		
		case 5:
			return "Impossível Alterar! Já existe um cliente cadastrado com esse CPF / CNPJ.";

		default:
			return "";
		}
	}
}
