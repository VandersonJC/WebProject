function cadProjeto(elem) {
	let id = elem.value;
	if (id != "" || id != null) {
		window.location.href = "pagina-create-project.jsp?id=" + id;
	}
}

function delProjeto(elem) {
	let id = elem.value;
	if (id != "" || id != null) {
		window.location.href = "pagina-create-project.jsp?id=" + id;
	}
}