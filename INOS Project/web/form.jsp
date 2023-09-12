<%-- 
    Document   : form
    Created on : 3 Jun 2023, 10:47:22 pm
    Author     : Irfan Hakim
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <title>Reservation Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: rgb(145, 152, 146);
                background-image: url("image/formbg.png");
                background-size: 100%;
            }

            .container {
                margin-top: 110px;
                margin-left: 90px;
                margin-right: 40px;
                margin-bottom: 105px;
            }

            .reservation-image {
                width: 400px;
                max-width: 100%;
                height: 400px;
            }

            .name {
                padding: 10px;
                font-size: 1.5rem;
                text-align: center;
                margin-top: 10px;
                font-weight: bold;
            }

            .form-container {
                margin-left: 150px;
                margin-bottom: 5px;
                background-color: #d5daf7;
                padding: 20px;
                padding-top: 10px;
                border-radius: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .form-container h2 {
                margin-bottom: 10px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-control {
                border-radius: 5px;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0069d9;
                border-color: #0062cc;
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
            <div class="row">
                <div class="col-md-10">
                    <div class="form-container">
                        <h2>Reservation Form</h2>
                        <form action="<%=request.getContextPath()%>/ReservationController" method="post">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" name="email" value="<%=user.getEmail()%>">
                            </div>
                            <div class="form-group">
                                <label for="date">Date</label>
                                <input type="date" class="form-control" name="date">
                            </div>
                            <div class="form-group">
                                <label for="time">Time</label>
                                <input type="time" class="form-control" name="time">
                            </div>
                            <div class="form-group">
                                <label for="room">Room</label>
                                <select class="form-control" name="room">
                                    <option value="Executive Boardroom">Executive Boardroom</option>
                                    <option value="Creative Think Tank">Creative Think Tank</option>
                                    <option value="Collaborative Lounge">Collaborative Lounge</option>
                                    <option value="Technology Hub">Technology Hub</option>
                                </select>
                            </div>
                            <input type="hidden" name="userid" value="<%=user.getUserid()%>">
                            <button type="submit" name="action" value="create" class="btn btn-primary">Submit</button>
                            <button type="reset" class="btn btn-primary">Clear</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    <footer>
        <b>INOS UMT &copy; 2023</b>
    </footer>

</html>
