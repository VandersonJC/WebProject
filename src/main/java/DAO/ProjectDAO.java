/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import BD.Conect;
import entities.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Vanderson
 */
public class ProjectDAO {

	Conect conexao = new Conect();
	Connection con = Conect.conexao();
	PreparedStatement stmt;

	public void salvar(Project project) {

		if (project.getId() > 0) {

			String sql = "UPDATE Project SET name = ?,description = ?,dateStart = ?,dateEnd = ?,client = ?,status = ?,priority = ?,id_user = ? WHERE id = ?";

			try {

				stmt = (PreparedStatement) con.prepareStatement(sql);
				stmt.setString(1, project.getName());
				stmt.setString(2, project.getDescription());
				stmt.setDate(3, new java.sql.Date(project.getDateStart().getTime()));
				stmt.setDate(4, new java.sql.Date(project.getDateEnd().getTime()));
				stmt.setString(5, project.getClient());
				stmt.setString(6, project.getStatus());
				stmt.setString(7, project.getPriority());
				stmt.setInt(8, project.getUser().getId());
				stmt.setInt(9, project.getId());
				stmt.execute();

			} catch (SQLException ex) {

				ex.printStackTrace();

			}

		} else {

			String sql = "INSERT INTO Project(name,description,dateStart,dateEnd,client,status,priority,id_user) VALUES(?,?,?,?,?,?,?,?)";

			try {

				stmt = (PreparedStatement) con.prepareStatement(sql);
				stmt.setString(1, project.getName());
				stmt.setString(2, project.getDescription());
				stmt.setDate(3, new java.sql.Date(project.getDateStart().getTime()));
				stmt.setDate(4, new java.sql.Date(project.getDateEnd().getTime()));
				stmt.setString(5, project.getClient());
				stmt.setString(6, project.getStatus());
				stmt.setString(7, project.getPriority());
				stmt.setInt(8, project.getUser().getId());
				stmt.execute();

			} catch (SQLException ex) {

				ex.printStackTrace();
			}

		}
	}

	public void excluir(Project project) {

		String sql = "DELETE FROM Project WHERE id = ?";

		try {

			stmt = (PreparedStatement) con.prepareStatement(sql);
			stmt.setInt(1, project.getId());
			stmt.execute();

		} catch (SQLException ex) {

			ex.printStackTrace();

		}

	}

	public List<Project> listar() {

		String sql = "SELECT * FROM Project";

		List<Project> lista = new ArrayList<>();

		try {

			stmt = (PreparedStatement) con.prepareStatement(sql);
			ResultSet response = stmt.executeQuery();

			while (response.next()) {
				Project project = new Project();
				project.setId(response.getInt("id"));
				project.setName(response.getString("name"));
				project.setDescription(response.getString("description"));
				project.setDateStart(response.getDate("dateStart"));
				project.setDateEnd(response.getDate("dateEnd"));
				project.setClient(response.getString("client"));
				project.setStatus(response.getString("status"));
				project.setPriority(response.getString("priority"));
				project.setUser(new UserDAO().retornaUser(response.getInt("id_user")));

				lista.add(project);

			}

		} catch (SQLException ex) {

			ex.printStackTrace();

		}

		return lista;
	}

	public Project listarFiltrado(int id) {

		String sql = "SELECT * FROM Project WHERE id=?";

		Project project = new Project();

		try {

			stmt = (PreparedStatement) con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet response = stmt.executeQuery();
			while(response.next()) 
			{
			project.setId(response.getInt("id"));
			project.setName(response.getString("name"));
			project.setDescription(response.getString("description"));
			project.setDateStart(response.getDate("dateStart"));
			project.setDateEnd(response.getDate("dateEnd"));
			project.setClient(response.getString("client"));
			project.setStatus(response.getString("status"));
			project.setPriority(response.getString("priority"));
			project.setUser(new UserDAO().retornaUser(response.getInt("id_user")));
			}

		} catch (SQLException ex) {

			ex.printStackTrace();

		}

		return project;
	}

}
