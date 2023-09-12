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
                background-image: url(image/contactUs.jpg);
                background-size: cover;
                background-position: center;
            }

            .contact-info {
                background-color: rgba(176, 235, 233, 0.9);
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            #map {
                height: 400px;
                width: 100%;
                border-radius: 10px;
            }

            .section-title {
                color: #3c4562;
                text-align: center;
                margin-bottom: 30px;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            }

            .contact-info p {
                margin-bottom: 10px;
                font-size: 20px;
            }

            .contact-info p:last-child {
                margin-bottom: 0;
            }

            .contact-info a {
                color: #000;
            }

            .contact-info a:hover {
                text-decoration: none;
            }

            footer {
                margin-top: 36px;
                text-align: center;
                background-color: #354842;
            }

            footer b {
                color: white;
            }
        </style>
        <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
        <script>
            function initMap() {
                var location = {lat: 37.7749, lng: -122.4194}; // Replace with your location coordinates

                var map = new google.maps.Map(document.getElementById('map'), {
                    center: location,
                    zoom: 14
                });

                var marker = new google.maps.Marker({
                    position: location,
                    map: map
                });
            }
        </script>

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


        <div class="container">
            <h1 class="mt-4 section-title">Contact Us</h1>

            <div class="row">
                <div class="col-md-6">
                    <div class="contact-info">
                        <h2 class="mt-4">Location</h2>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3972.017993762147!2d103.08378837484825!3d5.4142293945649715!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31b7bcabeaae3b37%3A0xfdbf70b38145fcd8!2sINOS%20UMT!5e0!3m2!1sen!2smy!4v1685947418517!5m2!1sen!2smy"
                                 width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="contact-info">
                        <h2 class="mt-4">Contact Information</h2>
                        <p><strong>Email :</strong> <a href="mailto:INOSUmt@edu.com">INOSUmt@edu.com</a></p>
                        <p><strong>Phone :</strong> <a href="tel:+609-6683195">+609-6683195</a></p>
                        <p><strong>Fax   :</strong> +09-6692166</p>
                    </div>
                    <img src="image/image1.jpg" alt="Contact Image" class="img-fluid mt-4" style="border-radius: 10px;">
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>





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



