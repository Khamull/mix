package cadastro;

public class Empresa {
	
	public int empresaID;
	public String unidade;
	public String nomeFantasia;
	public String razaoSocial;
	public String ramo;
	public String cnpj;
	public String inscEstadual;
	public String inscMunicipal;
	public String cep;
	public String rua;
	public String numero;
	public String bairro;
	public String cidade;
	public String uf;
	public String complemento;
	public String responsavel;
	public String telefone;
	public String fax;
	public String celular;
	public String operadora;
	public String email;
	public String site;
	
	
	//pesquisa dados da empresa MATRIZ
	public String dadosEmpresa() {
		return "SELECT * FROM empresa WHERE empresaID = '1'";
	}
	
	
	//Pesquisa os dados de qualquer empresa Cadastrada (Filiais)
	public String dadosGerais() {
		return "SELECT * FROM empresa WHERE empresaID = '"+empresaID+"'";
	}
	
	
	//Lista todas as empresas cadastradas ATIVAS
	public String listaEmpresas() {
		return "SELECT * FROM empresa WHERE empresaAtiva = 'S' ORDER BY empresaID DESC";
	}
	
	//Lista todas as empresas cadastradas
	public String listaTodasEmpresas() {
		return "SELECT * FROM empresa ORDER BY empresaID DESC";
	}
	
	//Conta quantas empresas tem cadastradas no sistema
	public String contaEmpresas() {
		return "SELECT COUNT(*) as qtdd FROM empresa WHERE empresaAtiva = 'S'";
	}
	
	//altera dados da empresa
	public String alterarEmpresa() {
		String altEmpresa = "UPDATE empresa SET unidade = '"+unidade+"', nomeFantasia = '"+nomeFantasia+"', razaoSocial = '"+razaoSocial+"', ramo = '"+ramo+"', ";
		altEmpresa += "cnpj = '"+cnpj+"', inscEstadual = '"+inscEstadual+"', inscMunicipal = '"+inscMunicipal+"', cep = '"+cep+"', ";
		altEmpresa += "rua = '"+rua+"', numero = '"+numero+"', bairro = '"+bairro+"', cidade = '"+cidade+"', uf = '"+uf+"', ";
		altEmpresa += "complemento = '"+complemento+"', responsavel = '"+responsavel+"', telefone = '"+telefone+"', fax = '"+fax+"', ";
		altEmpresa += "celular = '"+celular+"', operadora = '"+operadora+"', email = '"+email+"', site = '"+site+"' ";
		altEmpresa += "WHERE empresaID = '"+empresaID+"'";
		
		return altEmpresa;
	}
	
	//cadastra uma nova Empresa (unidade)
	public String salvaEmpresa() {
		String cadastraEmpresa = "INSERT INTO empresa ";
		cadastraEmpresa += "(unidade, nomeFantasia, razaoSocial, ramo, cnpj, inscEstadual, inscMunicipal, cep, rua, numero, bairro, cidade, uf, ";
		cadastraEmpresa += "complemento, responsavel, telefone, fax, celular, operadora, email, site) ";
		cadastraEmpresa += "VALUES ";
		cadastraEmpresa += "('"+unidade+"', '"+nomeFantasia+"', '"+razaoSocial+"', '"+ramo+"', '"+cnpj+"', '"+inscEstadual+"', '"+inscMunicipal+"', ";
		cadastraEmpresa += "'"+cep+"', '"+rua+"', '"+numero+"', '"+bairro+"', '"+cidade+"', '"+uf+"', '"+complemento+"', ";
		cadastraEmpresa += "'"+responsavel+"', '"+telefone+"', '"+fax+"', '"+celular+"', '"+operadora+"', '"+email+"', '"+site+"')";
		
		return cadastraEmpresa;
	}
	
	
	//Muda Status de uma Empresa para ATIVA(S) OU INATIVA(N)
	public String statusEmpresa(int numeroAcao){
		
		if(numeroAcao == 1){
			return "UPDATE empresa SET empresaAtiva = 'N' WHERE empresaID = '"+empresaID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE empresa SET empresaAtiva = 'S' WHERE empresaID = '"+empresaID+"'";
		}
		
		return null;
	}
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Nova Filial cadastrada com Sucesso!";
			
		case 2:
			return "Dados da Empresa Alterado com Sucesso!";
			
		case 3:
			return "";
			
		case 4:
			return "";
		
		case 5:
			return "";

		default:
			return "";
		}
	}

}
