<%-- 
    Document   : home
    Created on : Jan 23, 2023, 6:56:54 PM
    Author     : Yash
--%>

<%@page import="java.sql.*"%>
<%@page import="controllspack.Users"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="admin_dashboard.css">
    <title>Dashboard</title>
    
    <style>
        *{
    margin: 0;
    padding: 0;
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

body{
    background:url("https://wallpapercave.com/wp/1BXNgBK.jpg");
    background-repeat: no-repeat;
  background-attachment: fixed;
  background-size:cover;
  color: white;
}
.main{
    background: rgba(0, 0, 0,0.9);
}
td{
    padding-top:  30px;
}
.bgcolor{
    background: rgba(0, 0, 0);
    /* background: rgb(253,187,45);
background: linear-gradient(0deg, rgba(253,187,45,1) 0%, rgba(0,0,0,1) 65%); */
}
.recents{
    margin-top: 0px;
}

.recents h3{
    border: 2px solid rgba(255, 255, 0, 0.2);
    background: rgba(0, 0, 0, 0.9);
    color: yellow;
    padding: 10px 0px;
    border-radius: 50px;
}
.carousel {
    margin-bottom: 1rem;
  }
  /* Since positioning the image, we need to help out the caption */
  .carousel-caption {
    bottom: 1rem;
    z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel-item {
    height: 16rem;
}
.carousel-item > img {
    position: absolute;
    top: 0;
    left: 0;
    min-width: 100%;
    height: 17rem;
  }
  @media (min-width: 40em) {
    /* Bump up size of carousel content */
    .carousel-caption p {
      margin-bottom: 1.25rem;
      font-size: 1.25rem;
      line-height: 1.4;
    }
  
    .featurette-heading {
      font-size: 50px;
    }
  }

    </style>
    
</head>

<%
    String user=(String)  request.getAttribute("user");
String pass=(String)  request.getAttribute("pass");

            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            PreparedStatement stmt1=con.prepareStatement("SELECT * FROM USERS where username=? and password=?");  
            
            stmt1.setString(1, user);
            stmt1.setString(2, pass);
            String u=null,ps=null,n=null,l=null ,phn=null,a=null;
           ResultSet rs = stmt1.executeQuery();
            while (rs.next()) {
                
                n=rs.getString("name");
                
                ps=rs.getString("password");
                u=rs.getString("username");
                l=rs.getString("address");
                phn=rs.getString("phone");
                a=rs.getString("age");
            }           
         

%>

<body>
    <main class="main">

        <div class="row navitionbar">
            <div class="col ">
                <nav class="navbar navbar-expand-md navbar-dark   bgcolor">

                    <img src="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.1&permmsgid=msg-a:r-2351069453898528968&th=185dfa81ae62b9df&view=att&disp=safe&realattid=f_ld92ujub0" width="8%" class="m-auto" alt="error">

                    <a href="#" class="title navbar-brand m-auto">CRIMINAL MANAGEMENT SYSTEM</a>



                    <ul class="nav nav-pills nav-fill gap-2 p-1 small bg-dark rounded-5 shadow-sm m-auto" id="pillNav2"
                        role="tablist"
                        style="--bs-nav-link-color: var(--bs-white); --bs-nav-pills-link-active-color: var(--bs-primary); --bs-nav-pills-link-active-bg: var(--bs-white);">
<!--                        <li class="nav-item  " role="presentation">
                            <form action="add_vcr">
                             <button class="rl hlrbtn1 nav-link rounded-5 " id="home-tab2" data-bs-toggle="tab"
                                     type="submit" role="tab" aria-selected="true">VCR</button></form>
                        </li>-->
                        <li class="nav-item" role="presentation">
                            <button  data-target="#myModal" data-toggle="modal"  class=" hlrbtn1 nav-link  rounded-5" id="home-tab2" data-bs-toggle=""
                                type="button" role="tab" aria-selected="true">Profile</button>
                            </button>
                        </li>
                    </ul>

                </nav>
            </div>
        </div>

        <div class="recents">
            <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <h3 style=" background: rgba(255, 255, 255, 0.2);" align="center">Welcome ${name} </h3>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                            aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <rect width="100%" height="100%" fill="rgba(255, 255, 255, 0.1)" />
                        </svg>

                        <div class="container">
                            <div class="carousel-caption text-start">
                                <h1 style="color: red;">File Complains️ 📃.</h1>
                                <p >You can also file a complain about any suspected person.</p>
                                <!--<p><a class="btn btn-lg btn-light" href="#">Sign up today</a></p>-->
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                            aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <rect width="100%" height="100%" fill="rgba(255, 255, 255, 0.1)" />
                        </svg>

                        <div class="container">
                            <div class="carousel-caption">
                                <h1 style="color: red;">One Touch Access 👆.</h1>
                                <p>You can access the CMS database by just a click.</p>
                                <!--<p><a class="btn btn-lg btn-light" href="#">Learn more</a></p>-->
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                            aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <rect width="100%" height="100%" fill="rgba(255, 255, 255, 0.1)" />
                        </svg>

                        <div class="container">
                            <div class="carousel-caption text-end">
                                <h1 style="color: red;">Crime Information 🔪.</h1>
                                <p>Know all the information of any criminals in our data base.</p>
                                <!--<p><a class="btn btn-lg btn-light" href="#">Browse gallery</a></p>-->
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="functions container">
            <div class="row">
                
                <div class="col-3"><div class="card" style="background-color: rgba(255, 255, 255, 0.1); width: 18rem;">
                    <img class="card-img-top" height="150px;" src="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.4&permmsgid=msg-a:r-1911115098411854103&th=185e313986b4b5b1&view=att&disp=safe&realattid=f_lda10cst2" alt="Card image cap">
                    <div class="card-body" align="center">
                      <!-- <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <form action="view_criminal">
                       <button class="btn btn-light">View Criminals</button></a></form>
                      
                    </div>
                  </div></div>
                
                <div class="col-3"><div class="card" style="background-color: rgba(255, 255, 255, 0.1); width: 18rem;">
                    <img class="card-img-top" height="150px;" src="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.1&permmsgid=msg-a:r-3372225051951768696&th=185f34011d7f4a13&view=att&disp=safe&realattid=f_ldeikiah0" alt="Card image cap">
                    <div class="card-body" align="center">
                      <!-- <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <form action="file-complains">
                          <button class="btn btn-light">File Complains</button>
                      </form>
                    </div>
                  </div></div>
                <div class="col-3"><div class="card" style="background-color: rgba(255, 255, 255, 0.1); width: 18rem;">
                    <img class="card-img-top" height="150px;" src="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.3&permmsgid=msg-a:r-1911115098411854103&th=185e313986b4b5b1&view=att&disp=safe&realattid=f_lda10csu3" alt="Card image cap">
                    <div class="card-body" align="center">
                      <!-- <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <form action="View-spots">
                          <button class="btn btn-light">View Crime Spots</button>
                      </form>
                    </div>
                  </div></div>
                <div class="col-3"><div class="card" style="background-color: rgba(255, 255, 255, 0.1); width: 18rem;">
                    <img class="card-img-top" height="150px;" src="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.2&permmsgid=msg-a:r-3372225051951768696&th=185f34011d7f4a13&view=att&disp=safe&realattid=f_ldeikibv1" alt="Card image cap">
                    <div class="card-body" align="center">
                      <!-- <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <form action="view-complains">
                          <button class="btn btn-light">Your Complains</button>
                      </form>
                    </div>
                  </div></div>
            </div>
        </div>
                
                
                
                <!-- Button to Open the Modal -->
                <style>
                    .pt{
                        font-size: 1.8em;
                        font-family: monospace;
                        color: yellow;
                    }
                </style>

            <!-- The Modal -->
            <div class="modal fade "  id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header bg-dark">
                            <h4 class="modal-title pt"> <%=n%></h4>
                            <button type="button" class="btn-close btn-dark" data-dismiss="modal"></button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body bg-dark">
                    <div class="pcon">
                        <table>
                            <tr>
                                <td>Username : <%=u%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Age : <%=a%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Location : <%=l%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Phone : <%=phn%></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>

                    <div class="row mt-3">
                        <a style="text-decoration: none; padding-top: 30px;" style="border-radius: 0px;" href="start"  target=""> 
                            <button   class="btn btn-lg btn-danger container-fluid" 
                                type="button" >Logout</button></a></button>
                    </div>

                </div>

            </div>
                    </div>
                </div>
            </div>

                

    </main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</html>
<!-- Terrorist chor
Police staff ,post, ranks
Cid cbi
Cases
Criminals
Crime spot
Complain - evidence img
Files -->
