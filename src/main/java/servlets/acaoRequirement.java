package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProjectDAO;
import DAO.RequirementDAO;
import entities.Requirement;

@WebServlet(urlPatterns = "/acaoRequirement")
public class acaoRequirement extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//String id_requirement = req.getParameter("id_requirement");
		String id_project = req.getParameter("id_project");
		String description = req.getParameter("description");
		String type = req.getParameter("type");
		System.out.print(id_project);
		
		int id_project_numeric = Integer.parseInt(id_project);
		//int id_requirement_numeric = Integer.parseInt(id_requirement);
		
		RequirementDAO requirementDAO = new RequirementDAO();
		ProjectDAO projectDAO = new ProjectDAO();
		Requirement requirement = new Requirement();
		requirement.setId(0);
		requirement.setDescription(description);
		requirement.setType(type);
		requirement.setProject(projectDAO.listarFiltrado(id_project_numeric));
		requirementDAO.salvar(requirement);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("pagina-projects.jsp");
		dispatcher.forward(req, resp);
		
		
		super.doPost(req, resp);
	}
}
