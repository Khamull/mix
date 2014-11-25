package servico;

import cadastro.Usuario;

public class ServicoFechado {
	
	public int servicofechadoID;
	public Servico servico = new Servico();
	public float valor;
	public int formPagID;
	public Usuario usuario = new Usuario();
	
	//Cadastra um novo Serviço fechado para depois ser aprensentado no fechamento de caixa;
	public String cadastraServicoFechado() {
		String cadastra = "INSERT INTO servicofechado (servicoID, valor, formPagID, usuario) ";
		cadastra += "VALUES ('"+servico.servicoID+"', '"+valor+"', '"+formPagID+"', '"+usuario.usuarioID+"')";
		
		return cadastra;
	}

	
	//Pesquisa a soma dos Serviços finalizados em um determinado periodo com um determinado usuário
	public String somaServicos(int servicoInicio, int servicoFim) {
		String servicos = "SELECT SUM(valor) as totalServicos ";
		servicos += "FROM servicofechado ";
		servicos += "WHERE servicofechadoID BETWEEN '"+servicoInicio+"' AND '"+servicoFim+"' ";
		servicos += "AND usuario = '"+usuario.usuarioID+"'";
		
		return servicos;
	}
	
	
	//Pesquisa a soma dos Serviços de acrdo com a forma de pagamento também
	public String somaServicoFormaPgto(int servicoInicio, int servicoFim) {
		String vendas = "SELECT formapagamento.formID, formapagamento.descricao, ";
		vendas += "SUM(servicofechado.valor) as totalServicos, servicofechado.formPagID ";
		vendas += "FROM servicofechado ";
		vendas += "INNER JOIN formapagamento ON formapagamento.formID = servicofechado.formPagID ";
		vendas += "WHERE servicofechado.servicofechadoID BETWEEN '"+servicoInicio+"' AND '"+servicoFim+"' ";
		vendas += "AND servicofechado.usuario = '"+usuario.usuarioID+"' ";
		vendas += "GROUP BY servicofechado.formPagID";
		
		return vendas;
	}
	
	//Pesquisa a soma dos Serviços finalizados em um determinado periodo com um determinado usuário (((EM DINHEIRO)))
	public String somaServicosDinheiro(int servicoInicio, int servicoFim) {
		String servicos = "SELECT SUM(valor) as totalServicos ";
		servicos += "FROM servicofechado ";
		servicos += "WHERE servicofechadoID BETWEEN '"+servicoInicio+"' AND '"+servicoFim+"' ";
		servicos += "AND usuario = '"+usuario.usuarioID+"' AND formPagID = '1'";
		
		return servicos;
	}
	
	//Pesquisa qual foi o Ultimo Serviço Realizado
	public String ultimaServicoPorUsuario(){
		return "SELECT * FROM servicofechado WHERE usuario = '"+usuario.usuarioID+"' ORDER BY servicofechadoID DESC LIMIT 1";
	}
	
	//Pesquisa dados do ultimo Servico Cadastrado no Sistema
	public String ultimoServico() {
		return "SELECT * FROM servicofechado ORDER BY servicofechadoID DESC LIMIT 1";
	}
	
}
