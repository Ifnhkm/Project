<%-- 
    Document   : reservation
    Created on : 2 Jun 2023, 6:16:14 am
    Author     : HP
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
        <title>Reservation Page</title>
        <style>
            body {
                background-image: url("image/reservebg.png");
                background-size: 100%;
            }

            .Reserve {
                margin: 10px;
                padding: 15px;
                text-align: center;
                background-color: rgb(134, 223, 223);
            }

            .slideshow {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 60vh;
            }

            .slideshow img {
                max-width: 100%;
                max-height: 100%;
                display: none;
                padding: 10px;
            }

            .button-container {
                padding: 22px 18px;
                display: flex;
                justify-content: center;
                gap: 80px;
                margin-bottom: 5px;
            }

            .button {
                padding: 10px 20px;
                background-color: #5f6d7b;
                color: #100f0f;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: 0.3s;
            }

            .btn:hover {
                background-color: aqua;
                color: #000;
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
            <div class="Reserve">
                <h1 class="display-4">MAKE A RESERVATION NOW !! </h1>
            </div>
        </div>

        <div class="slideshow">
            <img src="image/bilik1 .jpg" alt="Image 1">
            <img src="image/bilik2.jpg" alt="Image 2">
            <img src="image/bilik3.jpg" alt="Image 3">
            <img src="image/bilik4.jpg" alt="Image 4">
        </div>

        <div class="button-container">
            <a class="btn btn-primary" href="form.jsp">RESERVATION FORM</a>
        </div>

        <script>
            // JavaScript code for slideshow
            var images = document.querySelectorAll('.slideshow img');
            var currentIndex = 0;

            function showImage(index) {
                images[currentIndex].style.display = 'none';
                images[index].style.display = 'block';
                currentIndex = index;
            }

            setInterval(function () {
                var nextIndex = (currentIndex + 1) % images.length;
                showImage(nextIndex);
            }, 2000); // Change slide every 2 seconds
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    <footer>
        <b>INOS UMT &copy; 2023</b>
    </footer>

</html>
