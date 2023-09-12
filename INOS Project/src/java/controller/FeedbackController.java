/**
 *
 *
 */
package controller;

import dao.FeedbackDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import model.Feedback;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "FeedbackController", urlPatterns = {"/FeedbackController"})
public class FeedbackController  extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "create":
                    createFeedback(request, response);
                    break;

//                case "login":
//                    retrieveUser(request, response);
//                    break;

                case "delete":
                    deleteFeedback(request, response);
                    break;

                case "signout":
                    signOut(request, response);
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

    private void createFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        //get all data from form
        String email = request.getParameter("email");
        String feed = request.getParameter("feed");
        int userid = Integer.parseInt(request.getParameter("userid"));


        //keep data into javabeans
        Feedback newFeedback = new Feedback();

        newFeedback.setEmail(email);
        newFeedback.setFeed(feed);
        newFeedback.setUserid(userid);

        //pass the bean to DAO
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedbackDAO.create(newFeedback);

        List<Feedback> Feedback = feedbackDAO.retrieveAllFeedbackById(userid);

        HttpSession session = request.getSession();
        session.setAttribute("Feedback", Feedback);

        //save the bean as attribute and pass to view
        response.sendRedirect("home.jsp");

    }


    private void deleteFeedback(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {

        int feedbackid = Integer.parseInt(request.getParameter("feedbackid"));
        
        Feedback feed = new Feedback();
        
        feed.setFeedbackid(feedbackid);
        
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        
        feedbackDAO.delete(feed);
        
        response.sendRedirect("feedbackAdmin.jsp");

    }

    private void signOut(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {

        req.getSession().removeAttribute("user");

        resp.sendRedirect("index.jsp");
    }
    

}
