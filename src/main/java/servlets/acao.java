package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;

@WebServlet(urlPatterns = "/acao")
public class acao extends HttpServlet{
	
@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
		
	}	

@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String login = req.getParameter("login").toString();
		String senha = req.getParameter("password").toString();
		boolean valida = new UserDAO().validaLogin(login, senha);
			
		if(valida == true) {
			resp.sendRedirect("pagina-home.jsp");
		}else {
			resp.sendRedirect("login.jsp");
		}
		
	}



}
