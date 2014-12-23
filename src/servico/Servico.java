package servico;

import java.util.*;

//import javafx.scene.chart.PieChart.Data;
import pdv.FormaPagamento;
import cadastro.Cliente;
import cadastro.Empresa;
import cadastro.Usuario;
import formatar.Datas;


public class Servico {
	
	public int servicoID;
	public Cliente cliente = new Cliente();
	public Empresa empresa = new Empresa();
	public String descricao;
	public String OS;
	public String anoServico;
	public String dataPrevista;
	public FormaPagamento formaPagamento = new FormaPagamento();
	public float entrada;
	public float troco;
	public int vezes;
	public float desconto;
	public String dataInicio;
	public String dataFim;
	public float valor;
	public Usuario usuario = new Usuario();
	
	
	//Pesquisa informações sobre um determinado Serviço por ID
	public String pesquisaServico() {
		String pesquisaEmp = "SELECT cliente.*, servico.*, ";
		pesquisaEmp += " case servico.dataprevista ";
		pesquisaEmp += " when '0000-00-00' then \"0\"";
		pesquisaEmp += " else servico.dataprevista";
		pesquisaEmp += " end as dataprevista1, ";
		pesquisaEmp += " case servico.dataAgendamento ";
		pesquisaEmp += " when '0000-00-00' then \"0\"";
		pesquisaEmp += " else servico.dataAgendamento";
		pesquisaEmp += " end as dataAgendamento1 ";
		pesquisaEmp += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		pesquisaEmp += "WHERE servico.servicoID = '"+servicoID+"'";
		
		return pesquisaEmp;
	}
	
	
	public String pesquisaServicoPorOS() {
		String pesquisaEmp = "SELECT cliente.*, servico.*, ";
		pesquisaEmp += " case servico.dataprevista ";
		pesquisaEmp += " when '0000-00-00' then \"0\"";
		pesquisaEmp += " else servico.dataprevista";
		pesquisaEmp += " end as dataprevista1, ";
		pesquisaEmp += " case servico.dataAgendamento ";
		pesquisaEmp += " when '0000-00-00' then \"0\"";
		pesquisaEmp += " else servico.dataAgendamento";
		pesquisaEmp += " end as dataAgendamento1 ";
		pesquisaEmp += " from servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		pesquisaEmp += " where servico.OS = '"+OS+"'";
		pesquisaEmp += " and servico.anoServico = '"+anoServico+"'";
		
		return pesquisaEmp;
	}
	
	public String DeleteOS(String IN) {
		String pesquisaEmp = "delete from servico where `servicoID` in ("+IN+")";
		return pesquisaEmp;
	}
	
	//Pesquisa informações sobre um determinado Serviço por ID e por Empresa
	public String pesquisaServicoEmpresa() {
		String pesquisaEmp = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
		pesquisaEmp += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		pesquisaEmp += "WHERE servico.servicoID = '"+servicoID+"' AND servico.empresaID = '"+empresa.empresaID+"'";
		
		return pesquisaEmp;
	}
	
	//Pesquisa todos os Serviços
	public String listaServicos() {
		return "SELECT * FROM servico ORDER BY servicoID DESC";
	}
	
