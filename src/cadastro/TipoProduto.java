package cadastro;

public class TipoProduto {
	
	public int tipoProdutoID;
	public String tipo;
	
	
	//Lista todos os Tipos
	public String listaTipos() {
		return "SELECT * FROM tipoproduto ORDER BY tipo ASC";
	}
	
	//Pesquisa tipo de produtos Ativos
	public String listaTiposAtivos() {
		return "SELECT * FROM tipoproduto WHERE tipoAtivo = 'S' ORDER BY tipo ASC";
	}
	
	//Pesquisa tipo por ID
	public String tipoPorId() {
		return "SELECT * FROM tipoproduto WHERE tipoprodutoID = '"+tipoProdutoID+"'";
	}
	
	//Pesquisa se já existe um tipo cadastrado com esse nome
	public String tipoPorNome() {
		return "SELECT * FROM tipoproduto WHERE tipo = '"+tipo+"'";
	}
	
	//Pesquisa se já existe um tipo cadastrado com esse nome antes de Alterar
	public String tipoPorNomeEditar() {
		return "SELECT * FROM tipoproduto WHERE tipo = '"+tipo+"' AND tipoprodutoID <> '"+tipoProdutoID+"'";
	}
	
	//Pesquisa tipos por Nome
	public String pesquisaTipos(String keyWord) {
		return "SELECT * FROM tipoproduto WHERE tipo LIKE '%"+keyWord+"%'";
	}
	
	//Salva Tipo
	public String salvaTipo() {
		return "INSERT INTO tipoproduto (tipo) VALUES ('"+tipo+"')";
	}
	
	
	//Edita Tipo
	public String alteraTipo() {
		return "UPDATE tipoproduto SET tipo = '"+tipo+"' WHERE tipoprodutoID = '"+tipoProdutoID+"'";
	}
	
	//Deleta Tipo
	public String excluiTipo() {
		return "DELETE FROM tipoproduto WHERE tipoprodutoID = '"+tipoProdutoID+"'";
	}
	
	//Muda Status do Produto para ATIVO(S) OU INATIVO(N)
	public String statusTipo(int numeroAcao){
		
		if(numeroAcao == 1){
			return "UPDATE tipoproduto SET tipoAtivo = 'N' WHERE tipoprodutoID = '"+tipoProdutoID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE tipoproduto SET tipoAtivo = 'S' WHERE tipoprodutoID = '"+tipoProdutoID+"'";
		}
		
		return null;
	}
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Tipo Cadastrado com Sucesso!";
			
		case 2:
			return "Tipo Alterado com Sucesso!";
			
		case 3:
			return "Tipo Excluido com Sucesso!";
			
		case 4:
			return "Impossível Cadastrar! Já existe um tipo cadastrado com esse Nome.";
		
		case 5:
			return "Impossível Alterar! Já existe um tipo cadastrado com esse Nome.";

		default:
			return "";
		}
	}

}
