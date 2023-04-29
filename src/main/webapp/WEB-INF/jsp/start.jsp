<%-- 
    Document   : start
    Created on : Jan 23, 2023, 5:30:57 PM
    Author     : Yash
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="index.css">
        <title>Welcome</title>
    
    <style>
        body{

    background-image: url('https://wallpapercave.com/wp/1BXNgBK.jpg');
    
    background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.bgcolor{
    background: rgba(0, 0, 0, 0.7);
}
input{
    background: rgba(0,0,0,0.5) ;
    color:white;
}
.title{
    font-weight: 900;
    font-size: 2.5em;
    animation:infinite color-change;
    animation-duration: 3s; 
}
@keyframes color-change {
    0%{color: rgba(0, 0, 0);}
    50%{color: red;}
    100%{color: rgba(0, 0, 0);}

}

main{
    color: white;
    background: rgba(3, 3, 3, 0.7);
    height: 84vh;
    padding-top: 50px;
}
h1{
    margin: 00px 0px 50px 0px;
}
.form1{
    /*padding-top: 50px;*/
    
    padding-top: 50px;
    /* padding: 20px; */
    border-radius: 30px;
    background: rgba(57, 54, 54, 0.8);
    
    width: 50%; 
}
.form2{
    /*padding-top: 50px;*/
    
    padding-top: 50px;
    /* padding: 20px; */
    border-radius: 30px;
    background: rgba(57, 54, 54, 0.8);
    padding-bottom: 30px;
    width: 60%; 
}
.homepage{
    margin-top: -25px;
    padding-top: 20px;
    padding-bottom: 20px;
    /* padding: 20px; */
    border-radius: 30px;
    background: rgba(57, 54, 54, 0.8);
    
}
input{
    margin-left:20px ;
}
.red{
    color: red;
}
.inc{
    font-weight: 800;
    font-size: 1.2em;
    padding: 10px;
}
.head{
    font-size: 1.8em;
    font-weight: 700;
}
.cont{
    font-size: 1.2em;
    padding-left: 50px;
    word-spacing: 5px;
}
.sidebar{
    background: rgba(255,255,255, 0.5);
    width: 31%;
    text-align: center;
    font-size: 1.3em;
    animation:infinite bg-change;
    border-radius: 20px;
    animation-duration: 3s;
    
}
@keyframes bg-change {
    0%{background: rgba(255, 255, 255, 0);}
    50%{background: rgba(0, 0, 0, 0.7);}
    100%{background: rgba(255, 255, 255, 0);}

}
td{
    padding-top: 20px;
}
    </style>
    
</head>

<body>
    <div class="row navitionbar">
        <div class="col ">
            <nav class="navbar navbar-expand-md navbar-dark bgcolor" >

                <img src="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.1&permmsgid=msg-a:r-2351069453898528968&th=185dfa81ae62b9df&view=att&disp=safe&realattid=f_ld92ujub0" width="8%" class="m-auto" alt="error"/>
                <!--<img src="logo" alt="alt"/>-->
                <a href="#" class="title navbar-brand m-auto">CRIMINAL MANAGEMENT SYSTEM</a>



                <ul class="nav nav-pills nav-fill gap-2 p-1 small bg-dark rounded-5 shadow-sm m-auto" id="pillNav2"
                    role="tablist" style="--bs-nav-link-color: var(--bs-white); --bs-nav-pills-link-active-color: var(--bs-primary); --bs-nav-pills-link-active-bg: var(--bs-white);">
                    <li class="nav-item" role="presentation">
                        <button class=" hlrbtn1 nav-link active rounded-5" id="home-tab2" data-bs-toggle="tab" type="button"
                            role="tab" aria-selected="true">Home</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class=" hlrbtn2 nav-link rounded-5" id="profile-tab2" data-bs-toggle="tab" type="button"
                            role="tab" aria-selected="false">Login</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class=" hlrbtn3 nav-link rounded-5" id="contact-tab2" data-bs-toggle="tab" type="button"
                            role="tab" aria-selected="false">Register</button>
                    </li>
                </ul>

            </nav>
        </div>
    </div>

    <main class="container-fluid contents">

        <div class="homepage container">
            <p class="intro">
                <div class="head" align="center">
                    Welcome to the <span class="red inc" >CRIMINAL MANAGEMENT SYSTEM</span>.</div> <br><br>
                                      
                    <div class="row">
                    
                    <div class="col-8">
                <div class="cont">
                <span class="red inc">CMS</span>Helps you to get information about all the<span class="red inc">CRIMINAL CASES</span>happening around you. <br><br>
                You can view<span class="red inc">CRIMINAL INFOROMATION</span>in our database by CMS.<br><br>
                You can locate different<span class="red inc">CRIME SPOTS</span>where crimes took place.
                <br> <br>
                You can file<span class="red inc">COMPLAINS</span>about any suspect by providing the valid proofs and his details.
            </div>
        </div>
                        <div class="col-4 sidebar m-auto p-2">
                        Please <span class="red inc">LOGIN</span> to use the website.
                        <br>
                        If you haven't registered till now . . .<br>
                        Please <span class="red inc">REGISTER</span> now.
                    </div>
        </div>
            </p>
        </div>

        <div class="loginform form1 container" align="center">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <form action="done_login" method="post">

                            <h1 class="red" style="font-weight: 900;">Login </h1>
                    </div>
                    USERNAME <input type="text" name="username" id="" required> <span class="red">*</span>
                    <br><br>
                    PASSWORD <input type="password" name="password" required> <span class="red">*</span>
                    <br><br>
                    <button class="red btn btn-light btn-lg m-5" style="font-weight: 800;">LOGIN</button>


                    </form>

                </div>
            </div>

        </div>

        <div class="registrationform form2 container" align="center">
        <form action="done_register" method="post">
                <div class="row">
                    <h1 class="red" style="font-weight: 900;">Register </h1>
                </div>
                <div class="row">
                    <div class="col-6">
                        <table>
                            <tr>
                                <td align="right">FULL NAME</td>
                                <td><input type="text" name="name" id="" required> <span class="red">*</span>
                                   </td>
                            </tr>
                            <tr>
                                <td align="right">AGE</td>
                                <td> <input type="number"  name="age" id="" required> <span class="red">*</span></td>
                            </tr>
                            <tr>
                                <td align="right">LOCATION </td>
                                <td><input type="text" name="add" id="" required> <span class="red">*</span></td>
                            </tr>
                            <tr>
                                <td align="right">PHONE NO </td>
                                <td><input type="text" name="phone" id="" required> <span class="red">*</span></td>
                            </tr>
                        </table>

                    </div>
                    <div class="col-6">

                        <table>
                            <br>
                            <tr>
                                <td>SET-USERNAME </td>
                                <td><input type="text" name="username" id="" required> <span class="red">*</span></td>
                            </tr>
                            <tr>
                                <td>SET-PASSWORD </td>
                                <td><input type="password" name="password" required> <span class="red">*</span></td>
                            </tr>
                        </table>
                    </div>
                    <div class="rb" style="margin-bottom: 50px;" ></div>
                    <div class="row" >
                        <div class="col">
                    <button class=" rbtn red btn btn-light btn-lg" style="font-weight: 800;">REGISTER</button>
                            
                        </div>
                        
                    </div>
                </div>
            </form>
    </div>
    </div>

    </div>

    </main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    $(function(){
        $('.form1 , .form2').hide();

        $('.hlrbtn1').on('click',function(){
            $('.form1 , .form2').hide();
            $('.homepage').show();
        });
        $('.hlrbtn2').on('click',function(){
            $('.loginform').show();
            $('.homepage').hide();
            $('.registrationform').hide();
        });
        $('.hlrbtn3').on('click',function(){
            $('.loginform').hide();
            $('.homepage').hide();
            $('.registrationform').show();
        });
        $('.rbtn').on('click',function(){
            
            alert("You are Registered successfully ! You can log in with your username and password 😎 ");
        });
    });
</script>


</html>