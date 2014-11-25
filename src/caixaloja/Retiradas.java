package caixaloja;

import cadastro.Empresa;
import cadastro.Usuario;

public class Retiradas {
	
	public int retiradaID;
	public Caixa caixa = new Caixa();
	public float valor;
	public Usuario usuario = new Usuario();
	public Usuario responsavel = new Usuario();
	public String observacao;
	public Empresa empresa = new Empresa();
	
	
	//Pesquisa ultima Retirada
	public String ultimaRetirada() {
		return "SELECT * FROM retiradas ORDER BY retiradaID DESC LIMIT 1";
	}
	
	
	//Soma o total de retiradas em um perido de abertura e fechamento de caixa
	public String somaRetiradas() {
		return "SELECT SUM(valor) as totalRetiradas FROM retiradas WHERE caixaID = '"+caixa.caixaID+"'";
	}
	
	
	//Pesquisa informações sobre todas as retiradas em um periodo de abertura e fechamento de caixa
	public String buscaRetiradas() {
		return "SELECT * FROM retiradas WHERE caixaID = '"+caixa.caixaID+"'";
	}
	
	//Cadastra uma Retirada
	public String retirar() {
		String cadastra = "INSERT INTO retiradas ";
		cadastra += "(caixaID, valor, usuario, responsavel, observacao, empresaID) ";
		cadastra += "VALUES ";
		cadastra += "('"+caixa.caixaID+"', '"+valor+"', '"+usuario.login+"', '"+responsavel.login+"', '"+observacao+"', '"+empresa.empresaID+"')";
		
		return cadastra;
	}
	

}
