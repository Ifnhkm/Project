/**
 *
 * @author HP
 */
package dao;

import database.DBConnection;
import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    
    private final Connection con;
    
    public UserDAO() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }
    
    public void save(User user) throws SQLException{
        try {
            String mySQLQuery = "insert into user2(email, pass, matric, role) values(?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, user.getEmail());
            myPS.setString(2, user.getPass());
            myPS.setString(3, user.getMatric());
            myPS.setString(4, user.getRole());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            con.close();
        }
    }
    
    public User authentication (String email, String pass) throws SQLException{
        ResultSet rs = null;
        User user = null;
        
        try {
            String mySQLQuery = "select * from user2 where email=? and pass=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setString(1, email);
            ps.setString(2, pass);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                user = new User();
                
                user.setMatric(rs.getString("matric"));
                user.setRole(rs.getString("role"));
                user.setEmail(email);
                user.setPass(pass);
                user.setUserid(rs.getInt(1));

            }
            con.close();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            con.close();
        }
        
        return user;
    }
    
    public List<User> retrieveAll() throws SQLException {
        List<User> userList = new ArrayList<>();
        
        User user;
        ResultSet rs = null;
        
        try {
            String sqlQuery = "select * from user2";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                user = new User();
                
                user.setEmail(rs.getString("email"));
                user.setPass(rs.getString("pass"));
                user.setMatric(rs.getString("matric"));
                user.setRole(rs.getString("role"));
                user.setUserid(rs.getInt("userid"));
                
                userList.add(user);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            
            con.close();
        }
        
        return userList;
    }
    
    public User retrieveUserByUserId(int userid) throws ClassNotFoundException, SQLException {

        User user = new User();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from user2 where userid=?");

            myPS.setInt(1, userid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPass(rs.getString("pass"));
                user.setMatric(rs.getString("matric"));
                user.setRole(rs.getString("role"));
                user.setUserid(rs.getInt("userid"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return user;
    }
    
    public void update(User user){
        
        try {
            String myQ = "update user2 set email=?, pass=?, matric=? WHERE userid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, user.getEmail());
            myPS.setString(2, user.getPass());
            myPS.setString(3, user.getMatric());
            myPS.setInt(4, user.getUserid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    public void delete(User user){
        
        String myQ = "DELETE FROM user2 WHERE userid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, user.getUserid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
}
