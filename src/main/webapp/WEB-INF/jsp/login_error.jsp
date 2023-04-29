<%-- 
    Document   : login_error
    Created on : Jan 25, 2023, 7:36:14 PM
    Author     : Yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.1&permmsgid=msg-a:r-3401877834990950986&th=185fd2686cbce7de&view=att&disp=safe&realattid=f_ldh9gd2k0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="admin_dashboard.css">
    <title>Login | Error</title>
    
    <style>
        *{
    margin: 0;
    padding: 0;
}
.title{
    font-weight: 900;
    font-size: 1.8em;
    animation:infinite color-change;
    animation-duration: 3s; 
}
@keyframes color-change {
    0%{color: rgba(0, 0, 0);}
    50%{color: red;}
    100%{color: rgba(0, 0, 0);}

}

body{
    background:url("https://wallpapercave.com/wp/1BXNgBK.jpg");
    background-repeat: no-repeat;
  background-attachment: fixed;
  background-size:cover;
  color: white;
}
.main{
    background: rgba(0, 0, 0,0.8);
    min-height: 100vh;
}
.red{
    color: red;
}
h1{
    padding:  100px ;
}
.bt{
    font-weight: 700;
}
h3{
    padding: 30px;
}
    </style>
    
</head>

<body>
    <main class="main " align="center">

        <h1>Sorry 😢 Login Failed !</h1>
        <h3>Incorrect <span class="red"> Username</span> or <span class="red">Password</span> entered.</h3>
        <h3>Might be possible you did not registered! If not, <span class="red"> Register</span> now from the main page.</h3>
        <div class="mainpage">
            <a href="start"><button class="btn bt btn-light"> Go back to main page  </button></a>
        </div>
        

    </main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</html>
