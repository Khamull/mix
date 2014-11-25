package cadastro;

public class Cargo {
	
	public int cargoID;
	public String titulo;
	public String descricao;
	
	//Pesquisa todos os Cargos
	public String listaCargos() {
		return "SELECT * FROM cargo ORDER BY cargoTitulo ASC";
	}
	
	//Pesquisa todos os Cargos Ativos
	public String listaCargosAtivos() {
		return "SELECT * FROM cargo WHERE cargoAtivo = 'S' ORDER BY cargoTitulo ASC";
	}
	
	//Busca Cargos
	public String pesquisaCargo(String keyWord) {
		return "SELECT * FROM cargo WHERE cargoAtivo = 'S' AND cargoTitulo LIKE '%"+keyWord+"%' ORDER BY cargoTitulo ASC";
	}
	
	//Pesquisa Cargo por ID
	public String cargoPorId(){
		return "SELECT * FROM cargo WHERE cargoID = '"+cargoID+"'";
	}
	
	//Verifica se já existe um cargo com o mesmo Titulo cadastrado
	public String verificaCargo() {
		return "SELECT * FROM cargo WHERE cargoTitulo = '"+titulo+"'";
	}
	
	//Verifica se já existe um cargo com esse Titulo antes de Alterar ele
	public String verificaCargoAlterar() {
		return "SELECT * FROM cargo WHERE cargoTitulo = '"+titulo+"' AND cargoID <> '"+cargoID+"'";
	}
	
	//Salva  cargo
	public String salvarCargo() {
		return "INSERT INTO cargo (cargoTitulo, cargoDescricao) VALUES ('"+titulo+"', '"+descricao+"')";
	}
	
	//Altera cargo
	public String alteraCargo() {
		return "UPDATE cargo SET cargoTitulo = '"+titulo+"', cargoDescricao = '"+descricao+"' WHERE cargoID = '"+cargoID+"'";		
	}
	
	//Deleta Cargo
	public String excluiCargo() {
		return "DELETE FROM cargo WHERE cargoID = '"+cargoID+"'";
	}
	
	//Muda Status do Cargo para ATIVO(S) OU INATIVO(N)
	public String statusCargo(int numeroAcao){
		
		if(numeroAcao == 1){
			return "UPDATE cargo SET cargoAtivo = 'N' WHERE cargoID = '"+cargoID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE cargo SET cargoAtivo = 'S' WHERE cargoID = '"+cargoID+"'";
		}
		
		return null;
	}
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Cargo Cadastrado com Sucesso!";
			
		case 2:
			return "Cargo Alterado com Sucesso!";
			
		case 3:
			return "Cargo Excluido com Sucesso!";
			
		case 4:
			return "Impossível Cadastrar! Já existe esse Cargo.";
		
		case 5:
			return "Impossível Alterar! Já existe esse Cargo.";

		default:
			return "";
		}
	}
}
