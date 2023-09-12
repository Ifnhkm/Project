<%-- 
    Document   : adminLogin
    Created on : 1 Jun 2023, 11:18:21 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin Login</title>

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
            body{
                background-color: #89CFF0;
            }
            .container{
                padding: 110px 10px 100px 10px;
            }
            img{
                height: 80px;
            }
            p {
                font-size: 40px;
            }

        </style>
    </head>
    <body>
        <div class="container" style="padding-top: 120px; padding-bottom: 148px;">
            <center><img src="image/logo.png"></center>
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card" style="border-color: #007FFF;">
                        <div class="card-header" style="background-color: #007FFF; box-shadow: 10px 10px lightblue">
                            <h4>Login Admin</h4>
                        </div>
                        <div class="card-body" style="background-color: #6CB4EE;">
                            
                            <form action="<%=request.getContextPath()%>/AdminController" method="post">
                                <div class="form-group">
                                    <div class="shadow p-3 mb-5 bg-body rounded">
                                        <label for="email">Email address</label>
                                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="shadow p-3 mb-5 bg-body rounded">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="pass" placeholder="Password">
                                    </div>
                                    <span style="color:red">${error}</span>
                                </div>
                                <button type="submit" name="action" value="login" class="btn btn-primary">Submit</button>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"
        ></script>
    </body>
</html>


