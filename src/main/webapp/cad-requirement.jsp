<!DOCTYPE html>
<%@page import="java.util.*"%>
<%@page import="DAO.*"%>
<%@page import="entities.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Criar projeto</title>
<link rel="stylesheet" href="CSS/estilo-page.css">
</head>

<body>

	<%
	String id_project = request.getParameter("id_project");
	Requirement requirement = new Requirement();
	int id_project_numeric = Integer.parseInt(id_project);
	
	/*if (id_project == "" || id_project == null) {
		requirement.setId(0);
		requirement.setDescription("");
		requirement.setType("");
	} else {
		
		RequirementDAO requirementDAO = new RequirementDAO();
		requirement = projectDAO.listarFiltrado(id_numeric);
		System.out.print(project.getName());

	}*/
	%>



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
	<div id="center-container">
		<div id="center-container-navigation">
			<form action="acaoRequirement" id="form-create-project" method="post">
				<div class="form-container-create-project">
					<input name="id_requirement" type="hidden" value=""> <input
						name="id_project" type="hidden" value="<%=id_project_numeric%>">
					<div class="full-box">
						<label for="description">Descrição: </label> <input type="text"
							name="description" placeholder="Digite a descrição do requisito"
							required="required" value="">
					</div>
					<div class="full-box">
						<label for="name">Tipo: </label> <input type="text" name="type"
							placeholder="Digite o tipo do requisito" required="required"
							value="">
					</div>
				</div>
			
			<div class="button-container-create-project">
				<button type="submit" name="btn-create-project">Cadastrar</button>
				<a href="pagina-projects.jsp" id="btn-voltar">Voltar</a>

			</div>
			</form>
		</div>
	</div>
</body>

</html>