<%-- 
    Document   : view_complains
    Created on : Jan 25, 2023, 9:31:44 PM
    Author     : Yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : view_edit_criminals
    Created on : Jan 24, 2023, 3:08:33 PM
    Author     : Yash
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="admin_dashboard.css">
    <title>View Complains</title>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .title {
            font-weight: 900;
            font-size: 2.5em;
            animation: infinite color-change;
            animation-duration: 3s;
        }

        @keyframes color-change {
    0%{color: rgba(0, 0, 0);}
    50%{color: red;}
    100%{color: rgba(0, 0, 0);}

}

        body {
            background: url("https://wallpapercave.com/wp/1BXNgBK.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            color: white;
        }

        .main {
            background: rgba(0, 0, 0, 0.9);

        }

        .bgcolor {
            background: rgba(0, 0, 0,0.1);
            /* background: rgb(253,187,45);
background: linear-gradient(0deg, rgba(253,187,45,1) 0%, rgba(0,0,0,1) 65%); */
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
            height: 17rem;
        }

        .carousel-item>img {
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
        .emp{
            font-size: 1.2em;
            font-weight: 700;
        }
        h1{
            color: red;
            border: solid 2px yellow;
            border-radius: 20px;
            background-color: rgba(255,255,255,0.1);
            padding: 10px ;
            margin-top: 30px;
            margin-bottom:  50px;
            margin-left: 285px;
            width: fit-content;
            text-align: center;
            
        }
        .udb{
            margin-top: 40px;
        }
        h2{
            margin-top: 20px;
        }
        .black{
            color: black;
        }
        .red{
            color: red;
        }
        .rst{
            margin-top:  140px ;
            font-size: 1.7em;
            font-weight: 700;
        }
    </style>

<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            String fn[]=new String[20];
            String ln[]=new String[20];
            String add[]=new String[20];
            String type[]=new String[20];
            String vfn[]=new String[20];
            String vln[]=new String[20];
            String cd[]=new String[20];
            String cs[]=new String[20];
            String pd[]=new String[20];
            String reqs[]=new String[20];
            int id[]=new int[20];
            String username=(String) request.getAttribute("user");
            PreparedStatement stmt1=con.prepareStatement("select * from CRIMINALSREQUEST where username=?;");  
            stmt1.setString(1,username );
            ResultSet rs = stmt1.executeQuery();
            int n=0;
            int j=0;
            while (rs.next()) {
                type[j]=rs.getString("CRIME_TYPE")  ;
                fn[j]=rs.getString("FNAME")  ;
                ln[j]=rs.getString("LNAME")  ;
                cs[j]=rs.getString("STATUS")  ;
                pd[j]=rs.getString("PUNISHDURATION")  ;
                vfn[j]=rs.getString("VICTIM_FNAME")  ;
                vln[j]=rs.getString("VICTIM_LNAME")  ;
                cd[j]=rs.getString("CRIME_DATE");  
                add[j]=rs.getString("ADDRESS") ;
                reqs[j]=rs.getString("REQSTATUS");
                id[j]=rs.getInt("ID");
                j++;
            }
            n=j;
            %>



</head>

<body>
    <main class="main">

        <div class="row navitionbar">
            <div class="col ">
                <nav class="navbar navbar-expand-md navbar-dark   bgcolor">

                    <img src="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.1&permmsgid=msg-a:r-2351069453898528968&th=185dfa81ae62b9df&view=att&disp=safe&realattid=f_ld92ujub0"
                        width="8%" class="m-auto" alt="error">

                    <a href="#" class="title navbar-brand m-auto">CRIMINAL MANAGEMENT SYSTEM</a>



                    <ul class="nav nav-pills nav-fill gap-2 p-1 small bg-dark rounded-5 shadow-sm m-auto" id="pillNav2"
                        role="tablist"
                        style="--bs-nav-link-color: var(--bs-white); --bs-nav-pills-link-active-color: var(--bs-primary); --bs-nav-pills-link-active-bg: var(--bs-white);">
                        <li class="nav-item" role="presentation">
                            <form action="user_dashboard">
                             <button class=" hlrbtn1 nav-link active rounded-5" id="home-tab2" data-bs-toggle="tab"
                                     type="submit" role="tab" aria-selected="true">Dashboard</button></form>
                        </li>
                        
                        
                        
                    </ul>

                </nav>
            </div>
        </div>

        <div class=" container">
            <h1 align="center">Criminal List and Information</h1>
            <div class="criminal_cards row">
<!--
                <div class="col-2"></div>

                <div class="card criminal_card bgcolor col-8">
                    <div class="card-header">
                        <h2 align="center"><//%=fn[j]+ ln[j] %></h2>
                    </div>
                    <div class="card-body bgcolor row">
                        <div class="col-6">
                            <ul class="list-group bgcolor emp">
                                <li class="list-group-item list-group-item-light bgcolor">Crime Type : <%=type[j]%></li>
                                <li class="list-group-item list-group-item-dark bgcolor">Criminal Status : <%=cs[j]%></li>
                                <li class="list-group-item list-group-item-dark bgcolor">Punishment Duration : <%=pd[j]%></li>
                            </ul>

                        </div>
                        <div class="col-6">
                            <ul class="list-group bgcolor emp">
                                <li class="list-group-item list-group-item-light bgcolor">Victim name : <%=vfn[j]+ vln[j]%></li>
                                <li class="list-group-item list-group-item-dark bgcolor">Crime Date : <%=cs[j]%></li>
                                <li class="list-group-item list-group-item-dark bgcolor">Address : <%=add[j]%></li>
                            </ul>
                        </div>
                    </div>
                </div>

                            <div class="col-2"><br><br><br>
                            <button class="btn udb col-6 btn-light"> Update</button> 
                            <button class="btn udb col-6 btn-light"> Delete</button>
                </div>-->
                            
                <br>
            </div>
        </div>
                        
       <% int i=1;
for ( i = 0; i < n; i++){ %>
        
         <script>   $(".criminal_cards ").append('<div class="col-2 rst" align="center"><div class="red"> <%=reqs[i]%> </div></div><div class="card criminal_card bgcolor col-8"><div class="card-header">        <h2 align="center"><%=fn[i]%> <%=ln[i] %></h2>    </div>    <div class="card-body bgcolor row">        <div class="col-6">            <ul class="list-group bgcolor emp">                <li class="list-group-item list-group-item-light bgcolor">Crime Type : <%=type[i]%></li>                <li class="list-group-item list-group-item-dark bgcolor">Criminal Status : <%=cs[i]%></li>                <li class="list-group-item list-group-item-dark bgcolor">Punishment Duration : <%=pd[i]%></li>   </ul>   </div>        <div class="col-6">            <ul class="list-group bgcolor emp">                <li class="list-group-item list-group-item-light bgcolor">Victim name : <%=vfn[i]%> <%=vln[i]%></li>                <li class="list-group-item list-group-item-dark bgcolor">Crime Date : <%=cd[i]%></li>                <li class="list-group-item list-group-item-dark bgcolor">Address : <%=add[i]%></li>            </ul>        </div>    </div></div><div class="col-2"><br><br><br><form action="u_req_up" method="POST"><button type="submit" name="id" value="<%=id[i]%>" class="btn udb ub col-6 btn-light"> Update</button>  </form><form action="u_req_del" method="POST"><button type="submit" name="id" value="<%=id[i]%>" class="btn udb db col-6 btn-light"> Delete</button></form></div><br> ');
            </script>
         </font><br />
      <%}%>
                            
    </main>
</body>

<script>
    
        $(function(){
        $('.db').on('click',function(){
            return confirm("Are you sure you want to Delete this Request?");
        });
        $('.ub').on('click',function(){
            return confirm("Are you sure you want to Update this Request?");
        });
    });
        
     
</script>

</html>






 