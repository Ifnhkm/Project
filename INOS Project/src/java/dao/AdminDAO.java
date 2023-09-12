/**
 *
 * @author HP
 */
package dao;

import database.DBConnection;
import model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminDAO {
    
    private final Connection con;
    
    public AdminDAO() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }
    
   
    
    public Admin authentication (String email, String pass) throws SQLException{
        ResultSet rs = null;
        Admin user = null;
        
        try {
            String mySQLQuery = "select * from admin where email=? and pass=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setString(1, email);
            ps.setString(2, pass);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                user = new Admin();
                
                user.setEmail(email);
                user.setPass(pass);
                user.setAdminid(rs.getInt(1));

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
//    
//    public List<User> retrieveAll() throws SQLException {
//        List<User> userList = new ArrayList<>();
//        
//        User user;
//        ResultSet rs = null;
//        
//        try {
//            String sqlQuery = "select * from users";
//            PreparedStatement stat = con.prepareStatement(sqlQuery);
//            rs = stat.executeQuery(sqlQuery);
//            
//            while(rs.next()){
//                user = new User();
//                
//                user.setFullName(rs.getString(1));
//                user.setEmail(rs.getString(2));
//                user.setPassword(rs.getString(3));
//                
//                userList.add(user);
//            }
//            
//        }catch (SQLException e){
//            System.out.println(e.getMessage());
//            
//        } finally {
//            if(rs != null){
//                rs.close();
//            }
//            
//            con.close();
//        }
//        
//        return userList;
//    }
//    
    public Admin retrieveUserByUserId(int userid) throws ClassNotFoundException, SQLException {

        Admin user = new Admin();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from user2 where userid=?");

            myPS.setInt(1, userid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPass(rs.getString("pass"));
                user.setAdminid(rs.getInt("userid"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return user;
    }
    
    public void update(Admin user){
        
        try {
            String myQ = "update user2 set email=?, pass=?, matric=? WHERE userid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, user.getEmail());
            myPS.setString(2, user.getPass());
            myPS.setInt(4, user.getAdminid());
            
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
//    
//    public void delete(User user){
//        
//        String myQ = "DELETE FROM users WHERE userid=?";
//        try {
//            PreparedStatement myPs = con.prepareStatement(myQ);
//            myPs.setInt(1, user.getUserid());
//        
//            myPs.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }

    public void save(Admin newAdmin) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
