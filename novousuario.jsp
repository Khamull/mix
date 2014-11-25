<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>Exemplo plugin jquery compara senhas</title>
        <script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.pstrength-min.1.2.js"></script>
        <script>
        	$(document).ready(function(){
				$('.password').pstrength();
			});
        </script>
    </head>
    <body>
        <form class="formCad" method="post" action="#" name="formulario">
            <label for="senha">Senha</label>
            <input type="password" class="senha password" name="senha" title="Senha" value="" />
            <input type="submit" class="btnSubmit oculta" name="buscar" value="OK"/>
        </form>
    </body>
</html>