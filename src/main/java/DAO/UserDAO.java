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
public class UserDAO {
    
    Conect conexao = new Conect();
    Connection con = Conect.conexao();
    PreparedStatement stmt;

    public void salvar(User user) {

        if (user.getId() > 0) {

            String sql = "UPDATE User SET name = ?,login = ?,password = ?,modality = ?,status = ? WHERE id = ?";

            try {
                stmt = (PreparedStatement) con.prepareStatement(sql);
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getLogin());
                stmt.setString(3, user.getPassword());
                stmt.setString(4, user.getModality());
                stmt.setString(5, user.getStatus());
                stmt.setInt(6, user.getId());
                stmt.execute();

            } catch (SQLException ex) {

                ex.printStackTrace();

            }

        } else {

            String sql = "INSERT INTO User(name,login,password,modality,status) VALUES(?,?,?,?,?)";

            try {

                stmt = (PreparedStatement) con.prepareStatement(sql);
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getLogin());
                stmt.setString(3, user.getPassword());
                stmt.setString(4, user.getModality());
                stmt.setString(5, user.getStatus());
                stmt.execute();

            } catch (SQLException ex) {

                ex.printStackTrace();
            }

        }
    }
    

    public void excluir(User user) {

        String sql = "DELETE FROM User WHERE id = ?";

        try {

            stmt = (PreparedStatement) con.prepareStatement(sql);
            stmt.setInt(1, user.getId());
            stmt.execute();

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

    }

    public List<User> listar() {

        String sql = "SELECT * FROM User";

        List<User> lista = new ArrayList<>();

        try {

            stmt = (PreparedStatement) con.prepareStatement(sql);
            ResultSet response = stmt.executeQuery();

            while (response.next()) {
                User user = new User();
                user.setId(response.getInt("id"));
                user.setName(response.getString("name"));
                user.setLogin(response.getString("login"));
                user.setPassword(response.getString("password"));
                user.setModality(response.getString("modality"));
                user.setStatus(response.getString("status"));

                lista.add(user);

            }

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

        return lista;
    }

    
    public boolean validaLogin(String user, String pass){
        
    	boolean validacao = false;
        List<User> list = listar();
        
        for(int i = 0; i < list.size(); i++){
            
            if(user.equals(list.get(i).getLogin()) && pass.equals(list.get(i).getPassword())){

                validacao = true; 
            }
            
        }

        return validacao;
    }
    
  public User retornaUser(String name){
        
    	User user = new User();
        List<User> list = listar();
        
        for(int i = 0; i < list.size(); i++){
            
            if(name.equals(list.get(i).getName())){

            	user = list.get(i); 
            }
            
        }

        return user;
    }
    
  public User retornaUser(int id){
      
  	User user = new User();
    List<User> list = listar();
      
      for(int i = 0; i < list.size(); i++){
          
          if(id == list.get(i).getId()){

          	user = list.get(i); 
          }
          
      }

      return user;
  }  
  
  
  
}  

