package financeiro;

public class LivroCaixa {
	
	public int livroID;
	public String banco;
	public String dataInicio;
	public float valorInicial;
	public float saldo;
	public String descricao;
	
	
	//Lista todos os Bancos Cadastrados no Livro Caixa
	public String listaTodosBancos() {
		return "SELECT * FROM livrocaixa ORDER BY status DESC, banco ASC";
	}
	
	//Lista todos os Bancos Cadastrados no Livro Caixa Ativos
	public String listaBancos() {
		return "SELECT * FROM livrocaixa WHERE status = 'S' ORDER BY banco ASC";
	}
	
	//Pesquisa se já Existe um Banco cadastrado com esse nome na hora de Editar
	public String pesquisaBancoPorNomeEditar() {
		return "SELECT * FROM livrocaixa WHERE banco = '"+banco+"' AND livroID <> '"+livroID+"'";
	}
	
	//Pesquisa se já Existe um Banco cadastrado com esse nome
	public String pesquisaBancoPorNome() {
		return "SELECT * FROM livrocaixa WHERE banco = '"+banco+"'";
	}
	
	//Pesquisa Banco por ID
	public String bancoPorID() {
		return "SELECT * FROM livrocaixa WHERE livroID = '"+livroID+"'";
	}
	
	//Pesquisa qual o Saldo em caixa
	public String saldoEmCaixa() {
		return "SELECT saldo FROM livrocaixa WHERE livroID = '"+livroID+"'";
	}
	
	//Pesquisa total de Saldo
	public String saldoTotal() {
		return "SELECT SUM(saldo) as total FROM livrocaixa WHERE status = 'S'";
	}
	
	//Pesquisa total de Saldo entre os Bancos (menos o livro caixa LOJA)
	public String saldoTotalBancos() {
		return "SELECT SUM(saldo) as total FROM livrocaixa WHERE livroID <> '1' AND status = 'S'";
	}
	
	//Cadastra Novo Banco
	public String cadastraBanco() {
		String cadastra = "INSERT INTO livrocaixa (banco, descricao, valorInicial, dataInicio, saldo) ";
		cadastra += "VALUES ('"+banco+"', '"+descricao+"', '"+valorInicial+"', '"+dataInicio+"', '"+valorInicial+"')";
		
		return cadastra;
	}
	
	//Atualiza saldo em caixa
	public String atualizaSaldo() {
		return "UPDATE livrocaixa SET saldo = '"+saldo+"' WHERE livroID = '"+livroID+"'";
	}
	
	
	//Altera valores como Nome e Descrição do Banco
	public String alteraBanco() {
		return "UPDATE livrocaixa SET banco = '"+banco+"', descricao = '"+descricao+"' WHERE livroID = '"+livroID+"'";
	}
	
	//Muda o Status do livroCaixa para 'S' (Ativo) ou 'N' (Inativo)
	public String statusBanco(int numeroAcao) {
		
		if(numeroAcao == 1){
			return "UPDATE livrocaixa SET status = 'N' WHERE livroID = '"+livroID+"'";
		}else if(numeroAcao == 2){
			return "UPDATE livrocaixa SET status = 'S' WHERE livroID = '"+livroID+"'";
		}
		
		return null;
	}
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Novo Banco Cadastrado com Sucesso!";
			
		case 2:
			return "Nome do Banco Alterado com Sucesso!!";
			
		case 3:
			return "IMPOSSIVEL CADASTRAR! JÁ EXISTE UM BANCO CADASTRADO COM ESSE NOME.";
			
		case 4:
			return "IMPOSSIVEL ALTERAR! JÁ EXISTE UM BANCO CADASTRADO COM ESSE NOME.";
		
		case 5:
			return "Trasferencia Realizada com Sucesso!";
			
		default:
			return "";
		}
	}

}
