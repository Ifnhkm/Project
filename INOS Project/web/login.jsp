<%-- 
    Document   : login
    Created on : 26 May 2023, 2:37:31 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <!-- Bootstrap 5 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
        <link href="try.css" rel="stylesheet" type="text/css" />
        <style>
            body {
                background-image: url("image/laut2.jpg");
                background-size: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container" style="padding-top: 120px; padding-bottom: 148px;">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card" style="border-color: #007FFF;">
                        <div class="card-header" style="background-color: #007FFF; box-shadow: 10px 10px lightblue">
                            <h4>Login</h4>
                        </div>
                        <div class="card-body" style="background-color: #6CB4EE;">
                            
                            <form action="<%=request.getContextPath()%>/UserController" method="post">
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
                                <button type="reset" class="btn btn-primary">Cancel</button>
                                <a href="adminLogin.jsp" style="float:right">Admin Login</a>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <b>Copyright &copy;</b>
        </div>
        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

