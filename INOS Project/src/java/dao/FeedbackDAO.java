/**
 *
 * @author HP
 */
package dao;

import database.DBConnection;
import java.io.IOException;
import model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FeedbackDAO {

    private final Connection con;

    public FeedbackDAO() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public void create(Feedback feedback) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into feedback(email, feed, userid) values(?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, feedback.getEmail());
            myPS.setString(2, feedback.getFeed());

            myPS.setInt(3, feedback.getUserid());

            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

    public List<Feedback> retrieveAllFeedbackById(int userid) throws ClassNotFoundException, SQLException {

        List<Feedback> feedback = new ArrayList<>();

        String mySQLQuery = "select * from feedback where userid=" + userid;

        try ( Connection connection = DBConnection.getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackid = rs.getInt("feedbackid");
                String email = rs.getString("email");
                String feed = rs.getString("feed");
                feedback.add(new Feedback(feedbackid, email, feed));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return feedback;
    }

    public List<Feedback> getAllFeedback() throws ClassNotFoundException, SQLException {

        List<Feedback> feedback = new ArrayList<>();

        String mySQLQuery = "select * from feedback";

        try ( Connection connection = DBConnection.getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackid = rs.getInt("feedbackid");
                String email = rs.getString("email");
                String feed = rs.getString("feed");
                feedback.add(new Feedback(feedbackid, email, feed));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return feedback;
    }


    public void delete(Feedback feedback) {

        String myQ = "DELETE FROM feedback WHERE feedbackid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, feedback.getFeedbackid());

            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

 
}
