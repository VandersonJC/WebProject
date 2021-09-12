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
public class VersionDAO {
        
    Conect conexao = new Conect();
    Connection con = Conect.conexao();
    PreparedStatement stmt;

    public void salvar(Version version) {

        if (version.getId() > 0) {

            String sql = "UPDATE Version SET version = ?,description = ?,id_requeriment = ? WHERE id = ?";

            try {
                stmt = (PreparedStatement) con.prepareStatement(sql);
                stmt.setString(1, version.getVersion());
                stmt.setString(2, version.getDescription());
                stmt.setInt(3, version.getRequirement().getId());
                stmt.setInt(4, version.getId());
                stmt.execute();

            } catch (SQLException ex) {

                ex.printStackTrace();

            }

        } else {

            String sql = "INSERT INTO Version(version,description,id_requeriment) VALUES(?,?,?)";

            try {

                stmt = (PreparedStatement) con.prepareStatement(sql);
                stmt.setString(1, version.getVersion());
                stmt.setString(2, version.getDescription());
                stmt.setInt(3, version.getRequirement().getId());
                stmt.execute();

            } catch (SQLException ex) {

                ex.printStackTrace();
            }

        }
    }
    

    public void excluir(Version version) {

        String sql = "DELETE FROM Version WHERE id = ?";

        try {

            stmt = (PreparedStatement) con.prepareStatement(sql);
            stmt.setInt(1, version.getId());
            stmt.execute();

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

    }

    public List<Version> listar() {

        String sql = "SELECT * FROM Version";

        List<Version> lista = new ArrayList<>();

        try {

            stmt = (PreparedStatement) con.prepareStatement(sql);
            ResultSet response = stmt.executeQuery();

            while (response.next()) {
                Version version = new Version();
                version.setId(response.getInt("id"));
                version.setVersion(response.getString("version"));
                version.setDescription(response.getString("description"));
                //version.getRequirement(response.getInt("id_requeriment")); RESOLVER

                lista.add(version);

            }

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

        return lista;
    }

} 

