package caixaloja;

import cadastro.Funcionario;
import cadastro.Usuario;

public class Caixa {
	
	public int caixaID;
	public Usuario usuario = new Usuario();
	public Funcionario funcionario = new Funcionario();
	public float valorInicial;
	public float valorFinal;
	public int vendaInicial;
	public int vendaFinal;
	public int servicoInicial;
	public int servicoFinal;
	public int lancamentoInicial;
	public int lancamentoFinal;
	public int retiradaInicial;
	public int retiradaFinal;
	
	
	
	//Verifica se existe um caixa aberto com esse login
	public String verificaCaixa() {
		return "SELECT * FROM caixa WHERE status = 'A' and usuario = '"+usuario.login+"'";
	}
	
	//pesquisa informaçoes sobre o Caixa através do ID
	public String caixaPorID() {
		return "SELECT * FROM caixa WHERE caixaID = '"+caixaID+"'";
	}
	
	//Abre um caixa de acordo com um usuário
	public String abreCaixa() {
		String cadastra = "INSERT INTO caixa ";
		cadastra += "(usuario, funcionario, valorInicial, valorFinal, vendaInicial, vendaFinal, servicoInicial, servicoFinal,";
		cadastra += " lancamentoInicial, lancamentoFinal, retiradaInicial, retiradaFinal, dataInicio) ";
		cadastra += "VALUES ";
		cadastra += "( '"+usuario.login+"', '"+funcionario.nome+"', '"+valorInicial+"', '0.00', '"+vendaInicial+"', '0', '"+servicoInicial+"',";
		cadastra += " '0', '"+lancamentoInicial+"', '0', '"+retiradaInicial+"', '0', CURRENT_TIMESTAMP)";
		
		return cadastra;
	}
	
	
	//Fecha o Caixa e Atualiza seus Dados
	public String fechaCaixa() {
		String fechamento = "UPDATE caixa SET ";
		fechamento += "valorFinal = '"+valorFinal+"', vendaFinal = '"+vendaFinal+"', servicoFinal = '"+servicoFinal+"', ";
		fechamento += "lancamentoFinal = '"+lancamentoFinal+"', retiradaFinal = '"+retiradaFinal+"', status = 'F' ";
		fechamento += "WHERE caixaID = '"+caixaID+"'";
		
		return fechamento;
	}
	
	
	//Lista todos os Fechamentos em ordem decrescente quanto ao ID
	public String listaFechamentos(String dataInicio, String dataFim) {
		String lista = "SELECT funcionario.funcionarioID, funcionario.funcionarioNome, caixa.* ";
		lista += "FROM caixa ";
		lista += "INNER JOIN funcionario ON funcionario.funcionarioID = caixa.funcionario ";
		lista += "WHERE caixa.status = 'F' AND data BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";
		lista += "ORDER BY caixa.caixaID DESC";
		
		return lista;
	}
	
	
	//Lista todos os Fechamentos em ordem decrescente quanto ao ID e Por Usuário
	public String listaFechamentosPorUsuario(String dataInicio, String dataFim) {
		String lista = "SELECT funcionario.funcionarioID, funcionario.funcionarioNome, caixa.* ";
		lista += "FROM caixa ";
		lista += "INNER JOIN funcionario ON funcionario.funcionarioID = caixa.funcionario ";
		lista += "WHERE caixa.status = 'F' AND usuario = '"+usuario.login+"' AND data BETWEEN '"+dataInicio+"' AND '"+dataFim+"' ";
		lista += "ORDER BY caixa.caixaID DESC";
		
		return lista;
	}
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Caixa Aberto!";
			
		case 2:
			return "Caixa Fechado!";
			
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
