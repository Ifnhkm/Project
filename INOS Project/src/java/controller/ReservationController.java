/**
 *
 *
 */
package controller;

import dao.ReservationDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import model.Reservation;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ReservationController", urlPatterns = {"/ReservationController"})
public class ReservationController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "create":
                    createReservation(request, response);
                    break;

//                case "login":
//                    retrieveUser(request, response);
//                    break;

                case "delete":
                    deleteReservation(request, response);
                    break;

                case "signout":
                    signOut(request, response);
                    break;

                case "updateStatus":
                    statusReservation(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "index.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void createReservation(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        //get all data from form
        String email = request.getParameter("email");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String room = request.getParameter("room");
        int userid = Integer.parseInt(request.getParameter("userid"));


        //keep data into javabeans
        Reservation newReservation = new Reservation();
        
        newReservation.setEmail(email);
        newReservation.setDate(date);
        newReservation.setTime(time);
        newReservation.setRoom(room);
        newReservation.setUserid(userid);

        //pass the bean to DAO
        ReservationDAO reservationDAO = new ReservationDAO();
        reservationDAO.create(newReservation);

        List<Reservation> Reservation = reservationDAO.retrieveAllReserveById(userid);

        HttpSession session = request.getSession();
        session.setAttribute("Reservation", Reservation);

        //save the bean as attribute and pass to view
        response.sendRedirect("userStatus.jsp");

    }


    private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {

        int reservationtid = Integer.parseInt(request.getParameter("reservationid"));
        
        Reservation reserve = new Reservation();
        
        reserve.setReservationid(reservationtid);
        
        ReservationDAO reservationDAO = new ReservationDAO();
        
        reservationDAO.delete(reserve);
        
        response.sendRedirect("statusAdmin.jsp");

    }

    private void signOut(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {

        req.getSession().removeAttribute("user");

        resp.sendRedirect("index.jsp");
    }
    
    private void statusReservation(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {
  
        
        String status = request.getParameter("status");
        int reservationid = Integer.parseInt(request.getParameter("id"));
        
        Reservation reservation = new Reservation();

        reservation.setStatus(status);
        reservation.setReservationid(reservationid);
        //payment.setTenantid(tenantid);

        ReservationDAO reserveDAO = new ReservationDAO();
        
        reserveDAO.statusReservation(reservation);
        
        HttpSession session = request.getSession();
        session.setAttribute("reservation", reservation);

        response.sendRedirect("statusAdmin.jsp");

}

}