	public String listaServicosRelatorios(String dtInic, String dtInicPrev, String dtFim, String dtFimPrev, String depart, int St, Boolean prazo) {
		String listaServ=""; 
		String Controle = "";
		listaServ += " select distinct (servico.OS),";
		listaServ += " servico.anoServico,			";
		listaServ += " servico.servicoID, 			";
		listaServ += " servico.dataInicio, 			";
		listaServ += " servico.dataprevista, 		";
		listaServ += " servico.dataAgendamento, 	";
		listaServ += " servico.dataFim, 			";
		listaServ += " servico.dataprevista, 		";
		listaServ += " servico.valor, 				";
		listaServ += " servico.entrada,				";
		listaServ += " servico.valor, 				";
		listaServ += " servico.vezes, 				";
		listaServ += " servico.status, 				";
		listaServ += " servico.passo, 				";
		listaServ += " servico.nivelUsuario,		";
		listaServ += " cliente.clienteNomeFantasia 	";
		listaServ += " from servico inner join cliente on cliente.clienteID = servico.clienteID";
		listaServ += " where servico.OS <> 0 ";
		if(!dtInic.equals("") && !dtFim.equals(""))//Somente datas foram informadas
		{
			listaServ += " and servico.dataInicio between '"+dtInic+"' and '"+dtFim+"'";
		}
		if(!dtInic.equals("") && dtFim.equals(""))//Somente datas foram informadas
		{
			listaServ += " and servico.dataInicio = '"+dtInic+"' ";
		}
		if(!depart.equals("") && !depart.equals("-1"))//Datas selecionadas e com departamento específico
		{
			listaServ += " and servico.nivelUsuario = '"+depart+"' ";
		}
		if(St == 1){//Datas selecionadas e com um status específico
			listaServ += "and servico.status = 'M' ";
		}
		if(St == 2)
		{
			listaServ += " and servico.status = 'F' ";
		}
		if(prazo){// Para que esteja fora do prazo, o select tem que retornar os servico que estejam data fim maior que data prevista
			//listaServ += " and servico.dataprevista < curdate() ";
			listaServ += " and servico.dataprevista < servico.dataFim ";
		}
		if(!dtInicPrev.equals("") && !dtFimPrev.equals(""))
		{
			listaServ += " and servico.dataprevista between '"+dtInicPrev+"' and '"+dtFimPrev+"'";
		}
		if(!dtInicPrev.equals("") && dtFimPrev.equals(""))
		{
			listaServ += " and servico.dataprevista = '"+dtInicPrev+"' ";
		}
		
		/*if(!dtInicPrev.equals("") && !dtFimPrev.equals(""))//Somente datas foram informadas
		{
			Controle = "1";
			listaServ += " and servico.dataprevista between '"+dtInicPrev+"' and '"+dtFimPrev+"'";
			if(!depart.equals("") && !depart.equals("-1"))//Datas selecionadas e com departamento específico
			{
				listaServ += " and servico.nivelUsuario = '"+depart+"' ";
			}
			if(St == 1){//Datas selecionadas e com um status específico
				listaServ += "and servico.status = 'M' ";
			}
			if(St == 2)
			{
				listaServ += " and servico.status = 'F' ";
			}
			if(prazo){// Para que esteja fora do prazo, o select tem que retornar os servico que estejam data fim maior que data prevista
				//listaServ += " and servico.dataprevista < curdate() ";
				listaServ += " and servico.dataprevista < servico.dataFim ";
			}
		}
		
		if(!dtInic.equals("") && dtFim.equals(""))//Procura somente por uma data específica
		{
			listaServ += " and servico.dataInicio = '"+dtInic+"' ";
			if(!depart.equals("") && !depart.equals("-1"))//Datas selecionadas e com departamento específico
			{
				listaServ += " and servico.nivelUsuario = '"+depart+"' ";
			}
			if(St == 1){//Datas selecionadas e com um status específico
				listaServ += "and servico.status = 'M' ";
			}
			if(St == 2)
			{
				listaServ += " and servico.status = 'F' ";
			}
			if(prazo){// Para que esteja fora do prazo, o select tem que retornar os servico que estejam data fim maior que data prevista
				//listaServ += " and servico.dataprevista < curdate() ";
				listaServ += " and servico.dataprevista < servico.dataFim ";
			}
		}
		if(!dtInicPrev.equals("") && dtFimPrev.equals("") )//Procura somente por uma data específica prevista
		{
			listaServ += " and servico.dataInicio = '"+dtInic+"' ";
			if(!depart.equals("") && !depart.equals("-1"))//Datas selecionadas e com departamento específico
			{
				listaServ += " and servico.nivelUsuario = '"+depart+"' ";
			}
			if(St == 1){//Datas selecionadas e com um status específico
				listaServ += "and servico.status = 'M' ";
			}
			if(St == 2)
			{
				listaServ += " and servico.status = 'F' ";
			}
			if(prazo){// Para que esteja fora do prazo, o select tem que retornar os servico que estejam data fim maior que data prevista
				//listaServ += " and servico.dataprevista < curdate() ";
				listaServ += " and servico.dataprevista < servico.dataFim ";
			}
		}
		if(dtInic.equals("") && dtFim.equals("") && St!=2 && St != 1 && !prazo && !depart.equals("") && !depart.equals("-1"))//Somente o departamento atual foi consultado
		{
			listaServ += " and servico.nivelUsuario = '"+depart+"' ";
		}
		if(St != 0 && depart.equals("-1"))//somente a cusulta por status foi usada
		{
			if(dtInic.equals("") && dtFim.equals("")){
				if(St == 1)
				{
					listaServ += " and servico.status = 'M' ";
				}
				if(St == 2)
				{
					listaServ += " and servico.status = 'F' ";
				}
			}
		}
		if(prazo)//Somente a consulta por prazo
		{
			if(!Controle.equals("1"))
				listaServ += " and servico.dataprevista < servico.dataFim ";
		}
		//listaServ += " order by servico.OS ";*/
		return listaServ;
	}
	
