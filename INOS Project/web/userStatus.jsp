<%-- 
    Document   : newjsp
    Created on : 2 Jun 2023, 7:22:35 am
    Author     : HP
--%>

<%@page import="java.util.List"%>
<%@page import="model.Reservation"%>
<%@page import="model.User"%>
<%@page import="dao.ReservationDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Status</title>
        <style>
            body {
                background-image: url("image/status.jpg");
                background-size: 100%;
            }   
            .thead-dark {
                background-color: rgb(14, 121, 118);
            }
            .reserved {
                background-color: #c4e4ea;
            }

            .cancelled {
                background-color: #f8d7da;
            }

            .delete-btn {
                cursor: pointer;
                color: red;
            }
            th{
                color: white;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <%

            User user = (User) request.getSession().getAttribute("user");

            int userid = user.getUserid();
            ReservationDAO reserveDao = new ReservationDAO();
            List<Reservation> listReserve = reserveDao.retrieveAllReserveById(userid);
        %>

        <div class="container">
            <h1 class="mt-4 mb-4">Room Reservation</h1>

            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                <th>Date</th>
                <th>Time</th>
                <th>Room</th>
                <th>Status</th>
                </thead>
                <%                                            for (Reservation reserve : listReserve) {
                %>
                <tr>
                    <td><%=reserve.getDate()%></td>
                    <td><%=reserve.getTime()%></td>
                    <td><%=reserve.getRoom()%></td>
                    <td><%=reserve.getStatus()%></td>

                    <%}%>
                </tr>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
