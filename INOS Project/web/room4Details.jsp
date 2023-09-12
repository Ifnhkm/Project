<%-- 
    Document   : room4Details
    Created on : 3 Jun 2023, 10:27:30 pm
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
        <title>Room 4 Detail</title>
        <style>
            body {
                background-color: rgb(180, 207, 236);
            }

            .container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 5px;
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
                font-size: 1.4rem;
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
                    <p class="description">The Technology Hub is a cutting-edge meeting space tailored for tech-savvy teams
                        and innovation-driven discussions.
                        This room is equipped with the latest audiovisual technology, including interactive touchscreens,
                        video conferencing capabilities,
                        and high-speed internet access. The sleek and modern design creates an environment that fosters
                        collaboration and showcases technological advancements.
                        With ergonomic seating and adjustable workstations, the Technology Hub offers a comfortable and
                        functional space for hands-on demonstrations, virtual meetings,
                        and collaborative coding sessions. It is the perfect choice for technology-focused teams seeking a
                        space that combines state-of-the-art equipment with a contemporary atmosphere</p>
                </fieldset>
            </div>
            <div class="image-container">
                <img src="image/bilik4.jpg" alt="Image">
                <div class="name">Technology Hub</div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    <footer>
        <b>INOS UMT &copy; 2023</b>
    </footer>

</html>
