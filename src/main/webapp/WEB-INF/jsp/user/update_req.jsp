<%-- 
    Document   : add_complains
    Created on : Jan 25, 2023, 8:39:21 PM
    Author     : Yash
--%>

<%@page import="java.sql.*"%>
<%-- 
    Document   : add_criminals
    Created on : Jan 24, 2023, 3:07:02 PM
    Author     : Yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fo" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://mail.google.com/mail/u/0?ui=2&ik=f9a303c31d&attid=0.1&permmsgid=msg-a:r-3401877834990950986&th=185fd2686cbce7de&view=att&disp=safe&realattid=f_ldh9gd2k0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="admin_dashboard.css">
    <title>File Complains</title>
    
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
    background: rgba(0, 0, 0,0.7);
    min-height: 100vh;
    max-height: 135vh;
}
.bgcolor{
    background: rgba(0, 0, 0);
    /* background: rgb(253,187,45);
background: linear-gradient(0deg, rgba(253,187,45,1) 0%, rgba(0,0,0,1) 65%); */
}
.field{
    border: 1px solid yellow;
    background: yellow;
    width:fit-content;
    border-radius: 5px;
    padding:1px 5px;
}
.form h2{
    padding-top: 50px;
}
.red{
    color: red;
}
.main-title{
    font-weight: 900;
    font-size: 3em;
    margin-top: 50%;
}
    </style>
    
</head>

<%
            int id=(int)request.getAttribute("id");
    
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
            String username=(String) request.getAttribute("username");
            PreparedStatement stmt1=con.prepareStatement("select * from CRIMINALSREQUEST where ID=?;");  
            stmt1.setInt(1,id );
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
                j++;
            }
            n=j;
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
                        <li class="nav-item" role="presentation">
                            <form action="user_dashboard">
                             <button class=" hlrbtn1 nav-link active rounded-5" id="home-tab2" data-bs-toggle="tab"
                                     type="submit" role="tab" aria-selected="true">Dashboard</button></form>
                        </li>
                        
                        
                        
                    </ul>

                </nav>
            </div>
        </div>

        <div class="container form">
            <div class="row">

                <div class="col-8">
                    <form class="row g-3 needs-validation" action="process_updated_req" method="post">
                        <div align="center" class="red form-in-title">
                            <h2>Personal Details</h2>
                        </div>
                        <div class="col-md-6">
                          <label for="validationCustom01" class="form-label">First name</label>
                          <input type="text" value="<%=fn[0]%>" name="firstname" class="form-control" id="validationCustom01" required>
                          <div class="invalid-feedback field">
                            Please fill this field!
                          </div>
                        </div>
                        <div class="col-md-6">
                          <label for="validationCustom02" class="form-label">Last name</label>
                          <input type="text" name="lastname" value="<%=ln[0] %>" class="form-control" id="validationCustom02" required>
                          <div class="invalid-feedback field">
                            Please fill this field!
                          </div>
                        </div>
                        <div class="col-md-12">
                          <label for="validationCustomUsername" class="form-label">Address</label>
                          <textarea rows="3" name="address" placeholder="<%=add[0] %>"   class="form-control" id="validationCustom02" required></textarea>
                          <div class="invalid-feedback field">
                            Please fill this field!
                          </div>
                        </div>
<!--                        <div class="col-md-4">
                          <label for="validationCustom03" class="form-label">City</label>
                          <input type="text" name="city" class="form-control" id="validationCustom03" required>
                          <div class="invalid-feedback field">
                            Please fill this field!
                          </div>
                        </div>
                        <div class="col-md-4">
                          <label for="validationCustom04" class="form-label">State</label>
                          <input type="text" class="form-control" id="validationCustom03" required>
                          <div class="invalid-feedback field">
                            Please fill this field!
                          </div>
                        </div>
                        <div class="col-md-4">
                          <label for="validationCustom05" class="form-label">Pin-Code</label>
                          <input type="text" class="form-control" id="validationCustom05" required>
                          <div class="invalid-feedback field">
                            Please fill this field!
                          </div>
                        </div>-->


                        <div align="center" class="red form-in-title">
                            <h2>Crime Details</h2>
                        </div>

                        <div class="col-md-4">
                        <label for="validationCustom04"  value="<%=type[0] %>"  class="form-label">Type of Crime</label>
                        <select class="form-select" name="crimeType" id="validationCustom04" required>
                        <option selected disabled value="NULL">Choose</option>
                        <option value="Burglary" >Burglary</option>
                        <option value="Gangster" >Gangster</option>
                        <option value="Domestic abuse" >Domestic abuse</option>
                        <option value="Murderer">Murderer</option>
                        <option value="Sexual Harassment">Sexual Harassment</option>
                        <option value="Terrorist">Terrorist</option>
                        <option value="Cyber Crime">Cyber Crime</option>
                        </select>
                        <div class="invalid-feedback field">
                            Please fill this field!
                          </div>
                        </div>

                        <div class="col-md-4">
                            <label for="validationCustom05" class="form-label">Victim's First Name</label>
                            <input type="text" name="victim_first_name"  value="<%=vfn[0] %>"  class="form-control" id="validationCustom05" required>
                            <div class="invalid-feedback field">
                              Please fill this field!
                            </div>
                          </div>
                        <div class="col-md-4">
                            <label for="validationCustom05" class="form-label">Victim's Last Name</label>
                            <input type="text" name="victim_last_name" value="<%=vln[0] %>"  class="form-control" id="validationCustom05" required>
                            <div class="invalid-feedback field">
                              Please fill this field!
                            </div>
                          </div>
                        <div class="col-md-4">
                            <label for="validationCustom05" class="form-label">Date of Crime</label>
                            <input type="date" name="crimedate" value="<%=cd[0] %>"  class="form-control" id="validationCustom05" required>
                            <div class="invalid-feedback field">
                              Please fill this field!
                            </div>
                          </div>
                          <div class="col-md-4">
                            <label for="validationCustom04" class="form-label">Status of Criminal</label>
                            <select class="form-select" value="<%=cs[0] %>"  name="criminal_Status" id="validationCustom042" required>
                            <option selected disabled value="NULL">Choose</option>
                            <option value="Prisoner">Prisoner</option>
                            <option value="Not-Caught">Not-Caught</option>
                            <option value="Released">Released</option>
                            <option value="Dead">Dead</option>
                            <option value="Escaped">Escaped</option>
                            <option value="In-Process">In-Process</option>
                            </select>
                            <div class="invalid-feedback field">
                                Please fill this field!
                              </div>
                            </div>
                            <div class="col-md-4">
                                <label for="validationCustom04"   class="form-label">Duration of Punishment</label>
                                <input type="text" name="punishment_duration"value="<%=pd[0] %>" class="form-control" id="validationCustom05" required>
                                <div class="invalid-feedback field">
                                    Please fill this field!
                                  </div>
                                </div>

                        <div class="col-12">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                            <label class="form-check-label" for="invalidCheck">
                              Agree to terms and conditions
                            </label>
                            <div class="invalid-feedback ">
                              You must agree before submitting.
                            </div>
                          </div>
                        </div>
                        <div>
                          <button name="id" value="<%=id%>" class="col-12 btn btn-danger" type="submit">SUBMIT</button>
                        </div>
                      </form>
                </div>


                <div class="col-4">
                    <h1 align="center" class=" main-title red">Update selected  Suspect<br> Details</h1>
                    <img src="" alt="">
                </div>


            </div>
        </div>

    </main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

    (() => {
        'use strict';
  
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation')
        
        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }
        
        form.classList.add('was-validated');
    }, false);
});
})();

</script>
</html>
