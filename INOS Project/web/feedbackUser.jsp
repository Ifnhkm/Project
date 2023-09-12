<%-- 
    Document   : feedbackUser
    Created on : 3 Jun 2023, 9:53:23 pm
    Author     : Irfan Hakim
--%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Feedback Page</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <title>Reservation Page</title>

        <style>
            body {
                background-image: url("image/feedbackbg.webp");
                background-size: 100%;
                font-family: Arial, sans-serif;
            }

            .container {
                margin-top: 120px;
                margin-bottom: 125px;
                background-color: #e2cdff;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                margin-bottom: 30px;
            }

            .form-group label {
                font-weight: bold;
            }

            textarea.form-control {
                resize: vertical;
            }

            button[type="submit"] {
                margin-top: 20px;
            }
            footer {
                text-align: center;
                background-color: #354842;
            }

            footer b {
                color: white;
            }
        </style>
    </head>
    <%
        User user = (User) request.getSession().getAttribute("user");


    %>

    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="container">
            <h2>Feedback Form</h2>
            <form action="<%=request.getContextPath()%>/FeedbackController" method="post">
                <div class="form-group">
                    <label for="Email">Email</label>
                    <input type="text" class="form-control" id="name" value="<%=user.getEmail()%>" name="email" placeholder="Enter your full name">
                </div>
                <div class="form-group">
                    <br><label for="feedback">Feedback</label>
                    <textarea class="form-control" id="feed" name="feed" rows="5" placeholder="Enter your feedback"></textarea>
                </div>
                <input type="hidden" name="userid" value="<%=user.getUserid()%>">
                <button type="submit" name="action" value="create" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    <footer>
        <b>INOS UMT &copy; 2023</b>
    </footer>

</html>
