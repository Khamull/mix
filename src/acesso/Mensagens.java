package acesso;

public class Mensagens {
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Antes de Fazer uma Venda Por favor Abra o Caixa!";
			
		case 2:
			return "Você não tem autorização para acessar essa Página";
			
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
