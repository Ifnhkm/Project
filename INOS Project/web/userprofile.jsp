<%-- 
    Document   : userprofile
    Created on : 26 May 2023, 3:07:28 pm
    Author     : HP
--%>

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile Page</title>
        <!-- Bootstrap 5 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                background-image: url("image/laut3.jpg");
                background-size: 100%;
            }

            footer{
                text-align: center;
                background-color: #354842;
            }
            footer b {
                color: white;
            }
        </style>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <%
            User user = (User) request.getSession().getAttribute("user");
            
            
        %>

        <div class="container" style="padding-top: 25px; padding-bottom: 260px;">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card" style="border-color: #007FFF; box-shadow: 10px 10px lightblue">
                        <div class="card-header" style="background-color: #007FFF;">
                            <h4>User Profile</h4>
                        </div>
                        <div class="card-body" style="background-color: #6CB4EE;">
                            <form action="UserController" method="POST">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>" aria-describedby="emailHelp" >
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="text" class="form-control" name="pass" value="<%=user.getPass()%>">
                                </div>
                                <div class="form-group">
                                    <label for="No Matric">No Matric</label>
                                    <input type="text" class="form-control" name="matric" value="<%=user.getMatric()%>">
                                </div>
                                
                                <input name="id" type="hidden" value="<%=user.getUserid()%>">
                                
                                <button onclick="return confirm('Are sure to update the changes?')" type="submit" name="action" value="update" class="btn btn-primary">Save Change</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <footer>
            <b>INOS UMT &copy; 2023</b>
        </footer>
        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
