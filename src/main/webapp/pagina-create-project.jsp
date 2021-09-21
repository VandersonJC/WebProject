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
<script type="text/javascript" src="JS/scripts.js"></script>
</head>

<body>

	<%
	String id = request.getParameter("id");
	Project project = new Project();
	List<Requirement> ListRequirement = new ArrayList<>();

	if (id == "" || id == null) {
		project.setId(0);
		project.setName("");
		project.setClient("");
		project.setDescription("");
		project.setDateStart(new Date());
		project.setDateEnd(new Date());
	} else {
		int id_numeric = Integer.parseInt(id);
		ProjectDAO projectDAO = new ProjectDAO();
		RequirementDAO requirementDAO = new RequirementDAO();
		project = projectDAO.listarFiltrado(id_numeric);
		ListRequirement = requirementDAO.listarPorProjeto(id_numeric);
	}
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
			<form action="acaoProject" id="form-create-project" method="post">
				<div class="form-container-create-project">
					<input id="input-id-project" name="id" type="hidden" value="<%=project.getId()%>">
					<div class="full-box">
						<label for="name">Nome: </label> <input type="text" name="name"
							placeholder="Digite o nome do projeto" required="required"
							value="<%=project.getName()%>">
					</div>
					<div class="half-box">
						<label for="date_start">Data inicio: </label> <input type="date"
							name="date_start" required="required"
							value="<%=project.getDateStart()%>">
					</div>
					<div class="half-box">
						<label for="date_end">Data final: </label> <input type="date"
							name="date_end" required="required"
							value="<%=project.getDateEnd()%>">
					</div>
					<div class="half-box">
						<label for="client">Cliente: </label> <input type="text"
							name="client" placeholder="Digite o nome do cliente"
							required="required" value="<%=project.getClient()%>">
					</div>
					<div class="half-box">
						<label for="creator">Responsável: </label> <select
							class="select-create-project" name="autor">
							<%
							UserDAO userDAO = new UserDAO();
							List<User> listUser = userDAO.listar();

							for (User user : listUser) {
							%>
							<option><%=user.getName()%></option>
							<%
							}
							%>
						</select>
					</div>
					<hr>
					<div class="full-box">
						<div id="description-display">
							<label for="description">Descrição: </label>
							<textarea rows="8" cols="80" name="description"
								placeholder="Digite a descrição do projeto" required="required"
								value="<%=project.getDescription()%>"> </textarea>
						</div>
					</div>
					<hr>
					<div class="half-box">
						<label for="status">Status: </label> <select
							class="select-create-project" name="status_project">
							<option>Aguardando</option>
							<option>Em andamento</option>
							<option>Finalizado</option>
						</select>
					</div>
					<div class="half-box">
						<label for="priority">Prioridade: </label> <select
							class="select-create-project" name="priority_project">
							<option>Alta</option>
							<option>Média</option>
							<option>Baixa</option>
						</select>
					</div>
					<hr>
				</div>
			
				<div class="button-container-create-project">
				<button type="submit" name="btn-create-project">Cadastrar</button>
				<a href="pagina-projects.jsp" id="btn-voltar">Voltar</a>

			</div>
			</form>
			<div id="create-requeriment-container">
				<div>
					<div class="title-requeriment">Requisitos</div>
					<div>
						<button
							style="border: 0px; border-radius: 15px; background-color: orange; font-weight: bold; width: 150px; height: 40px; cursor: pointer;"
							id="btn-create-req" onclick="cadRequisitos();">Criar requesito</button>
					</div>
					<table class="table-requeriments">
						<thead>
							<tr>
								<th style="width: 20%;">Tipo</th>
								<th>Descrição</th>
								<th style="width: 8%;"></th>
								<th style="width: 8%;"></th>
							</tr>
						</thead>
						<tbody>
						<%
						
						for(Requirement requirement: ListRequirement){
						%>
							<tr>
								<td><%= requirement.getType()%></td>
								<td><%=requirement.getDescription() %></td>
								<td><div class="btn-edit-project">
										<button id="btn-edit"></button>
									</div></td>
								<td><div class="btn-delete-project">
										<button id="btn-delete"></button>
									</div></td>
							</tr>
                         <% }%>
						</tbody>
					</table>
				</div>
			</div>

		
		</div>
	</div>
</body>

</html>