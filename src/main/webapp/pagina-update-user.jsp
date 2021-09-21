
<%@page import="entities.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Criar projeto</title>
<link rel="stylesheet" href="CSS/estilo-page.css">
</head>

<body>

	<div id="header-container">
		<div class="user-container">
			<div class="user-image"></div>
			<div class="user-welcome">Bem vindo</div>
			<div class="user-name"></div>
		</div>

	</div>
	<div id="left-container">
		<div class="items-container">
			<div class="items-header-container">
				<div>
					<img src="imagens/Icon-Home.png" alt="">
				</div>
				<div class="items-header">
					<a href="pagina-home.jsp">Home</a>
				</div>
			</div>
		</div>
		<div class="items-container">
			<div class="items-header-container">
				<div>
					<img src="imagens/Icon-Projects.png" alt="">
				</div>
				<div class="items-header">
					<a href="pagina-projects.jsp">Projetos</a>
				</div>
			</div>
		</div>
		<div class="items-container">
			<div class="items-header-container">
				<div>
					<img src="imagens/Icon-User.png" alt="">
				</div>
				<div class="items-header">
					<a href="pagina-users.jsp">Usuários</a>
				</div>
			</div>
		</div>
		<div class="items-container">
			<div class="items-header-container">
				<div>
					<img src="imagens/Icon-Report.png" alt="">
				</div>
				<div class="items-header">
					<a href="pagina-reports.jsp">Relatórios</a>
				</div>
			</div>
		</div>
		<div class="items-container">
			<div class="items-header-container">
				<div>
					<img src="imagens/Icon-Config.png" alt="">
				</div>
				<div class="items-header">
					<a href="pagina-config.jsp">Configurações</a>
				</div>
			</div>
		</div>
	</div>
	
	<% 
	
	   // User user = request.getParameter("user"); 
	
	
	%>
	
	
	<div id="center-container">
		<div id="center-container-navigation">
			<form action="acaoUpdateUser" id="form-create-project" method="POST">
				<div class="form-container-create-project">
						<input Style="display: none;" name="id" value="${user.getId()}"></input>
					<div class="full-box">
						<label for="name">Nome: </label> <input type="text" name="name"
							placeholder="Digite o nome do usuário" required="required" value="${user.getName()}">
					</div>
					<div class="half-box">
						<label for="date_start">Login: </label> <input type="text"
							name="login" placeholder="Digite o login" required="required" value="${user.getLogin()}">
					</div>
					<div class="half-box">
						<label for="date_end">senha: </label> <input type="password"
							name="pass" placeholder="Digite a senha" required="required" value="${user.getPassword()}">
					</div>
					<div class="half-box">
						<label for="creator">Modalidade: </label> <select
							class="select-create-project" name="select-user-modality" required="required">
							<option>Administrador</option>
							<option>Usuário</option>
						</select>
					</div>
					<div class="half-box">
						<label for="creator">Status: </label> <select
							class="select-create-project" name="select-user-status" required="required">
							<option>Ativo</option>
							<option>Inativo</option>
						</select>
					</div>
					<div class="button-container-create-project">
						<button type="submit" name="btn-create-project">Cadastrar</button>
						<a href="pagina-users.jsp" id="btn-voltar">Voltar</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>

</html>