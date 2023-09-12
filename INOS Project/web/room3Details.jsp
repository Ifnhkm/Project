<%-- 
    Document   : room3Details
    Created on : 3 Jun 2023, 10:23:46 pm
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
        <title>Room 3 Detail</title>
        <style>
            body {
                background-color: rgb(180, 207, 236);
            }

            .container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 15px;
            }

            .image-container {
                flex: 1;
                text-align: right;
            }

            .image-container img {
                max-width: 100%;
                height: auto;
            }

            .name {
                padding: 15px;
                font-size: 2.0rem;
                text-align: center;
                margin-top: 10px;
                font-weight: bold;
            }

            .description-container {
                padding: 30px;
                flex: 1;
                margin-right: 20px;
            }

            fieldset {
                border: 5px solid #040404;
                padding: 10px;
            }

            legend {
                font-weight: bold;
            }

            .description {
                padding: 15px;
                font-size: 1.6rem;
                margin-top: 10px;
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
            <div class="description-container">
                <fieldset>
                    <legend>Description</legend>
                    <p class="description">The Collaborative Lounge offers a relaxed and informal setting designed to
                        facilitate informal meetings,
                        casual discussions, and team collaboration. With its comfortable seating options, cozy ambiance, and
                        interactive features,
                        this room encourages a more laid-back and collaborative atmosphere. The lounge is equipped with cozy
                        couches, coffee tables,
                        and writable walls to promote idea sharing and spontaneous conversations.
                        It is the perfect space for teams looking to foster a sense of community and encourage open
                        communication</p>
                </fieldset>
            </div>
            <div class="image-container">
                <img src="image/bilik3.jpg" alt="Image">
                <div class="name">Collaborative Lounge</div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    <footer>
        <b>INOS UMT &copy; 2023</b>
    </footer>

</html>
