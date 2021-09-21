/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import BD.Conect;
import entities.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Vanderson
 */
public class RequirementDAO {

    Conect conexao = new Conect();
    Connection con = Conect.conexao();
    PreparedStatement stmt;

    public void salvar(Requirement requirement) {

        if (requirement.getId() > 0) {

            String sql = "UPDATE Requeriment SET description = ?,type = ?,id_project = ? WHERE id = ?";

            try {

                stmt = (PreparedStatement) con.prepareStatement(sql);
                stmt.setString(1, requirement.getDescription());
                stmt.setString(2, requirement.getType());
                stmt.setInt(3, requirement.getProject().getId());
                stmt.setInt(3, requirement.getId());
                stmt.execute();

            } catch (SQLException ex) {

                ex.printStackTrace();

            }

        } else {

            String sql = "INSERT INTO Requeriment(description,type,id_project) VALUES(?,?,?)";

            try {

                stmt = (PreparedStatement) con.prepareStatement(sql);
                stmt.setString(1, requirement.getDescription());
                stmt.setString(2, requirement.getType());
                stmt.setInt(3, requirement.getProject().getId());
                stmt.execute();

            } catch (SQLException ex) {

                ex.printStackTrace();
            }

        }
    }
    

    public void excluir(Requirement requeriment) {

        String sql = "DELETE FROM Requeriment WHERE id = ?";

        try {

            stmt = (PreparedStatement) con.prepareStatement(sql);
            stmt.setInt(1, requeriment.getId());
            stmt.execute();

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

    }

    public List<Requirement> listar() {

        String sql = "SELECT * FROM Requeriment";

        List<Requirement> lista = new ArrayList<>();

        try {

            stmt = (PreparedStatement) con.prepareStatement(sql);
            ResultSet response = stmt.executeQuery();

            while (response.next()) {
                Requirement requirement = new Requirement();
                requirement.setId(response.getInt("id"));
                requirement.setDescription(response.getString("description"));
                requirement.setType(response.getString("type"));
                //requirement.setProject(response.getInt("id_project")); Resolver
                
                lista.add(requirement);

            }

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

        return lista;
    }
    
    public List<Requirement> listarPorProjeto(int id_project) {

    	ProjectDAO projectDAO = new ProjectDAO();
    	
        String sql = "SELECT * FROM Requeriment";

        List<Requirement> lista = new ArrayList<>();

        try {

            stmt = (PreparedStatement) con.prepareStatement(sql);
            ResultSet response = stmt.executeQuery();

            while (response.next()) {
            	
            	if(id_project == response.getInt("id_project") ) {
                Requirement requirement = new Requirement();
                requirement.setId(response.getInt("id"));
                requirement.setDescription(response.getString("description"));
                requirement.setType(response.getString("type"));
                requirement.setProject(projectDAO.listarFiltrado(response.getInt("id_project")));
                
                lista.add(requirement);
            	}
            }

        } catch (SQLException ex) {

            ex.printStackTrace();

        }
        
        
        
        

        return lista;
    }

}
