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
</head>

<body>

	<%  
		ProjectDAO projectDAO = new ProjectDAO(); 
		List<Project> listProject = projectDAO.listar();
	
	%>


    <div id="header-container">
        <div class="user-container">
            <div class="user-image"></div>
            <div class="user-welcome">Bem vindo, </div>
            <div class="user-name">Vanderson</div>
        </div>

    </div>
    <div id="left-container">
        <div class="items-container">
            <div class="items-header-container">
                <div><img src="imagens/Icon-Home.png" alt=""></div>
                <div class="items-header"><a href="pagina-home.jsp">Home</a></div>
            </div>
        </div>
        <div class="items-container">
            <div class="items-header-container">
                <div><img src="imagens/Icon-Projects.png" alt=""></div>
                <div class="items-header"><a href="pagina-projects.jsp">Projetos</a></div>
            </div>
        </div>
        <div class="items-container">
            <div class="items-header-container">
                <div><img src="imagens/Icon-User.png" alt=""></div>
                <div class="items-header"><a href="pagina-users.jsp">Usuários</a></div>
            </div>
        </div>
        <div class="items-container">
            <div class="items-header-container">
                <div><img src="imagens/Icon-Report.png" alt=""></div>
                <div class="items-header"><a href="pagina-reports.jsp">Relatórios</a></div>
            </div>
        </div>
        <div class="items-container">
            <div class="items-header-container">
                <div><img src="imagens/Icon-Config.png" alt=""></div>
                <div class="items-header"><a href="pagina-config.jsp">Configurações</a></div>
            </div>

        </div>

    </div>
    <div id="center-container">
        <div id="center-container-navigation">
            <div id="header-projects-container">
                <div class="header-projects-search">
                    <div class="search-name">
                        <label for="busca">Nome do Projeto: </label>
                        <input type="text" name="busca" id="busca" placeholder="Digite o nome do projeto">
                    </div>
                    <div class="search-select">
                        <label for="priority">Prioridade: </label>
                        <select name="priority" id="priority">
                            <optgroup label="Prioridade">
                                <option value="priority">Alto</option>
                                <option>Médio</option>
                                <option>Baixo</option>
                                <option>Todos</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="search-select">
                        <label for="status">Status: </label>
                        <select name="status" id="status">
                            <optgroup label="Status">
                                <option value="Status">Finalizado</option>
                                <option>Em andamento</option>
                                <option>Aguardando</option>
                                <option>Todos</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="search-button">
                        <button id="btn-search">
                            Buscar
                        </button>
                    </div>

                </div>
                <div class="header-projects-buttons">
                    <div class="total-projects"><%=listProject.size()%> projetos</div>
                    <div class="add-project"><a href="pagina-create-project.jsp">Cadastrar projeto</a></div>
                </div>
            </div>

            <div id="projects-container">

                <div id="box-project-container">  
                    <table class="table-requeriments">
                        <thead>
                            <tr>
                                <th style="width: 15%;">Nome</th>
                                <th>Descrição</th>
                                <th style="width: 12%;">Status</th>
                                <th style="width: 4%;">Prioridade</th>
                                <th style="width: 6%;">Vencimento</th>
                                <th style="width: 4%;"></th>
                                <th style="width: 4%;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <%
                            
                            
                            for(Project project: listProject){
                            
                            %>
                                <td><%=project.getName()%></td>
                                <td><%=project.getDescription()%></td>
                                <td><%=project.getStatus()%></td>
                                <td><%=project.getPriority()%></td>
                                <td><%=project.getDateEnd()%></td>
                                <td><div  value="<%=project.getId()%>"  onclick="cadProjeto(this);" class="btn-edit-project"><button id="btn-edit"></button></div></td>
                                <td><div  value="<%=project.getId()%>" onclick="delProjeto(this)" class="btn-delete-project"><button id="btn-delete"></button></div></td>
                                
                               <% } %> 
                            </tr>

                        </tbody>
                     </table>           
                
                </div>


            </div>
        </div>


    </div>




</body>

</html>