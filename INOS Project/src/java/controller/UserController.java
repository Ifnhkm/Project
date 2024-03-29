/**
 *
 * 
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import model.User;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        String action = request.getParameter("action");
        
        if (action != null){
            switch(action){
                case "register":
                    saveUser(request, response);
                    break;
                
                case "login":
                    retrieveUser(request, response);
                    break;
                    
                case "update":
                    updateUser(request, response);
                    break;
                
                case "delete":
                    deleteUser(request, response);
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

    private void saveUser(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException, ClassNotFoundException{
        
        //get all data from signup
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        String matric = req.getParameter("matric");
        String role = req.getParameter("role");
        
        //keep data into javabeans
        User newUser = new User();
        
        newUser.setEmail(email);
        newUser.setPass(pass);
        newUser.setMatric(matric);
        newUser.setRole(role);
        
        //pass the bean to DAO
        UserDAO user = new UserDAO();
        user.save(newUser);
        
        //save the bean as attribute and pass to view
        req.setAttribute("user", newUser);
        resp.sendRedirect("login.jsp");
    }
    
    private void retrieveUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ClassNotFoundException{
        
        if(req.getParameter("action") != null){
            
            String email = req.getParameter("email");
            String pass = req.getParameter("pass");
            
            UserDAO userDAO = new UserDAO();
            
            try {
                User user = userDAO.authentication(email, pass);
                
                if(user != null){
                    
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                    resp.sendRedirect("home.jsp");
                    
                } else {
                    req.setAttribute("error", "Invalid username or password!");
                    RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                    rd.forward(req,resp);
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }
        
    }
    
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String matric = request.getParameter("matric");
        int id = Integer.parseInt(request.getParameter("id"));
        
        User user = new User();
        
        user.setEmail(email);
        user.setPass(pass);
        user.setMatric(matric);
        user.setUserid(id);
        
        UserDAO userDAO = new UserDAO();
        
        userDAO.update(user);
        
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        
        response.sendRedirect("userprofile.jsp");
    }
    
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        User user = new User();
        
        user.setUserid(id);
        
        UserDAO userDAO = new UserDAO();
        
        userDAO.delete(user);

        HttpSession session = request.getSession();
        session.invalidate();
        
        response.sendRedirect("userAdmin.jsp");
        
    }

    private void signOut(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {

        req.getSession().removeAttribute("user");
        
        resp.sendRedirect("index.jsp");
    }

}
