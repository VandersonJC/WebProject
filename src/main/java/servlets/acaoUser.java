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

@WebServlet(urlPatterns = "/acaoUser")
public class acaoUser extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action != null) {

			UserDAO userDAO = new UserDAO();
			User user = new User();
			List<User> list = userDAO.listar();
			int id = Integer.parseInt(req.getParameter("id"));
			for (int i = 0; i < list.size(); i++) {
				if (id == list.get(i).getId()) {
					user.setId(list.get(i).getId());
					user.setName(list.get(i).getName());
					user.setLogin(list.get(i).getLogin());
					user.setPassword(list.get(i).getPassword());
					user.setModality(list.get(i).getModality());
					user.setStatus(list.get(i).getStatus());
				}

			}

			req.setAttribute("user", user);

			RequestDispatcher dispathcer = req.getRequestDispatcher("pagina-update-user.jsp");
			dispathcer.forward(req, resp);

		}

		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String login = req.getParameter("login");
		String pass = req.getParameter("pass");
		String modality = req.getParameter("select-user-modality");
		String status = req.getParameter("select-user-status");

		if (modality.equals("Administrador")) {
			modality = "admin";
		}

		if (modality.equals("Usu?rio")) {
			modality = "user";
		}

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