	//Pesquisa todos os Serviços Não-Finalizados Por Empresa
	public String listaServicosPendentesNovo() {
			String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.*, ";
			listaServ += " case servico.dataprevista ";
			listaServ += " when '0000-00-00' then \"0\"";
			listaServ += " else servico.dataprevista";
			listaServ += " end as dataprevista1, ";
			listaServ += " case servico.dataAgendamento ";
			listaServ += " when '0000-00-00' then \"0\"";
			listaServ += " else servico.dataAgendamento ";
			listaServ += " end as dataAgendamento1 ";
			listaServ += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
			listaServ += "WHERE servico.empresaID = '"+empresa.empresaID+"' ";
			listaServ += "and servico.finalizado <> 'F' AND servico.status <> 'F' and servico.passo NOT IN ('ORCAMENTO', 'ORÇAMENTO', 'ORCAMENTO ACEITO', 'ORÇAMENTO ACEITO') ORDER BY servico.servicoID DESC";
			
			return listaServ;
		}
	
	//select n.*, s.*, u.* from nivelusuario n, servico s, usuario u
	//where
	//n.IDusuario = u.usuarioID
	//and n.servicoID = 86
	//and s.visualizacao = 'V'
	//and n.status = 'V'
	//order by n.dataAlteracao DESC
	//LIMIT 1
	
	public String listaVisualizado(String servicoID_){
		String lista = " select nivelusuario.*, usuario.* from nivelusuario ";
		lista += " inner join usuario on usuario.usuarioID = nivelusuario.IDusuario";
		lista += " 	inner join servico on servico.servicoID = nivelusuario.servicoID";
		lista += " where servico.visualizacao = 'S'"; 
		lista += " and nivelusuario.status = 'V'";
		lista += " and servico.servicoID ='" + servicoID_+"'";
		lista += " order by dataAlteracao desc limit 1";
		return lista;
	}
	
	public String listaVisualizado2(String servicoID_){
		String lista = " select nivelusuario.*, usuario.* from nivelusuario ";
		lista += " inner join usuario on usuario.usuarioID = nivelusuario.IDusuario";
		lista += " 	inner join servico on servico.servicoID = nivelusuario.servicoID";
		lista += " where servico.visualizadoR2 = 'V'"; 
		lista += " and nivelusuario.status = 'V'";
		lista += " and servico.servicoID ='" + servicoID_+"'";
		lista += " order by dataAlteracao desc limit 1";
		return lista;
	}
	
