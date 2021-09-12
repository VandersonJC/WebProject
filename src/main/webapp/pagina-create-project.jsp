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
            <form action="#" id="form-create-project">
                <div class="form-container-create-project">
                    <div class="full-box">
                        <label for="name">Nome: </label>
                        <input type="text" name="name" placeholder="Digite o nome do projeto">
                    </div>
                    <div class="half-box">
                        <label for="date_start">Data inicio: </label>
                        <input type="date" name="date_start">
                    </div>
                    <div class="half-box">
                        <label for="date_end">Data final: </label>
                        <input type="date" name="date_end">
                    </div>
                    <div class="half-box">
                        <label for="client">Cliente: </label>
                        <input type="text" name="client">
                    </div>
                    <div class="half-box">
                        <label for="creator">Responsável: </label>
                        <select class="select-create-project">
                            <option>Alex</option>
                            <option>Bob</option>
                            <option>Anna</option>
                        </select>
                    </div>
                    <hr>
                    <div class="full-box">
                        <div id="description-display">
                        <label for="description">Descrição: </label>
                        <textarea rows="8" cols="80" name="description"
                            placeholder="Digite a descriÃ§Ã£o do projeto"> </textarea>
                        </div>    
                    </div>
                    <hr>
                    <div class="half-box">
                        <label for="status">Status: </label>
                        <select class="select-create-project">
                            <option>Aguardando</option>
                            <option>Em andamento</option>
                            <option>Finalizado</option>
                        </select>
                    </div>
                    <div class="half-box">
                        <label for="priority">Prioridade: </label>
                        <select class="select-create-project">
                            <option>Alta</option>
                            <option>Média</option>
                            <option>Baixa</option>
                        </select>
                    </div>
                    <hr>
                </div>
                <div id="create-requeriment-container">
                    <div>
                        <div class="title-requeriment">
                            Requisitos
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
                                <tr>
                                    <td>tipo1</td>
                                    <td>Descrição 1</td>
                                    <td><div class="btn-edit-project"> <button id="btn-edit"></button></div></td>
                                    <td><div class="btn-delete-project"><button id="btn-delete"></button></div></td>
                                </tr>
    
                            </tbody>
                         </table>          
                    </div>
                 </div>


                <div class="button-container-create-project">
                    <button type="submit" name="btn-create-project">Cadastrar</button>
                    <a href="pagina-projects.html" id="btn-voltar" >Voltar</a>
                    
                </div>
            </form>
        </div>
    </div>
</body>

</html>