<!DOCTYPE html>

<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Projetos</title>
    <link rel="stylesheet" href="CSS/estilo.css">
</head>

<body>

    <div id="back-container-login">

        <div id="login-container">

            <div class="login-container-left">
                <div class="login-left-image"></div>
                <div class="login-left-text">Cadastre-se</div>
                <div class="btn-create-account">
                    <a href="#" type="button">Criar</a>
                </div>
            </div>
            <div class="login-container-right">
                <div class="login-container-welcome">
                    Bem vindo
                </div>
                <form action="acao" id="Login-form"  method="POST">
                    <div class="box-form">
                        <label for="login">Usuário</label>
                        <input type="text" name="login" id="login" placeholder="Digite o nome do usuário" required="required">
                    </div>
                    <div class="box-form">
                        <label for="senha">Senha</label>
                        <input type="password" name="password" id="password" placeholder="Digite a senha" required="required">
                    </div>
                    <div class="btn-form">
                      <button type="submit" id="btn-summit">Entrar</button>
                    </div>
                </form>
  
                
            </div>

        </div>

    </div>


</body>

</html>