<%-- 
    Document   : home
    Created on : 26 May 2023, 11:44:50 pm
    Author     : HP
--%>

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
            body {
                background-image: url("image/homepage.jpg")
            }
            /* Adjustments for the carousel and content */
            .carousel-inner img {
                object-fit: cover;
                height: 400px;
            }

            .nilai {
/*                background-color: #008E97;*/
                padding-top: 130px;
                padding-bottom: 130px;
                padding-left: 20px;
                display: flex;
                align-items: center;
            }

            #about {
/*                background-color: #008E97;*/
                padding-top: 40px;
                padding-bottom: 40px;
                padding-right: 20px;
            }

            /* Custom styles for the text */
            h3 {
                color: #fff;
                font-size: 28px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            p {
                color: #fff;
                font-size: 18px;
                line-height: 1.5;
                text-align: justify;
                margin-bottom: 0;
            }

            /* Custom styles for the footer */
            footer {
                text-align: center;
                background-color: #354842;
                padding: 5px;
                color: #fff;
                font-size: 14px;
            }

            footer a {
                color: #fff;
                text-decoration: underline;
            }

            footer a:hover {
                color: #fff;
                text-decoration: none;
            }
        </style>


        <title>Home</title>
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
                        <img
                            src="image/logo.png"
                            height="35"
                            alt="Inos Logo"
                            loading="lazy"
                            />
                    </a>
                    <!-- Left links -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <div class="dropdown">
                                <a
                                    class="dropdown-toggle d-flex align-items-center hidden-arrow nav-link"
                                    href="#"
                                    id="navbarDropdownMenuAvatar"
                                    role="button"
                                    data-mdb-toggle="dropdown"
                                    aria-expanded="false"
                                    >Room</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                                    <li>
                                        <a class="dropdown-item" href="room.jsp">Details</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="dropdown">
                                <a
                                    class="dropdown-toggle d-flex align-items-center hidden-arrow nav-link"
                                    href="#"
                                    id="navbarDropdownMenuAvatar"
                                    role="button"
                                    data-mdb-toggle="dropdown"
                                    aria-expanded="false"
                                    >Reservation</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                                    <li>
                                        <a class="dropdown-item" href="reservation.jsp">Form</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="userStatus.jsp">Status</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contactus.jsp">Contact Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="feedbackUser.jsp">Feedback</a>
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
                            ><i class="fa fa-user-circle-o" style="font-size:36px"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                            <li>
                                <a class="dropdown-item" href="userprofile.jsp">My profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<%=request.getContextPath()%>/UserController?action=signout">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->

        <div class="container-fluid bg-grey nilai">
            <div class="row">
                <div class="col-sm-6">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="image/image1.jpg" class="d-block w-100" alt="image1" style="width: 100%; height: 400px;">
                            </div>
                            <div class="carousel-item">
                                <img src="image/image2.jpg" class="d-block w-100" alt="image2" style="width: 100%; height: 400px;">
                            </div>
                            <div class="carousel-item">
                                <img src="image/image3.jpg" class="d-block w-100" alt="image3" style="width: 100%; height: 400px;">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div id="about" class="container-fluid" style="padding-top: 40px; height: 100%;">
                        <div class="d-flex flex-column justify-content-center align-items-center h-100">
                            <h3 style="color: black">Get to know INOS Meeting And Conference Reservation System</h3>
                            <br>
                            <p style="color: black; text-align: justify;">The system usually provides a user-friendly interface that allows users to view the availability of different rooms, select the date and time, and make reservations. 
                                The benefits of using a meeting and conference room reservation system include improved efficiency, increased productivity, and better utilization of resources. 
                                By automating the reservation process and providing real-time availability information, the system can save time and reduce errors. It can also help users find the best available space for their needs, avoid scheduling conflicts, 
                                and ensure that all necessary resources are available.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <footer>
            <b>INOS UMT &copy; 2023</b>
        </footer>


        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"
        ></script>
    </body>
</html>



