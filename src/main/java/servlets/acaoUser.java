package servlets;

import java.io.IOException;
import entities.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;

@WebServlet(urlPatterns = "/acaoUser")
public class acaoUser extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean valida = false;
		String name = req.getParameter("name");
		String login = req.getParameter("login");
		String pass = req.getParameter("pass");
		String modality = req.getParameter("select-user-modality");
		String status = req.getParameter("select-user-status");
		
		if(modality.equals("Administrador")) {
			modality = "admin";
			valida = true;
		}
		
		if(modality.equals("Usuário")) {
			modality = "user";
			valida = true;
		}
		
		
		if(valida == true) {
		 User user = new User();
		 user.setName(name);
		 user.setLogin(login);
		 user.setModality(modality);
		 user.setPassword(pass);
		 user.setStatus(status);
		
		
        new UserDAO().salvar(user);
		resp.sendRedirect("pagina-users.jsp");
		}
	}

}
