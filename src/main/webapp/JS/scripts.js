function cadProjeto(elem) {
	let id = elem.value;
	if (id != "" || id != null) {
		window.location.href = "pagina-create-project.jsp?id=" + id;
	}
}

function delProjeto(elem) {
	let id = elem.value;
	if (id != "" || id != null) {
		if(confirm("Deseja realmente excluir este projeto?")){
		   window.location.href = "acaoProject?delProject="+id;	
		}
	}
}

function cadRequisitos() {
	let id = document.getElementById("input-id-project").value;
	if (id != "" || id != null) {
		window.location.href = "cad-requirement.jsp?id_project="+ id;
	}
}



/*
function gerarUser(){
	let tabela = document.getElementById("tabela-usuarios").innerHTML;

	let janela = window.open('','','width=800,heigth=600');
	janela.document.write("<html><head>");
	janela.document.write("<title>Relatorio de usuarios</title></head>");
	janela.document.write("<body>");
	janela.document.write(tabela);
	janela.document.wite("</body></html>");
	janela.document.close();
	janela.print();
	
}*/