	//Pesquisa todos os Serviços Não-Finalizados Por Empresa
	public String listaServicosPendentes() {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.*, ";
		listaServ += " case servico.dataprevista ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataprevista1, ";
		listaServ += " case servico.dataAgendamento ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataAgendamento1 ";
		listaServ += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += "WHERE servico.empresaID = '"+empresa.empresaID+"' ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
	
	public String listaServicosPendentes_OS(String OS, String Ano) {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.*, ";
		listaServ += " case servico.dataprevista ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataprevista1, ";
		listaServ += " case servico.dataAgendamento ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataAgendamento1 ";
		listaServ += " FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += " WHERE servico.empresaID = '"+empresa.empresaID+"' AND OS= '"+OS+"' AND anoServico = '"+Ano+"'";
		listaServ += " ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
	
	public String listaServicosPendentesPorNomeS(String nome) {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.*, ";
		listaServ += " case servico.dataprevista ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataprevista1, ";
		listaServ += " case servico.dataAgendamento ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataAgendamento1 ";
		listaServ += " FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += " WHERE finalizado <> 'F' AND status <> 'F' AND servico.empresaID = '"+empresa.empresaID+"'";
		listaServ += " AND cliente.clienteNomeFantasia LIKE '%"+nome+"%' ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
		
	
	public String listaServicosPendentesPorCamada(String nivelUsuario) {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.*, ";
		listaServ += " case servico.dataprevista ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataprevista1, ";
		listaServ += " case servico.dataAgendamento ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataAgendamento";
		listaServ += " end as dataAgendamento1 ";
		listaServ += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += "WHERE finalizado <> 'F' AND servico.passo NOT IN ('ORCAMENTO', 'ORÇAMENTO', 'ORCAMENTO ACEITO', 'ORÇAMENTO ACEITO') AND status <> 'F'  AND servico.empresaID = '"+empresa.empresaID+"' and nivelUsuario = '"+ nivelUsuario +"' ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
	public String listaOrcamentos(String nivelUsuario) {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.*, ";
		listaServ += " case servico.dataprevista ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataprevista1, ";
		listaServ += " case servico.dataAgendamento ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataAgendamento";
		listaServ += " end as dataAgendamento1 ";
		listaServ += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += "WHERE finalizado <> 'F' AND servico.tipo = '1' AND status <> 'F'  AND servico.empresaID = '"+empresa.empresaID+"' ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
	
	public String listaServicosPendentesPorCamadaRotina2(String nivelUsuario) {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.*, ";
		listaServ += " case servico.dataprevista ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataprevista1, ";
		listaServ += " case servico.dataAgendamento ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataAgendamento";
		listaServ += " end as dataAgendamento1 ";
		listaServ += " FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += " WHERE finalizado <> 'F' AND status <> 'F'  AND servico.empresaID = '"+empresa.empresaID+"' and nivelUsuario IN ('"+ nivelUsuario +"', '3', '4', '5', '6')";
		listaServ += " and rotina IN ('1','2')";
		listaServ += " and passo IN ('PRD/NOVO','PRD/IMPRESSAO', 'PRD/ARTE FINAL', 'PRD/ACABAMENTO', 'PRODUCAO')";
		listaServ += " and passo NOT IN ('ORCAMENTO', 'ORÇAMENTO', 'ORCAMENTO ACEITO', 'ORÇAMENTO ACEITO') ";
		listaServ += " ORDER BY servico.servicoID DESC";
		return listaServ;
	}
	
	public String listaOrcamentosPendentes(String nivelUsuario) {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.*, ";
		listaServ += " case servico.dataprevista ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataprevista";
		listaServ += " end as dataprevista1, ";
		listaServ += " case servico.dataAgendamento ";
		listaServ += " when '0000-00-00' then \"0\"";
		listaServ += " else servico.dataAgendamento";
		listaServ += " end as dataAgendamento1 ";
		listaServ += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += "WHERE finalizado <> 'F' AND status <> 'F' AND tipo = '1'  AND servico.empresaID = '"+empresa.empresaID+"' and nivelUsuario = '"+ nivelUsuario +"' ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
	
	
	//Pesquisa Serviços por cliente
	public String pesquisaPorCliente(String keyword) {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
		listaServ += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += "WHERE finalizado <> 'F' AND status <> 'F' AND status <> 'F' AND servico.empresaID = '"+empresa.empresaID+"' ";
		listaServ += "AND cliente.clienteNomeFantasia LIKE '%"+keyword+"%' ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
	
	//Pesuisa todos os Serviços Finalizados
	public String servicosFechados(String dataInicial, String dataFinal) {
			String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
			busca += "cliente.clienteID, cliente.clienteNomeFantasia, ";
			busca += "servico.* FROM servico ";
			busca += "INNER JOIN formapagamento ON formapagamento.formID = servico.formPagID ";
			busca += "LEFT JOIN cliente ON cliente.clienteID = servico.clienteID ";
			busca += "WHERE servico.dataFim BETWEEN '"+dataInicial+"' AND '"+dataFinal+" 23:59:59"+"' ";
			busca += "AND servico.status = 'F' AND servico.empresaID = '"+empresa.empresaID+"' ";
			busca += "ORDER BY dataFim DESC";
			
			return busca;
	}
	
	
	//Pesquisa a soma dos Serviços finalizados em um determinado periodo com um determinado usuário
	public String somaServicos(int servicoInicio, int servicoFim) {
		String servicos = "SELECT SUM(valor) as totalServicos ";
		servicos += "FROM servico ";
		servicos += "WHERE servicoID BETWEEN '"+servicoInicio+"' AND '"+servicoFim+"' ";
		servicos += "AND usuario = '"+usuario.usuarioID+"' AND status = 'F'";
		
		return servicos;
	}
	
	//Pesquisa a soma dos Serviços finalizados em um determinado periodo com um determinado usuário
	public String somaServicosPorData(String dataFinal) {
		String servicos = "SELECT SUM(valor) as totalServicos ";
		servicos += "FROM servico ";
		servicos += "WHERE dataFim LIKE '%"+dataFinal+"%' ";
		servicos += "AND usuario = '"+usuario.usuarioID+"' AND status = 'F'";
		
		return servicos;
	}
	
	//Pesquisa a soma dos Serviços de acrdo com a forma de pagamento também
	public String somaServicoFormaPgto(int servicoInicio, int servicoFim) {
		String vendas = "SELECT formapagamento.formID, formapagamento.descricao, ";
		vendas += "SUM(servico.valor) as totalServicos, servico.formPagID ";
		vendas += "FROM servico ";
		vendas += "INNER JOIN formapagamento ON formapagamento.formID = servico.formPagID ";
		vendas += "WHERE servico.servicoID BETWEEN '"+servicoInicio+"' AND '"+servicoFim+"' ";
		vendas += "AND servico.usuario = '"+usuario.usuarioID+"' AND servico.status = 'F' ";
		vendas += "GROUP BY servico.formPagID";
		
		return vendas;
	}
	
	//Pesquisa a soma dos Serviços de acrdo com a forma de pagamento também
	public String somaServicoFormaPgtoPorData(String dataFinal) {
		String vendas = "SELECT formapagamento.formID, formapagamento.descricao, ";
		vendas += "SUM(servico.valor) as totalServicos, servico.formPagID ";
		vendas += "FROM servico ";
		vendas += "INNER JOIN formapagamento ON formapagamento.formID = servico.formPagID ";
		vendas += "WHERE servico.dataFim LIKE '%"+dataFinal+"%' ";
		vendas += "AND servico.usuario = '"+usuario.usuarioID+"' AND servico.status = 'F' ";
		vendas += "GROUP BY servico.formPagID";
		
		return vendas;
	}
	
	
	//Pesquisa qual foi o Ultimo Serviço Realizado
	public String ultimaServicoPorUsuario(){
		return "SELECT * FROM servico WHERE usuario = '"+usuario.usuarioID+"' AND status = 'F' ORDER BY servicoID DESC LIMIT 1";
	}
	
	//Pesquisa dados do ultimo Servico Cadastrado no Sistema
	public String ultimoServico() {
		return "SELECT * FROM servico ORDER BY servicoID DESC LIMIT 1";
	}
	
	public String ultimoServico_ano(int ano) {
		return "SELECT * FROM servico WHERE anoServico = "+ ano +" ORDER BY OS DESC LIMIT 1";
		//return "SELECT OS FROM servico WHERE anoServico = "+ ano +" ORDER BY OS DESC LIMIT 1";
	}
	
	//Pesquisa ID do ultimo Servico Cadastrado no Sistema
		public String ultimoID() {
			
			return "SELECT servicoID+1 as ID FROM servico ORDER BY servicoID DESC LIMIT 1";
		}
		
		public String valoresJaPagos(String OS, String Ano){
			
			return "SELECT * FROM `servico` WHERE `formPagID` <> '0' and `entrada` <> '0.00' and OS= '"+OS+"' and anoServico = '"+Ano+"'";
		}
	
	
	//Cadastra um novo Serviço
	public String cadastraServico(String nivelUsuario_) {
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(OS, anoServico, clienteID, empresaID, descricao, dataInicio, dataprevista, valor, usuario, nivelUsuario, passo, rotina) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+OS+"', '"+anoServico+"', '"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"','"+ dataPrevista +"','"+valor+"', '"+usuario.usuarioID+"','"+nivelUsuario_+"','PRODUCAO', '2')";
		
		return salvaServ;
	}
	
	public String cadastraServicoOrcamento(String nivelUsuario_) {
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(OS, anoServico, clienteID, empresaID, descricao, dataInicio, dataprevista, valor, usuario, nivelUsuario, passo, tipo ,rotina) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+OS+"', '"+anoServico+"', '"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"','"+ dataPrevista +"','"+valor+"', '"+usuario.usuarioID+"','"+nivelUsuario_+"','ORÇAMENTO', '1','2')";
		
		return salvaServ;
	}
	
	public String cadastraServicoCaminho(String nivelUsuario, String caminho, String Rotina) {
		String cam = caminho.replace("\\", "\\");
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(OS, anoServico, clienteID, empresaID, descricao, dataInicio, dataprevista, valor, usuario, nivelUsuario, caminhoArte, rotina) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+OS+"', '"+anoServico+"', '"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"','"+ dataPrevista +"','"+valor+"', '"+usuario.usuarioID+"','"+nivelUsuario+"','"+cam+"', '"+Rotina+"')";
		
		return salvaServ;
	}
	public String cadastraServicoCaminhoOrcamento(String nivelUsuario, String caminho, String Rotina) {
		String cam = caminho.replace("\\", "\\");
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(OS, anoServico, clienteID, empresaID, descricao, dataInicio, dataprevista, valor, usuario, nivelUsuario, caminhoArte, passo, tipo,rotina) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+OS+"', '"+anoServico+"', '"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"','"+ dataPrevista +"','"+valor+"', '"+usuario.usuarioID+"','"+nivelUsuario+"','"+cam+"','ORÇAMENTO','1','"+Rotina+"')";
		
		return salvaServ;
	}
	
	public String cadastraServicoCaminhoOrçamento3(String nivelUsuario,  String Rotina) {//Cadastro de Orçamentos Rotina 3
		//String cam = caminho.replace("\\", "\\");
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(OS, anoServico, clienteID, empresaID, descricao, dataInicio, dataprevista, valor, usuario, nivelUsuario, passo, tipo,rotina) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+OS+"', '"+anoServico+"', '"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"','"+ dataPrevista +"','"+valor+"', '"+usuario.usuarioID+"','"+nivelUsuario+"','ORÇAMENTO','1','"+Rotina+"')";
		
		return salvaServ;
	}
	
	public String cadastraServicoCaminho2(String nivelUsuario, String caminho, String Rotina) {
		String cam = caminho.replace("\\", "\\");
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(OS, anoServico, clienteID, empresaID, descricao, dataInicio, dataprevista, valor, usuario, nivelUsuario, caminhoArte, passo, rotina) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+OS+"', '"+anoServico+"', '"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"','"+ dataPrevista +"','"+valor+"', '"+usuario.usuarioID+"','"+nivelUsuario+"','"+cam+"','PRD/NOVO','"+Rotina+"')";
		
		return salvaServ;
	}
	
	public String cadastraServicoCaminho2Orcamento(String nivelUsuario, String caminho, String Rotina) {//Cadastra Orçamentos Para a Rotina de Trabalho 2 
		String cam = caminho.replace("\\", "\\");
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(OS, anoServico, clienteID, empresaID, descricao, dataInicio, dataprevista, valor, usuario, nivelUsuario, caminhoArte, passo, tipo,rotina) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+OS+"', '"+anoServico+"', '"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"','"+ dataPrevista +"','"+valor+"', '"+usuario.usuarioID+"','"+nivelUsuario+"','"+cam+"','ORÇAMENTO','1','"+Rotina+"')";
		
		return salvaServ;
	}
	
	public String cadastraOrcamento(String nivelUsuario) {
		//String cam = caminho.replace("\\", "\\");
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(OS, anoServico, clienteID, empresaID, descricao, dataInicio, dataprevista, valor, usuario, nivelUsuario, passo,tipo) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+OS+"', '"+anoServico+"', '"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"','"+ dataPrevista +"','"+valor+"', '"+usuario.usuarioID+"','"+nivelUsuario+"','ORÇAMENTO','1')";
		
		return salvaServ;
	}
	
	//Completa as informações do Serviço
	public String completaServico() {
		
		/*String completa = "UPDATE servico ";
		completa += "SET formPagID = '"+formaPagamento.formPagID+"', vezes = '"+vezes+"', ";
		completa += "valor = '"+valor+"', entrada = '"+entrada+"', troco = '"+troco+"', desconto = '"+desconto+"', status = 'F' ";
		completa += "WHERE servicoID = '"+servicoID+"'";*/
		
		String completa = "UPDATE servico ";
		completa += " SET formPagID = '"+formaPagamento.formPagID+"', vezes = '"+vezes+"', ";
		completa += " valor='"+valor+"', entrada='"+entrada+"', troco='"+troco+"', desconto='"+desconto+"' "; 
		completa += " WHERE servicoID = '"+servicoID+"'";
		
		return completa;
	}
	
	//Atualiza Serviço
	public String atualizaServico() {
		String alterServ = "UPDATE servico ";
		alterServ += "SET descricao = '"+descricao+"' ";
		alterServ += "WHERE servicoID = '"+servicoID+"'";
		
		return alterServ;
	}
	
	public String atualizaFormPag(String OS, String Ano, String formID_) {
		String alterServ = "update servico ";
		alterServ += "set formPagID = '"+formID_+"' ";
		alterServ += "where OS = '"+OS+"'";
		alterServ += "and anoServico = '"+Ano+"'";
		
		return alterServ;
	}
	
	public String atualizaServico_nivelUsuario() {
		String alterServ = "UPDATE servico ";
		alterServ += "SET nivelUsuario = '"+3+"' ";
		alterServ += "WHERE servicoID = '"+servicoID+"'";
		
		return alterServ;
	}
	
	
	//Atualiza o valor do Servico
	public String atualizaValorServico() {
		String alterServ = "UPDATE servico ";
		alterServ += "SET valor = '"+valor+"' ";
		alterServ += "WHERE servicoID = '"+servicoID+"'";
		
		return alterServ;
	}
	
	//======== SUBSTITUIDO PELO MÉTODO >> completaServico() << =========
	//Finaliza Serviço
	//public String finalizaServico() {
	//	String fimServ = "UPDATE servico ";
	//	fimServ += "SET status = 'F' WHERE servicoID = '"+servicoID+"'";
	//	
	//	return fimServ;
	//}
	
	
	//Muda o status (Visualizado) para S(SIM)
	public String visualizado() {
		return "UPDATE servico SET visualizacao = 'S' WHERE servicoID = '"+servicoID+"'";
	}
	
	public String visualizado2() {
		return "UPDATE servico SET visualizadoR2 = 'V' WHERE servicoID = '"+servicoID+"'";
	}
	
	public String dataprevista_() {
		return "UPDATE servico SET dataprevista = '"+dataPrevista+"' WHERE servicoID = '"+servicoID+"'";
	}
	
	public String upCaminho(String caminho) {
		return "UPDATE servico SET caminhoArte = '"+caminho+"' WHERE servicoID = '"+servicoID+"'";
	}
	
	public String UPProdutoServico(String prodID, String qtd, String Alt, String Larg) {
		String up = "UPDATE servicoproduto SET produtoID='"+prodID+"', qtdProduto='"+qtd+"', altura='"+Alt+"',largura='"+Larg+"' WHERE servicoID = '"+servicoID+"'";
		return up;
	}
	
	//Muda o status (Visualizado) para N(NÃO)
	public String naoVisualizado() {
		return "UPDATE servico SET visualizacao = 'N' WHERE servicoID = '"+servicoID+"'";
	}
	public String encaminhado(int nivelUsuario, String caminho) {
		return "UPDATE servico SET visualizacao = 'N', nivelUsuario = '"+nivelUsuario+"', caminhoArte='"+caminho+"' WHERE servicoID = '"+servicoID+"'";
	}
	
	public String encaminhado1(int nivelUsuario, String passo, int sID) {
		String update = "UPDATE servico SET visualizacao = 'N', nivelUsuario = '"+nivelUsuario+"', passo = '"+ passo +"'  WHERE servicoID = '"+ sID +"'";
		return update;
	}
	
	public String reagenda(int nivelUsuario, String passo, int sID, String razao) {
		String update = "UPDATE servico SET visualizacao = 'N', nivelUsuario = '"+nivelUsuario+"', passo = '"+ passo +"', observacao ='"+razao +"'  WHERE servicoID = '"+ sID +"'";
		return update;
	}
	
	public String encaminhaOrcamento(int nivelUsuario, String passo, String OS, String razao) {
		String update = "UPDATE servico SET visualizacao = 'N', nivelUsuario = '"+nivelUsuario+"', passo = '"+ passo +"', obsOrcamento ='"+razao +"'  WHERE OS = '"+ OS +"'";
		return update;
	}
	
	public String reagendaNova(int nivelUsuario, String passo, int sID, String data) {
		String update = "UPDATE servico SET visualizacao = 'N', nivelUsuario = '"+nivelUsuario+"', passo = '"+ passo +"', dataAgendamento ='"+data +"', reagendado=1  WHERE servicoID = '"+ sID +"'";
		return update;
	}
	
	
	public String finalizaOS(int nivelUsuario, String fase) {
		String teste = "UPDATE servico SET visualizacao = 'S', finalizado = 'F', status = 'F' , nivelUsuario = '"+nivelUsuario+"',passo= '"+fase+"'   WHERE servicoID = '"+servicoID+"'"; 
		return teste;
	}//Finaliza Definitivamente a OS
	
	//Muda o status (Visualizado) para N(NÃO)
	public String naoFinalizado() {
		return "UPDATE servico SET finalizado = 'N' WHERE servicoID = '"+servicoID+"'";
	}
	
	public String atualizaHistoricoStatusVisualizado(String nivelUsuario, String servicoID, String IDusuario) {
		Datas data = new Datas();
		String ano = data.anoAtual();
		return "INSERT INTO nivelusuario(status, nivelUsuario, servicoID, ano, IDusuario) VALUE( 'V' ,"+nivelUsuario+", "+servicoID+","+ano+" , "+IDusuario+")";
	}
	
	public String atualizaHistoricoStatusEncaminhado(String nivelUsuario, String servicoID, String IDusuario) {
		Datas data = new Datas();
		String ano = data.anoAtual();
		return "INSERT INTO nivelusuario(status, nivelUsuario, servicoID, ano, IDusuario) VALUE( 'E' ,"+nivelUsuario+", "+servicoID+","+ano+" , "+IDusuario+")";
	}
	
	public String atualizaHistoricoStatusFinalizado(String nivelUsuario, String servicoID, String IDusuario, String passo) {
		Datas data = new Datas();
		String ano = data.anoAtual();
		return "INSERT INTO nivelusuario(status, nivelUsuario, servicoID, ano, IDusuario, passo) VALUE( 'F' ,"+nivelUsuario+", "+servicoID+","+ano+" , "+IDusuario+",'"+passo+"')";
	}
	
	public String atualizaHistoricoSolReagenda(String nivelUsuario, String servicoID, String IDusuario, String passo, String razao) {
		Datas data = new Datas();
		String ano = data.anoAtual();
		return "INSERT INTO nivelusuario(status, nivelUsuario, servicoID, ano, IDusuario, passo, obsAgendamento) VALUE( 'F' ,"+nivelUsuario+", "+servicoID+","+ano+" , "+IDusuario+",'"+passo+"', '"+razao+"')";
	}
	public String atualizaHistoricoSolReagenda1(String nivelUsuario, String servicoID, String IDusuario, String passo, String data_) {
		Datas data = new Datas();
		String ano = data.anoAtual();
		return "INSERT INTO nivelusuario(status, nivelUsuario, servicoID, ano, IDusuario, passo, dataAgendamento) VALUE( 'F' ,"+nivelUsuario+", "+servicoID+","+ano+" , "+IDusuario+",'"+passo+"', '"+data_+"')";
	}
	//Exclui Serviço
	public String excluiServico() {
		return "DELETE FROM servico WHERE servicoID = '"+servicoID+"'";
	}
	
	public String atualizaHistoricoOrcamento(String nivelUsuario, String servicoID, String IDusuario, String passo, String razao) {
		Datas data = new Datas();
		String ano = data.anoAtual();
		return "INSERT INTO nivelusuario(status, nivelUsuario, servicoID, ano, IDusuario, passo, obsOrcamento) VALUE( 'F' ,"+nivelUsuario+", "+servicoID+","+ano+" , "+IDusuario+",'"+passo+"', '"+razao+"')";
	}
	
	/*public int contaDias(String dataFim)
	{
		String[] data = dataFim.split("/");
		int dias = 0;
		// Data inicial
        Calendar dataInicio = Calendar.getInstance();
        // Atribui a data de 10/FEV/2008
        dataInicio.set(Integer.parseInt(data[0]), Integer.parseInt(data[1]), Integer.parseInt(data[2]));
        // Data de hoje
        Calendar dataFinal = Calendar.getInstance();
        // Calcula a diferença entre hoje e da data de inicio
        long diferenca = dataFinal.getTimeInMillis() - dataInicio.getTimeInMillis();
        // Quantidade de milissegundos em um dia
        int tempoDia = 1000 * 60 * 60 * 24;
        long diasDiferenca = diferenca / tempoDia;
        
		return (int) diasDiferenca;
	}*/
	
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Serviço Cadastrado com Sucesso!";
			
		case 2:
			return "Serviço Atualizado com Sucesso!";
			
		case 3:
			return "OS Excluido com Sucesso!";
			
		case 4:
			return "Confirmado a Visualização";
		
		case 5:
			return "Confirmado a Finalização";
		case 6:
			return "Serviço Encaminhado com Sucesso";	
		case 10:
			return "Favor abrir caixa antes de cadastrar um novo serviço";
		case 11:
			return "Nenhum pagamento registrado, não é possivel encerrar o serviço!";	

		default:
			return "";
		}
	}

}
