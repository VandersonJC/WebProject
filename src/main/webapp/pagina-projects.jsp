<!DOCTYPE html>
<%@page import="DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="entities.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Projetos</title>
<link rel="stylesheet" href="CSS/estilo-page.css">
<script type="text/javascript" src="JS/scripts.js"></script>
</head>

<body>

	<%
	ProjectDAO projectDAO = new ProjectDAO();
	List<Project> listProject = projectDAO.listar();
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
					<a href="pagina-users.jsp">Usu?rios</a>
				</div>
			</div>
		</div>
		<div class="items-container">
			<div class="items-header-container">
				<div>
					<img src="imagens/Icon-Report.png" alt="">
				</div>
				<div class="items-header">
					<a href="pagina-reports.jsp">Relat?rios</a>
				</div>
			</div>
		</div>
		<div class="items-container">
			<div class="items-header-container">
				<div>
					<img src="imagens/Icon-Config.png" alt="">
				</div>
				<div class="items-header">
					<a href="pagina-config.jsp">Configura??es</a>
				</div>
			</div>

		</div>

	</div>
	<div id="center-container">
		<div id="center-container-navigation">
			<div id="header-projects-container">
				<div class="header-projects-search">
					<div class="search-name">
						<label for="busca">Nome do Projeto: </label> <input type="text"
							name="busca" id="busca" placeholder="Digite o nome do projeto">
					</div>
					<div class="search-select">
						<label for="priority">Prioridade: </label> <select name="priority"
							id="priority">
							<optgroup label="Prioridade">
								<option value="priority">Alto</option>
								<option>M?dio</option>
								<option>Baixo</option>
								<option>Todos</option>
							</optgroup>
						</select>
					</div>
					<div class="search-select">
						<label for="status">Status: </label> <select name="status"
							id="status">
							<optgroup label="Status">
								<option value="Status">Finalizado</option>
								<option>Em andamento</option>
								<option>Aguardando</option>
								<option>Todos</option>
							</optgroup>
						</select>
					</div>
					<div class="search-button">
						<button id="btn-search">Buscar</button>
					</div>

				</div>
				<div class="header-projects-buttons">
					<div class="total-projects"><%=listProject.size()%>
						projetos
					</div>
					<div class="add-project">
						<a href="pagina-create-project.jsp">Cadastrar projeto</a>
					</div>
					<div style="margin-left: 30px;">
						<button
							style="height: 40px; background-color: orange; border-radius: 15px; cursor: pointer;"
							onclick="gerarProjects();">Gerar relat?rio</button>
					</div>
				</div>
			</div>

			<div id="projects-container">

				<div id="box-project-container">
					<table class="table-requeriments" id="tabela-projetos">
						<thead>
							<tr>
								<th style="width: 15%;">Nome</th>
								<th>Descri??o</th>
								<th style="width: 12%;">Status</th>
								<th style="width: 4%;">Prioridade</th>
								<th style="width: 6%;">Vencimento</th>
								<th style="width: 4%;"></th>
								<th style="width: 4%;"></th>
							</tr>
						</thead>
						<tbody>

							<%
							for (Project project : listProject) {
							%>
							<tr>
								<td><%=project.getName()%></td>
								<td><%=project.getDescription()%></td>
								<td><%=project.getStatus()%></td>
								<td><%=project.getPriority()%></td>
								<td><%=project.getDateEnd()%></td>
								<td><div class="btn-edit-project">
										<button id="btn-edit" onclick="cadProjeto(this);"
											value="<%=project.getId()%>"></button>
									</div></td>
								<td><div class="btn-delete-project">
										<button id="btn-delete" onclick="delProjeto(this);"
											value="<%=project.getId()%>"></button>
									</div></td>
							</tr>
							<%
							}
							%>

						</tbody>
					</table>

				</div>


			</div>
		</div>


	</div>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	<script type="text/javascript">
		function gerarProjects() {

			html2canvas(document.getElementById('tabela-projetos'), {
				onrendered : function(canvas) {

					var data = canvas.toDataURL();
					var docDefinition = {
						content : [ {
							image : data,
							width : 610
						} ]
					};
					pdfMake.createPdf(docDefinition).download("Relat?rio.pdf");
				}
			});
		}
	</script>


</body>

</html>