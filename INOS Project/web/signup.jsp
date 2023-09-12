<%-- 
    Document   : signup
    Created on : 26 May 2023, 12:11:09 am
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sign Up Page</title>
        <!-- Bootstrap 5 CSS -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
            />
        <style>
            body {
                background-image: url("image/ocean2.jpg");
                background-size: 100%;
            }
            h3 {
                padding-left: 500px;
            }
            p {
                padding-left: 500px;
            }

            .nilai {
                background-color: #007791;
                padding-left: 420px;
            }

            .footer {
                text-align: center;
                background-color: #354842;
            }
            .footer b {
                color: white;
            }
        </style>
        <script>
            function validatePassword() {
                var password = document.form.password.value;

                if (password.length < 8) {
                    alert("Password must be at least 8 characters long.");
                    return false;
                }
            }
        </script> 
    </head>
    <body>
        <div class="container" style="padding-top: 80px; padding-bottom: 200px">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div
                        class="card"
                        style="border-color: #007fff; box-shadow: 10px 10px lightblue"
                        >
                        <div class="card-header" style="background-color: #007fff">
                            <h4>Sign Up</h4>
                        </div>
                        <div class="card-body" style="background-color: #6cb4ee">
                            <form name="form" action="<%=request.getContextPath()%>/UserController" method="POST" onsubmit="return validatePassword()">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Enter email"/>
                                </div>
                                <div class="form-group">
                                    <label for="pass">Password</label>
                                    <input type="password" class="form-control" id="pass" name="pass" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <label for="matric">No Matric</label>
                                    <input type="text" class="form-control" id="matric" name="matric" placeholder="No Matric"/>
                                </div>
                                <div class="form-group">
                                    <label for="role">Role : </label>
                                    <select name="role" id="role" class="form-control" size="1">
                                        <option value="Student" name="Student">Student</option>
                                        <option value="Staff" name="Staff">Staff</option>
                                    </select><br/>
                                </div>
                                <button type="submit" name="action" value="register" class="btn btn-primary">Submit</button>
                                <button type="reset" class="btn btn-primary">Cancel</button>
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

