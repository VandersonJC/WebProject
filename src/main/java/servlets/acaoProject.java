package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProjectDAO;
import DAO.UserDAO;
import entities.Project;
import entities.User;

@WebServlet(urlPatterns = "/acaoProject")
public class acaoProject extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String date_start = req.getParameter("date_start");
		String date_end = req.getParameter("date_end");
		String client = req.getParameter("client");
		String autor = req.getParameter("autor");
		String description = req.getParameter("description");
		String status_project = req.getParameter("status_project");
		String priority_project = req.getParameter("priority_project");
		
		int id_numeric = Integer.parseInt(id);
		int autor_numeric = Integer.parseInt(id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dateStart = null;
		try {
			dateStart = sdf.parse(date_start);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date dateEnd = null;
		try {
			dateEnd = sdf.parse(date_end);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		UserDAO userDAO = new UserDAO();
		ProjectDAO projectDAO = new ProjectDAO();
		Project project = new Project();
		project.setId(id_numeric);
		project.setDateStart(dateStart);
		project.setDateEnd(dateEnd);
		project.setClient(client);
		project.setDescription(description);
		project.setName(name);
		project.setPriority(priority_project);
		project.setStatus(status_project);
		project.setUser(userDAO.retornaUser(autor));
		projectDAO.salvar(project);
		
		if(id != "" || id != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("pagina-create-project.jsp");
			dispatcher.forward(req, resp);
		}else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("pagina-projects.jsp");
			dispatcher.forward(req, resp);
		}
		
		super.doPost(req, resp);
	}
	
	
	
}
