package cadastro;

public class Compras {
	
	public int compraID;
	public String nome;
	public int quantidade;
	
	
	//Cadastra um novo item para a compra
	public String cadastraItem() {
		return "INSERT INTO compras (nome, quantidade) VALUES ('"+nome+"', '"+quantidade+"')";
	}
	
	
	//Deleta o item da compra
	public String excluiItem() {
		return "DELETE FROM compras WHERE compraID = '"+compraID+"'";
	}
	
	//Pesquisa todos os itens da compra
	public String listaItens() {
		return "SELECT * FROM compras WHERE compraAtiva = 'S' ORDER BY compraID DESC";
	}
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Item Inserido na Compra com Sucesso!";
			
		case 2:
			return "Item Excluido da Compra!";
			
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
