/**
 *
 * @author HP
 */
package dao;

import database.DBConnection;
import java.io.IOException;
import model.Reservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReservationDAO {

    private final Connection con;

    public ReservationDAO() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public void create(Reservation reservation) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into reservation( email, date, time, room, userid) values( ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, reservation.getEmail());
            myPS.setString(2, reservation.getDate());
            myPS.setString(3, reservation.getTime());
            myPS.setString(4, reservation.getRoom());
           

            myPS.setInt(5, reservation.getUserid());

            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

    public List<Reservation> retrieveAllReserveById(int userid) throws ClassNotFoundException, SQLException {

        List<Reservation> reservation = new ArrayList<>();

        String mySQLQuery = "select * from reservation where userid=" + userid;

        try ( Connection connection = DBConnection.getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int reservationid = rs.getInt("reservationid");
                String email = rs.getString("email");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String room = rs.getString("room");
                String status = rs.getString("status");
                reservation.add(new Reservation(reservationid, email, date, time, room, status));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return reservation;
    }

    public List<Reservation> getAllReserve() throws ClassNotFoundException, SQLException {

        List<Reservation> reservation = new ArrayList<>();

        String mySQLQuery = "select * from reservation";

        try ( Connection connection = DBConnection.getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int reservationid = rs.getInt("reservationid");
                String email = rs.getString("email");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String room = rs.getString("room");
                String status = rs.getString("status");
                reservation.add(new Reservation(reservationid, email, date, time, room, status));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return reservation;
    }


    public void delete(Reservation reservation) {

        String myQ = "DELETE FROM reservation WHERE reservationid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, reservation.getReservationid());

            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void statusReservation(Reservation reservation) throws SQLException, IOException, ClassNotFoundException {
        try {
            String myQ = "update reservation set status=? where reservationid=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, reservation.getStatus());
            myPS.setInt(2, reservation.getReservationid());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }

    }

 
}
