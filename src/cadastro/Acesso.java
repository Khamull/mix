package cadastro;

public class Acesso {
	
	public int acessoID;
	public String acessoIP;
	public String usuario;
	
	
	//Metodo que retorna o IP da máquina
	public String retornaIP(){
		try   
	      {  
	             java.net.InetAddress i =java.net.InetAddress.getLocalHost();  
	             acessoIP = i.getHostAddress();  
	         }  
	       catch(Exception e)  
	      {  
	          e.printStackTrace();  
	         }  
	        
	       return acessoIP;
	}
	
	
	//Salva o Acesso na Máquina
	public String registraAcesso(String ip){
		return "INSERT INTO acesso (acessoUsuario, acessoIP) VALUES ('"+usuario+"', '"+ip+"')";
	}

}
