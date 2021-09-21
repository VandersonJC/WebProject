<!DOCTYPE html>
<%@page import="DAO.UserDAO"%>
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
	UserDAO userDAO = new UserDAO();
	List<User> listUser = userDAO.listar();
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
			<div id="header-projects-container">
				<div class="header-projects-search">
					<div class="search-name">
						<label for="busca">Nome do Projeto: </label> <input type="text"
							name="busca" id="busca" placeholder="Digite o nome do projeto">
					</div>
					<div class="search-select">
						<label for="status">Status: </label> <select name="status"
							id="status">
							<optgroup label="Status">
								<option>Todos</option>
								<option>Ativo</option>
								<option>Inativo</option>

							</optgroup>
						</select>
					</div>
					<div class="search-button">
						<button id="btn-search">Buscar</button>
					</div>

				</div>
				<div class="header-projects-buttons">
					<div class="total-projects"><%=listUser.size()%>
						Usuários
					</div>
					<div class="add-project">
						<a href="pagina-create-user.jsp">Cadastrar usuário</a>
					</div>
					<div style="margin-left: 30px;">
						<button
							style="height: 40px; background-color: orange; border-radius: 15px; cursor: pointer;"
							onclick="gerarUser();">Gerar relatório</button>
					</div>
				</div>
			</div>

			<div id="projects-container">

				<div id="box-project-container">
					<table class="table-requeriments" id="tabela-usuarios">
						<thead>
							<tr>
								<th style="width: 40%;">Nome</th>
								<th>Modalidade</th>
								<th style="width: 30%;">Login</th>
								<th style="width: 4%;">Status</th>
								<th style="width: 4%;"></th>
								<th style="width: 4%;"></th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < listUser.size(); i++) {
							%>
							<tr>
								<td><%=listUser.get(i).getName()%></td>
								<td><%=listUser.get(i).getModality()%></td>
								<td><%=listUser.get(i).getLogin()%></td>
								<td><%=listUser.get(i).getStatus()%></td>
								<td><div class="btn-edit-project">
										<a
											href="acaoUser?action=update&id=<%=listUser.get(i).getId()%>"><button
												id="btn-edit"></button></a>
									</div></td>
								<td><div class="btn-delete-project">
										<a href="?id=<%=listUser.get(i).getId()%>"><button
												id="btn-delete"></button></a>
									</div></td>
							</tr>
							<%
							}
							%>

							<%
							String userDelete = request.getParameter("id");
							if (userDelete != null) {
								User userDel = new User();
								userDel.setId(Integer.parseInt(userDelete));
								new UserDAO().excluir(userDel);
								response.sendRedirect("pagina-users.jsp");
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
		function gerarUser() {

			html2canvas(document.getElementById('tabela-usuarios'), {
				onrendered : function(canvas) {

					var data = canvas.toDataURL();
					var docDefinition = {
						content : [ {
							image : data,
							width : 610
						} ]
					};
					pdfMake.createPdf(docDefinition).download("Relatório.pdf");
				}
			});
		}
	</script>

</body>

</html>