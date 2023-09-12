<%-- 
    Document   : room
    Created on : 3 Jun 2023, 10:01:23 pm
    Author     : Irfan Hakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <title>INOS Meeting and Conference Room</title>
        <style>
            body {
                background-image: url("image/roombg.jpeg");
            }

            .jumbotron {
                padding: 20px 0px 20px 0px;
                margin-top: 20px;
                margin-bottom: 20px;
                text-align: center;
                background-color: #bed8f2;
            }

            .display-4 {
                font-size: 3.5rem;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .lead {
                font-size: 1.8rem;
            }

            .thumbnail {
                margin: 30px;
            }

            .thumbnail img {
                width: 100%;
                height: auto;
            }

            .row {
                justify-content: center;
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

    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container">
            <div class="jumbotron">
                <h1 class="display-4">INOS Meeting and Conference Room</h1>
                <p class="lead">Come and visit our facilities</p>
            </div>
        </div>

        <div class="container img">
            <div class="row">
                <div class="col-lg-6">
                    <div class="thumbnail">
                        <a href="room1Details.jsp"><img src="image/bilik1 .jpg" alt="Bilik 1"></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="thumbnail">
                        <a href="room2Details.jsp"><img src="image/bilik2.jpg" alt="Bilik 2"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container img">
            <div class="row">
                <div class="col-lg-6">
                    <div class="thumbnail">
                        <a href="room3Details.jsp"><img src="image/bilik3.jpg" alt="Bilik 3"></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="thumbnail">
                        <a href="room4Details.jsp"><img src="image/bilik4.jpg" alt="Bilik 4"></a>
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
