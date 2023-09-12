<%-- 
    Document   : statusAdmin
    Created on : 2 Jun 2023, 12:39:20 am
    Author     : HP
--%>

<%@page import="java.util.List"%>
<%@page import="model.Reservation"%>
<%@page import="dao.ReservationDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />

        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.css"
            rel="stylesheet"
            />

        <style>
            body{
                background-color: #C7E4EE;
            }
            .color {
                background-color: #89CFF0;
                color: black;
            }

        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-primary bg-light">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Toggle button -->
                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Navbar brand -->
                    <a class="navbar-brand mt-2 mt-lg-0" href="#">
                        <img src="image/logo.png" height="35" alt="Inos Logo" loading="lazy" />
                    </a>
                    <!-- Left links -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="statusAdmin.jsp">Status</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="feedbackAdmin.jsp">Feedback</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="userAdmin.jsp">User</a>
                        </li>
                    </ul>
                    <!-- Left links -->
                </div>
                <!-- Collapsible wrapper -->

                <!-- Right elements -->
                <div class="d-flex align-items-center">
                    <!-- Avatar -->
                    <div class="dropdown">
                        <a
                            class="dropdown-toggle d-flex align-items-center hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuAvatar"
                            role="button"
                            data-mdb-toggle="dropdown"
                            aria-expanded="false"
                            ><i class="fa fa-user-circle-o" style="font-size: 36px"></i>
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuAvatar"
                            >
                            <li>
                                <a
                                    class="dropdown-item"
                                    href="<%=request.getContextPath()%>/AdminController?action=signout"
                                    >Logout</a
                                >
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->
        <div class="container" >
            <h1 class="mt-4 mb-4">List Of Reservation</h1>


            <table class="table align-middle mb-0 bg-white">
                <tr class="color">
                    <th>Email</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Room</th>
                    <th>Status</th>
                    <th>Action</th>
                    <th></th>
                </tr>
                <%

                    ReservationDAO reservationDAO = new ReservationDAO();
                    List<Reservation> ListReserve = reservationDAO.getAllReserve();

                    for (Reservation reservation : ListReserve) {
                %>

                <tr>
                <input type="hidden" value="<%=reservation.getReservationid()%>">
                <td><%=reservation.getEmail()%></td>
                <td><%=reservation.getDate()%></td>
                <td><%=reservation.getTime()%></td>
                <td><%=reservation.getRoom()%></td>
                <td><%=reservation.getStatus()%></td>
                <td>
                <div>
                    <form style="display: inline;" action="<%=request.getContextPath()%>/ReservationController" method="post">
                        <input name="action" value="updateStatus" style="display:none;"/>
                        <input name="id" value="<%=reservation.getReservationid()%>" style="display:none;"/>
                        <input value="approve" name="status" style="display:none;"/>
                        <button title="Accept" type="submit" name="action" value="updateStatus"><i style="color: green" class="fa fa-check"></i></button>
                    </form>
                    <form style="display: inline" action="<%=request.getContextPath()%>/ReservationController" method="post">
                        <input name="action" value="updateStatus" style="display:none;"/>
                        <input name="id" value="<%=reservation.getReservationid()%>" style="display:none;"/>
                        <input value="reject" name="status" style="display:none;"/>
                        <button title="Accept" type="submit" name="action" value="updateStatus"><i style="color: firebrick;" class="fa fa-times"></i></button>
                    </form>
                </div>
                </td>

                <td class="next">
                    <div style="display: inline; margin-left:auto; margin-right:auto;">

                        <form style="display: inline; margin-right: 10px" action="<%=request.getContextPath()%>/ReservationController">
                            <button onclick="return confirm('Are u sure about this?')" class="btn" title="Delete" type="submit" name="action" value="delete" style="color: red;float: left"><i class="fa fa-trash"></i></button>
                            <input name="reservationid" type="hidden" value="<%=reservation.getReservationid()%>">
                        </form>
                    </div>
                </td>
                </tr>
                <%}%>
            </table>
        </div>

        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"
        ></script>
    </body>
</html>

