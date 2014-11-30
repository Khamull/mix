package formatar;

import java.util.Calendar;

public class Datas {
	
	//Instancia um Objeto do tipo Calendar
	Calendar hoje = Calendar.getInstance();
	
	//Retorna dia Atual
	public String diaAtual(){
		int d;
		String dia;
		//recupera o dia atual
		d = hoje.get(Calendar.DAY_OF_MONTH);
		//converte para String pois ele vem no formato int
		dia = String.valueOf(d);
		//verifica se não veio com duas casas e converte para duas casas
		if(dia.length() < 2){
			dia = "0"+dia;
		}
		
		return dia;
	}
	
	
	//Retorna mes Atual
	public String mesAtual(){
		int m;
		String mes;
		//recupera o mes atual
		m = hoje.get(Calendar.MONTH);
		//converte para String pois ele vem no formato int
		mes = String.valueOf(1+m);
		//verifica se não veio com duas casas e converte para duas casas
		if(mes.length() < 2){
			mes = "0"+mes;
		}
		
		return mes;
	}
	
	//Retorna ano Atual
	public String anoAtual(){
		int a;
		String ano;
		//recupera o mes atual
		a = hoje.get(Calendar.YEAR);
		//converte para String pois ele vem no formato int
		ano = String.valueOf(a);
		
		return ano;
	}
	
	
	//Retorna data Atual Formatada
	public String dataAtual(){
		String dia = diaAtual();
		String mes = mesAtual();
		String ano = anoAtual();
		String dataHoje;
		
		dataHoje = dia+"/"+mes+"/"+ano;
		
		
		return dataHoje;
	}
	
	
	//Retorna data que foi passada por parametro no formato que salva no banco de dados [yyyy-MM-dd]
	public String converteParaData(String dataSimples){
		//Alimenta um Array dando um SPLIT na data retirando as barras
		String[] a = new String[3];
		a = dataSimples.split("/");
		//recupera o valor 
		//Forma a data da maneira formatada EX: de ( 03/07/2012 ) para ( 2013-07-03 )
		String dataFormatada = a[2]+"-"+a[1]+"-"+a[0];
		
		//Retorna a data ja Formatada
		return dataFormatada;		
	}
	
	//Retorna data que foi passada por parametro no formato que apresenta na Tela [dd-MM-yyyy]
	public String converteDeData(String dataSimples){
		//Alimenta um Array dando um SPLIT na data retirando os traços
		String[] a = new String[3];
		a = dataSimples.split("-");
		//recupera o valor
		//Forma a data da maneira formatada EX: de ( 2013-07-03 ) para ( 03/07/2012 )
		String dataFormatada = a[2]+"/"+a[1]+"/"+a[0];
		
		//Retorna a data ja Formatada
		return dataFormatada;
	}
	
	
	//Retorna data que foi passada por parametro no formato que salva no banco de dados [yyyy-MM-dd] e já trata os Meses
	public String trataData(String dataSimples){
		//Alimenta um Array dando um SPLIT na data retirando as barras
		String[] a = new String[3];
		a = dataSimples.split("/");
		
		String dia = a[0];
		String mes = a[1];
		String ano = a[2];
		
		int mes1 = Integer.parseInt(mes);//Int para tratar o mes
		int ano1 = Integer.parseInt(ano);//Int para tratar o ano
		//Trata os meses
		if(mes1 > 12 && mes1 <= 24){
			mes = String.valueOf((mes1-12));
			ano = String.valueOf(ano1+1);
		}else if(mes1 > 24 && mes1 <= 36){
			mes = String.valueOf((mes1-24));
			ano = String.valueOf(ano1+2);
		}else if(mes1 > 36 && mes1 <= 48){
			mes = String.valueOf((mes1-36));
			ano = String.valueOf(ano1+3);
		}else if(mes1 > 48 && mes1 <= 60){
			mes = String.valueOf((mes1-48));
			ano = String.valueOf(ano1+4);
		}else if(mes1 > 60 && mes1 <= 72){
			mes = String.valueOf((mes1-60));
			ano = String.valueOf(ano1+5);
		}else if(mes1 > 72 && mes1 <= 84){
			mes = String.valueOf((mes1-72));
			ano = String.valueOf(ano1+6);
		}
		
		//verifica se não veio com duas casas e converte para duas casas
		if(mes.length() < 2){
			mes = "0"+mes;
		}
		
		//recupera o valor 
		//Forma a data da maneira formatada EX: de ( 03/07/2012 ) para ( 2013-07-03 )
		String dataFormatada = ano+"-"+mes+"-"+dia;
		
		//Retorna a data ja Formatada
		return dataFormatada;		
	}
	
