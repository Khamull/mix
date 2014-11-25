<%@ page contentType="text/html; charset=iso-8859-2" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Exemplo busca CEP Ajax</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- Faça o include da lib do jQuery -->
<script type="text/javascript" src="js/cep.js"></script>
<script type="text/javascript">
	// Função única que fará a transação
	function getEndereco() {
			// Se o campo CEP não estiver vazio
			if($.trim($("#cep").val()) != ""){
				/* 
					Para conectar no serviço e executar o json, precisamos usar a função
					getScript do jQuery, o getScript e o dataType:"jsonp" conseguem fazer o cross-domain, os outros
					dataTypes não possibilitam esta interação entre domínios diferentes
					Estou chamando a url do serviço passando o parâmetro "formato=javascript" e o CEP digitado no formulário
					http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val()
				*/
				$.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val(), function(){
					// o getScript dá um eval no script, então é só ler!
					//Se o resultado for igual a 1
			  		if(resultadoCEP["resultado"]){
						// troca o valor dos elementos
						$("#rua").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));
						$("#bairro").val(unescape(resultadoCEP["bairro"]));
						$("#cidade").val(unescape(resultadoCEP["cidade"]));
						$("#estado").val(unescape(resultadoCEP["uf"]));
					}else{
						alert("Endereço não encontrado");
					}
				});				
			}			
	}
</script>

</head>

<body>


<!-- 
	O formulário é simples, a única coisa diferente é o atributo "onBlur" no campo "cep" 
    o onBlur executa um comando javascript assim que o campo perde o fóco, neste caso eu chamo a função javascript "getEndereco()"
 -->
<form>
  <fieldset>
  <legend>Formulário de exemplo</legend>
  <label for="cep">CEP:</label>
  <input name="cep" id="cep" size="9" maxlength="8" onBlur="getEndereco()"/>
  <br />
  <label for="rua">Logadouro:</label>
  <input name="rua" id="rua" size="50"/>
  <br/>
  <label for="bairro">Bairro:</label>
  <input name="bairro" id="bairro" size="30"/>
  <br/>
  <label for="cidade">Cidade:</label>
  <input name="cidade" id="cidade"/>
  <br/>
  <label for="estado">Estado</label>
  <input name="estado" id="estado" size="2" maxlength="2"/>
  <br/>
  <input type="button" value="Ok" class="button">
  </fieldset>
</form>
</body>
</html>