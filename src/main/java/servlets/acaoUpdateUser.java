package servlets;

import java.io.IOException;
import java.util.*;
import entities.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;

@WebServlet(urlPatterns = "/acaoUpdateUser")
public class acaoUpdateUser extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String login = req.getParameter("login");
		String pass = req.getParameter("pass");
		String modality = req.getParameter("select-user-modality");
		String status = req.getParameter("select-user-status");

		if (modality.equals("Administrador")) {
			modality = "admin";
		}

		if (modality.equals("Usuário")) {
			modality = "user";
		}

		int idUser = Integer.parseInt(id);
		User user = new User();
		user.setId(idUser);
		user.setName(name);
		user.setLogin(login);
		user.setModality(modality);
		user.setPassword(pass);
		user.setStatus(status);

		new UserDAO().salvar(user);
		resp.sendRedirect("pagina-users.jsp");

	}
}
