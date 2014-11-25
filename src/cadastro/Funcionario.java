package cadastro;

public class Funcionario {
	
	public int funcionarioID;
	public String cargo;
	public String nome;
	public String nascimento;
	public String rg;
	public String cpf;
	public Endereco endereco = new Endereco();
	public String telefone;
	public String celular;
	public String operadoraCelular;
	public String email;
	public String funcionarioUsuario;
	public Empresa empresa = new Empresa();

	
	//Pesquisa todos os funcionarios cadastrados
	public String listaFuncionario() {
		return "SELECT * FROM funcionario ORDER BY funcionarioNome ASC";
	}
	
	//Pesquisa todos os funcionarios cadastrados Ativos
	public String listaFuncionarioAtivos() {
		return "SELECT * FROM funcionario WHERE funcionarioAtivo = 'S' ORDER BY funcionarioNome ASC";
	}
	
	//Busca funcionario
	public String pesquisaFuncionario(String keyWord){
		return "SELECT * FROM funcionario WHERE funcionarioAtivo = 'S' AND funcionarioNome LIKE '%"+keyWord+"%' ORDER BY funcionarioID DESC";
	}
	
	//Lista Funcionarios por Order Alfabética
	public String listaFuncionariosOrdenados() {
		String dadosFunc = "SELECT cargo.cargoID, cargo.cargoTitulo, funcionario.* FROM funcionario ";
		dadosFunc += "INNER JOIN cargo ON cargo.cargoID = funcionario.cargoID ";
		dadosFunc += "WHERE funcionario.funcionarioAtivo = 'S' ORDER BY funcionario.funcionarioNome ASC";
		
		return dadosFunc;
	}
	
	//Pesquisa funcionario por ID
	public String funcionarioPorId() {
		String dadosFunc = "SELECT cargo.cargoID, cargo.cargoTitulo, funcionario.* FROM funcionario ";
		dadosFunc += "INNER JOIN cargo ON cargo.cargoID = funcionario.cargoID ";
		dadosFunc += "WHERE funcionario.funcionarioID = '"+funcionarioID+"'";
		
		return dadosFunc;
	}
	
	//Salva Funcionario
	public String salvarFuncionario() {
		String salvaFuncionario = "INSERT INTO funcionario ";
		salvaFuncionario += "(funcionarioNome, cargoID, funcionarioNascimento, funcionarioRg, ";
		salvaFuncionario += "funcionarioCpf, funcionarioEndereco, funcionarioNumero, funcionarioBairro, ";
		salvaFuncionario += "funcionarioCep, funcionarioCidade, funcionarioUf, funcionarioComplemento, ";
		salvaFuncionario += "funcionarioTelefone, funcionarioCelular, operadoraCelular, funcionarioEmail, ";
		salvaFuncionario += "funcionarioUsuario, empresaID) VALUES ";
		salvaFuncionario += "('"+nome+"', '"+cargo+"', '"+nascimento+"', '"+rg+"', '"+cpf+"', '"+endereco.logradouro+"', ";
		salvaFuncionario += "'"+endereco.numero+"', '"+endereco.bairro+"', '"+endereco.cep+"', ";
		salvaFuncionario += "'"+endereco.cidade+"', '"+endereco.uf+"', '"+endereco.complemento+"', ";
		salvaFuncionario += "'"+telefone+"', '"+celular+"', '"+operadoraCelular+"', '"+email+"', '"+funcionarioUsuario+"', '"+empresa.empresaID+"')";
		
		
		return salvaFuncionario;
	}
	
	//Altera Funcionario
	public String alterarFuncionario() {
		String alteraFunc = "UPDATE funcionario SET cargoID = '"+cargo+"', funcionarioNome = '"+nome+"', funcionarioNascimento = '"+nascimento+"', ";
		alteraFunc += "funcionarioRg = '"+rg+"', funcionarioCpf = '"+cpf+"', funcionarioEndereco = '"+endereco.logradouro+"', ";
		alteraFunc += "funcionarioNumero = '"+endereco.numero+"', funcionarioBairro = '"+endereco.bairro+"', funcionarioCep = '"+endereco.cep+"', ";
		alteraFunc += "funcionarioCidade = '"+endereco.cidade+"', funcionarioUf = '"+endereco.uf+"', funcionarioComplemento = '"+endereco.complemento+"', ";
		alteraFunc += "funcionarioTelefone = '"+telefone+"', funcionarioCelular = '"+celular+"', operadoraCelular = '"+operadoraCelular+"', ";
		alteraFunc += "funcionarioEmail = '"+email+"' WHERE funcionarioID = '"+funcionarioID+"'";
		
		return alteraFunc;
	}
	
	//Exclui Funcionario
	public String excluirFuncionario() {
		return "DELETE FROM funcionario WHERE funcionarioID = '"+funcionarioID+"'";
	}
	
	//Verifica se Já existe um Funcionario com esse CPF
	public String verificaCpf(){
		return "SELECT * FROM funcionario WHERE funcionarioCpf = '"+cpf+"'";
	}
	
	//Verifica se Já existe um Funcionario com esse CPF
	public String verificaCpfAlterar(){
		return "SELECT * FROM funcionario WHERE funcionarioCpf = '"+cpf+"' AND funcionarioID <> '"+funcionarioID+"'";
	}
	
	//Muda Status do Funcionario para ATIVO(S) OU INATIVO(N)
	public String statusFuncionario(int numeroAcao){
		
		if(numeroAcao == 1){
			return "UPDATE funcionario SET funcionarioAtivo = 'N' WHERE funcionarioID = '"+funcionarioID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE funcionario SET funcionarioAtivo = 'S' WHERE funcionarioID = '"+funcionarioID+"'";
		}
		
		return null;
	}
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Funcionario Cadastrado com Sucesso!";
			
		case 2:
			return "Funcionario Alterado com Sucesso!";
			
		case 3:
			return "Funcionario Excluido com Sucesso!";
			
		case 4:
			return "Impossível Cadastrar! Já existe um funcionario cadastrado com esse CPF.";
		
		case 5:
			return "Impossível Alterar! Já existe um funcionario cadastrado com esse CPF.";

		default:
			return "";
		}
	}
}
