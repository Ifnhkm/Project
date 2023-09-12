<%-- 
    Document   : room1Details
    Created on : 3 Jun 2023, 10:04:14 pm
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
        <title>Room 1 Detail</title>
        <style>
            body {
                background-color: rgb(180, 207, 236);
            }

            .container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                margin-top: 25px;
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
                    <p class="description">The Executive Boardroom is a sophisticated and prestigious meeting space designed
                        for high-level discussions and decision-making.
                        With its elegant decor and comfortable seating, this room offers a professional atmosphere conducive
                        to important meetings, presentations, and executive gatherings.
                        Equipped with state-of-the-art audiovisual technology and a large conference table,
                        the Executive Boardroom provides a seamless environment for productive discussions and collaboration
                        among key stakeholders.</p>
                </fieldset>
            </div>
            <div class="image-container">
                <img src="image/bilik1 .jpg" alt="Image">
                <div class="name">Executive Boardroom</div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    <footer>
        <b>INOS UMT &copy; 2023</b>
    </footer>

</html>