	//Metodo que retorna nome do Mes
	public String retornaData(int mes) {
		switch (mes) {
		case 1:
			return "JANEIRO";
			
		case 2:
			return "FEVEREIRO";
			
		case 3:
			return "MARÇO";
			
		case 4:
			return "ABRIL";
			
		case 5:
			return "MAIO";
			
		case 6:
			return "JUNHO";
			
		case 7:
			return "JULHO";
			
		case 8:
			return "AGOSTO";
			
		case 9:
			return "SETEMBRO";
			
		case 10:
			return "OUTUBRO";
			
		case 11:
			return "NOVEMBRO";
			
		case 12:
			return "DEZEMBRO";

		default:
			return "";
		}
	}
	
	
	//Esse Metodo pega o Mes e o Dia e verifica se Ele Existe
	public String verificaSeExiste(int dia, int mes) {
				
		if(dia >= 28 && mes == 2){
			return "28-"+mes;
		}else if(dia >= 30 && mes == 4 || dia >= 30 && mes == 6 || dia >= 30 && mes == 9 || dia >= 30 && mes == 11){
			return "30-"+mes;
		}else if(dia >= 28 && mes == 14){
			return "28-"+mes;
		}else if(dia >= 30 && mes == 16 || dia >= 30 && mes == 18 || dia >= 30 && mes == 21 || dia >= 30 && mes == 23){
			return "30-"+mes;
		}else if(dia >= 28 && mes == 26){
			return "28-"+mes;
		}else if(dia >= 30 && mes == 28 || dia >= 30 && mes == 30 || dia >= 30 && mes == 33 || dia >= 30 && mes == 35){
			return "30-"+mes;
		}else if(dia >= 28 && mes == 38){
			return "28-"+mes;
		}else if(dia >= 30 && mes == 40 || dia >= 30 && mes == 42 || dia >= 30 && mes == 45 || dia >= 30 && mes == 47){
			return "30-"+mes;
		}else if(dia >= 28 && mes == 50){
			return "28-"+mes;
		}else if(dia >= 30 && mes == 52 || dia >= 30 && mes == 54 || dia >= 30 && mes == 37 || dia >= 30 && mes == 59){
			return "30-"+mes;
		}else if(dia >= 28 && mes == 62){
			return "28-"+mes;
		}else if(dia >= 30 && mes == 64 || dia >= 30 && mes == 66 || dia >= 30 && mes == 69 || dia >= 30 && mes == 71){
			return "30-"+mes;
		}
		
		
		return dia+"-"+mes;
	}
	
	//Esse Método tem a Função de receber uma data no Formato Padrão SQL [yyyy-MM-dd]
	//e verificar se essa data passada por parametro é inferior a de HOJE!
	//Ou seja: Serve para verifcar se o prazo está fora ou não
	public String verificaDataVencimento(String dataSimples) {
		
		//Quebra a Data e tres parte ( dia , mes e ano)
		String[] a = new String[3];
		a = dataSimples.split("-");
		
		//Recupera a data de hoje
		int dia = Integer.parseInt(diaAtual());
		int mes = Integer.parseInt(mesAtual());
		int ano = Integer.parseInt(anoAtual());
		
		
		//Recupera a data passada
		int diaP = Integer.parseInt(a[2]);
		int mesP = Integer.parseInt(a[1]);
		int anoP = Integer.parseInt(a[0]);
		
		//Verifica se o a Data é igual a de hoje
		if(anoP == ano && mesP == mes && diaP == dia){
			return "igual";
		}else if(anoP <= ano && mesP <= mes && diaP < dia){
			return "menor";
		}else if(anoP <= ano && mesP < mes){
			return "menor";
		}else {
			return "maior";
		}
		
	}
	
	public String verificaDataVencimento2(String dataSimples) {
		
		//Quebra a Data e tres parte ( dia , mes e ano)
		String[] a = new String[3];
		a = dataSimples.split("-");
		
		//Recupera a data de hoje
		int dia = Integer.parseInt(diaAtual());
		int mes = Integer.parseInt(mesAtual());
		int ano = Integer.parseInt(anoAtual());
		
		
		//Recupera a data passada
		int diaP = Integer.parseInt(a[2]);
		int mesP = Integer.parseInt(a[1]);
		int anoP = Integer.parseInt(a[0]);
		
		//Verifica se o a Data é igual a de hoje
		if(anoP == ano && mesP == mes && diaP == dia){
			return "igual";
		}else if(anoP <= ano && mesP <= mes && diaP < dia){
			return "menor";
		}else if(anoP <= ano && mesP < mes){
			return "menor";
		}else {
			return "maior";
		}
		
	}
	
	
	
	//Esse Método forma uma Data usando as informações passadas por parametro
	//em seguida pega o intervalo de dias também passado como parametreo
	//e adiciona essa quantidade de dias a data.
	//Após feito isso ele retorna a Data já Atualizada
	public String calculaIntervalo(int ano, int mes, int dia, int dias) {
		
		hoje.set(ano, (mes-1), dia);
		
		hoje.add(Calendar.DATE, dias);
		
		int d = hoje.get(Calendar.DATE);
		int m = hoje.get(Calendar.MONTH);		
		int a = hoje.get(Calendar.YEAR);
		
				
		String data = String.valueOf(a)+"-"+String.valueOf(m+1)+"-"+String.valueOf(d);
		
		return data;
	}
	
	//Esse Método forma uma Data usando as informações passadas por parametro
	//em seguida pega o intervalo de dias também passado como parametreo
	//e subtrai essa quantidade de dias a data.
	//Após feito isso ele retorna a Data já Atualizada
	public String subtrairIntervalo(String dataSimples, int dias) {
		
		//Quebra a Data e tres parte ( dia , mes e ano)
		String[] a = new String[3];
		a = dataSimples.split("-");
		
		//Recupera a data passada
		int dia = Integer.parseInt(a[2]);
		int mes = Integer.parseInt(a[1]);
		int ano = Integer.parseInt(a[0]);
		
		hoje.set(ano, (mes-1), dia);
		
		hoje.add(Calendar.DATE, dias);
		
		int d = hoje.get(Calendar.DATE);
		int m = hoje.get(Calendar.MONTH);		
		int aa = hoje.get(Calendar.YEAR);
		
				
		String data = String.valueOf(aa)+"-"+String.valueOf(m+1)+"-"+String.valueOf(d);
		
		return data;
	}

}
