package controllspack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Yash
 */
@Controller
public class Controllers {
    
    public Users us=new Users();
//    start web application
    @RequestMapping("/start")
    public String home(Model m) {
        System.out.println("hello");
        
        return "start";
    }
    
//    login authentication
    @RequestMapping(value = "/done_login", method = RequestMethod.POST)
    public String long_done(
            @RequestParam("username") String x,
            @RequestParam("password") String y,
            Model m
    ){
        try {
                        
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            PreparedStatement stmt=con.prepareStatement("select * from users where username=? and password=?");  
            stmt.setString(1, x);
            stmt.setString(2,y);//1 specifies the first parameter in the query  
            
            ResultSet rs = stmt.executeQuery();
   
            String a=null,b=null,n=null,phn=null,add=null,age=null;
           
            while (rs.next()) {
                a=rs.getString("USERNAME");
                b=rs.getString("PASSWORD");
                n=rs.getString("NAME");
                phn=rs.getString("PHONE");
                add=rs.getString("ADDRESS");
                age=rs.getString("AGE");
            }
            System.out.println(a+"  "+b);
            
            if(x.equals("yash")){
                if(y.equals("master")){
                    return "admin/admin_home";
                }
            }
            System.out.println("user check");
            if(x.equals(a)){
                System.out.println("user yes");
                if(y.equals(b)){
                System.out.println("pass yes");
                    us.setName(n);
                    us.username=x;
                    us.password=y;
                    us.phone=phn;
                    us.address=add;
                    us.age=age;
                    
                    System.out.println("name is login "+us.getName());
                                     
                    m.addAttribute("name",n);
                    m.addAttribute("user",x);
                    m.addAttribute("pass",y);
                    return "user/user_home";
                }
                else{
                    
                    return "login_error";
                }
            }
            else{
                return "login_error";
            }
            
        } catch (Exception e) {
        }
        return "login_error";
        
    }
    
//    register updation in database
    @RequestMapping(value="/done_register" , method=RequestMethod.POST)
    public String registerprocess(
            @RequestParam("name")String n,
            @RequestParam("username")String x,
            @RequestParam("password")String y,
            @RequestParam("age")String age,
            @RequestParam("phone")String p,
            @RequestParam("add")String a,
            Model m
    ){
        try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            PreparedStatement stmt=con.prepareStatement("insert into USERS values(?,?,?,?,?,?)");  
            
            stmt.setString(1, n);
            stmt.setString(2, x);
            stmt.setString(3,y);//1 specifies the first parameter in the query  
            stmt.setString(4,a);//1 specifies the first parameter in the query  
            stmt.setString(5,p);//1 specifies the first parameter in the query  
            stmt.setString(6,age);//1 specifies the first parameter in the query  
            
            stmt.executeUpdate();
        } catch (Exception e) {
        }
        
        return "start";
    }
    
    
    
    
    
    
//    Admin page --> DASHBOARD
    
    @RequestMapping(value = "admin_dashboard" ,method = RequestMethod.GET)
    public String admindashboard(){
        return "admin/admin_home";
    }
    
    @RequestMapping("/edit_request")
    public String editrequest(){
        return "admin/edit_requests";
    }
    
    
//    ====>> ADD CRIMINALS 
    
//    giving paths of class attributes to store data --> GET METHOD
    @RequestMapping(value="/Add-criminals", method = RequestMethod.GET )
    public String addCriminals(
            Map<String, Object> ob1
    ){
        System.out.println("Add criminals page !");
        new_criminals nc = new new_criminals();  
        System.out.println("in new criminal add page");
       ob1.put("criminal1", nc);
        return "admin/add_criminals";
    }
    
//    Add data to database --> POST METHOD
    @RequestMapping(value = "process_added_criminal", method = RequestMethod.POST)
    public String proccessaddcriminal(
            @ModelAttribute("nc") new_criminals criminal1,
            Map<String, Object> model
    ) {
         
        // implement your own registration logic here...
         System.out.println("again hello");
        // for testing purpose:
        System.out.println("fn: " + criminal1.getFirstname());
        System.out.println("ln: " + criminal1.getLastname());
        System.out.println("add: " + criminal1.getAddress());
        System.out.println("ctype: " + criminal1.getCrimeType());
        System.out.println("vfn: " + criminal1.getVictim_first_name());
        System.out.println("vln: " + criminal1.getVictim_last_name());
        System.out.println("cd: " + criminal1.getCrimedate());
        System.out.println("cs: " + criminal1.getCriminal_Status());
        System.out.println("pd: " + criminal1.getPunishment_duration());
         
        
        try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            PreparedStatement stmt1=con.prepareStatement("SELECT * FROM CRIMINALSDATA ORDER BY ID DESC LIMIT 1");  
            int n = 0;
           ResultSet rs = stmt1.executeQuery();
            while (rs.next()) {
                
                n=rs.getInt("ID");
            }
            int j=n+1;
            PreparedStatement stmt=con.prepareStatement("INSERT INTO CRIMINALSDATA VALUES(?,?,?,?,?,?,?,?,?,?)");  
            
            String a=criminal1.getFirstname();
            String b=criminal1.getLastname();
            String c=criminal1.getAddress();
            String d=criminal1.getCrimeType();
            String e=criminal1.getVictim_first_name();
            String f=criminal1.getVictim_last_name();
            String g=criminal1.getCrimedate();
            String h=criminal1.getCriminal_Status();
            String i=criminal1.getPunishment_duration();
                        
           stmt.setString(1, a);
            stmt.setString(2, b);
            stmt.setString(3,c);//1 specifies the first parameter in the query  
            stmt.setString(4,d);//1 specifies the first parameter in the query  
            stmt.setString(5,e);//1 specifies the first parameter in the query  
            System.out.println("between");
            stmt.setString(6,f);//1 specifies the first parameter in the query  
            stmt.setString(7,g);//1 specifies the first parameter in the query  
            stmt.setString(8,h);//1 specifies the first parameter in the query  
            stmt.setString(9,i);//1 spe
            stmt.setInt(10,j);
            System.out.println("adding in database on the way again");
            
            stmt.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        
        
        return "admin/admin_home";
    } 
    
    @RequestMapping(value="/View-Edit-criminals")
    public String viewEditCriminals(
//            
//        @ModelAttribute("nc") new_criminals cp
//            Class_Name obj[ ]= new Class_Name[Array_Length];
            Model ob2
    ){
        ob2.addAttribute("yash","hello");

         return "admin/view_edit_criminals";
    }
    
    @RequestMapping(value = "/criminal_delete",method = RequestMethod.POST)
    public String criminal_delete(
            @RequestParam("id")int n
    ){
        System.out.println("delete criminal of id "+n);
         try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");
            
            PreparedStatement stmt1=con.prepareStatement("DELETE FROM CRIMINALSDATA WHERE ID=?");  
          
           stmt1.setInt(1,n);
                  
            
            stmt1.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        return "admin/view_edit_criminals";
    }    
    
    @RequestMapping(value = "/criminal_update",method = RequestMethod.POST)
    public String updatecriminal(
            Map<String, Object> ob1,
            @RequestParam("id")int n,
            Model m
    ){
        System.out.println("Add criminals page !");
        new_criminals nc = new new_criminals();  
        System.out.println("in new criminal add page");
       ob1.put("criminal1", nc);
       int j=n;
       m.addAttribute("id",j);
        return "admin/update_criminals";
    }
    
    @RequestMapping(value = "process_updated_criminal", method = RequestMethod.POST)
    public String process_updated_criminal(
            @ModelAttribute("nc") new_criminals criminal1,
            Map<String, Object> model,
            @RequestParam("id")int n
    ) {
         
        // implement your own registration logic here...
         System.out.println("again hello");
        // for testing purpose:
        System.out.println("fn: " + criminal1.getFirstname());
        System.out.println("ln: " + criminal1.getLastname());
        System.out.println("add: " + criminal1.getAddress());
        System.out.println("ctype: " + criminal1.getCrimeType());
        System.out.println("vfn: " + criminal1.getVictim_first_name());
        System.out.println("vln: " + criminal1.getVictim_last_name());
        System.out.println("cd: " + criminal1.getCrimedate());
        System.out.println("cs: " + criminal1.getCriminal_Status());
        System.out.println("pd: " + criminal1.getPunishment_duration());
         
        
        try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            
            PreparedStatement stmt=con.prepareStatement("UPDATE CRIMINALSDATA SET FNAME=?,LNAME=?,ADDRESS=?,CRIME_TYPE=?,VICTIM_FNAME=?,VICTIM_LNAME=?,CRIME_DATE=?,STATUS=?,PUNISHDURATION=? WHERE ID=?");  
            
            String a=criminal1.getFirstname();
            String b=criminal1.getLastname();
            String c=criminal1.getAddress();
            String d=criminal1.getCrimeType();
            String e=criminal1.getVictim_first_name();
            String f=criminal1.getVictim_last_name();
            String g=criminal1.getCrimedate();
            String h=criminal1.getCriminal_Status();
            String i=criminal1.getPunishment_duration();
                        
           stmt.setString(1, a);
            stmt.setString(2, b);
            stmt.setString(3,c);//1 specifies the first parameter in the query  
            stmt.setString(4,d);//1 specifies the first parameter in the query  
            stmt.setString(5,e);//1 specifies the first parameter in the query  
            System.out.println("between");
            stmt.setString(6,f);//1 specifies the first parameter in the query  
            stmt.setString(7,g);//1 specifies the first parameter in the query  
            stmt.setString(8,h);//1 specifies the first parameter in the query  
            stmt.setString(9,i);//1 spe
            stmt.setInt(10,n);
            System.out.println("adding in database on the way again");
            
            stmt.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        
        
        return "admin/view_edit_criminals";
    }
    
    
    
//    ADD SPOTS ====>> ADMIN
    
    @RequestMapping(value="/Add-spots")
    public String addSpots(
        Map<String, Object> ob1
    ){
        System.out.println("add_spots !");
        new_spots nc = new new_spots();  
        System.out.println("in new criminal add page");
       ob1.put("spot1", nc);
        return "admin/add_spots";
    }
    
    @RequestMapping(value = "process_added_spot", method = RequestMethod.POST)
    public String proccessaddspot(
            @ModelAttribute("nc") new_spots spot1,
            Map<String, Object> model
    ) {
         
        // implement your own registration logic here...
         System.out.println("again hello");
        // for testing purpose:
        System.out.println("fn: " + spot1.getState());
        System.out.println("ln: " + spot1.getCity());
        System.out.println("area: " + spot1.getArea());
        System.out.println("add: " + spot1.getAddress());
        System.out.println("ctype: " + spot1.getCrimeType());
        System.out.println("vfn: " + spot1.getC_first_name());
        System.out.println("vln: " + spot1.getC_last_name());
        System.out.println("cd: " + spot1.getCrimedate());
        System.out.println("cs: " + spot1.getCriminal_Status());
        System.out.println("pd: " + spot1.getPunishment_duration());
         
        
        try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            PreparedStatement stmt1=con.prepareStatement("SELECT * FROM CRIMESPOTS ORDER BY ID DESC LIMIT 1");  
            int n = 0;
           ResultSet rs = stmt1.executeQuery();
            while (rs.next()) {
                
                n=rs.getInt("ID");
            }
            int u=n+1;
            PreparedStatement stmt=con.prepareStatement("INSERT INTO CRIMESPOTS VALUES(?,?,?,?,?,?,?,?,?,?,?)");  
            
            String a=spot1.getState();
            String b=spot1.getCity();
            String c=spot1.getArea();
            String d=spot1.getAddress();
            String e=spot1.getCrimeType();
            String f=spot1.getC_first_name();
            String g=spot1.getC_last_name();
            String h=spot1.getCrimedate();
            String i=spot1.getCriminal_Status();
            String j=spot1.getPunishment_duration();
                        
           stmt.setString(1, a);
            stmt.setString(2, b);
            stmt.setString(3,c);//1 specifies the first parameter in the query  
            stmt.setString(4,d);//1 specifies the first parameter in the query  
            stmt.setString(5,e);//1 specifies the first parameter in the query  
            System.out.println("between");
            stmt.setString(6,f);//1 specifies the first parameter in the query  
            stmt.setString(7,g);//1 specifies the first parameter in the query  
            stmt.setString(8,h);//1 specifies the first parameter in the query  
            stmt.setString(9,i);//1 spe
            stmt.setString(10,j);//1 spe
            stmt.setInt(11,u);
            System.out.println("adding in database on the way again");
            
            stmt.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        
        
        return "admin/admin_home";
    } 
    
    
    @RequestMapping(value="/View-Edit-spots" )
    public String viewEditSpots(){
        System.out.println("View Edit Spots page !");
        return "admin/view_edit_spots";
    }
    
    @RequestMapping(value = "/spot_delete" ,method = RequestMethod.POST)
    public String spotdelete(
        @RequestParam("id")int n
    ){
      
                System.out.println("delete criminal of id "+n);
         try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");
            
            PreparedStatement stmt1=con.prepareStatement("DELETE FROM CRIMESPOTS WHERE ID=?");  
          
           stmt1.setInt(1,n);
                  
            
            stmt1.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        return "admin/view_edit_spots";
    }
    
    @RequestMapping(value = "/spot_update",method = RequestMethod.POST)
    public String updatespot(
            Map<String, Object> ob1,
            @RequestParam("id")int n,
            Model m
    ){
        System.out.println("Add spot page !");
        new_spots nc = new new_spots();  
        System.out.println("in new spot add page");
       ob1.put("spot1", nc);
       int j=n;
       m.addAttribute("id",j);
        return "admin/update_spot";
    }
    
    @RequestMapping(value = "process_updated_spot", method = RequestMethod.POST)
    public String process_updated_spot(
            @ModelAttribute("nc") new_spots spot1,
            Map<String, Object> model,
            @RequestParam("id")int n
    ) {
         
        // implement your own registration logic here...
         System.out.println("again hello");
        // for testing purpose:
            System.out.println("fn: " + spot1.getState());
        System.out.println("ln: " + spot1.getCity());
        System.out.println("area: " + spot1.getArea());
        System.out.println("add: " + spot1.getAddress());
        System.out.println("ctype: " + spot1.getCrimeType());
        System.out.println("vfn: " + spot1.getC_first_name());
        System.out.println("vln: " + spot1.getC_last_name());
        System.out.println("cd: " + spot1.getCrimedate());
        System.out.println("cs: " + spot1.getCriminal_Status());
        System.out.println("pd: " + spot1.getPunishment_duration());
         
        
        try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            
            PreparedStatement stmt=con.prepareStatement("UPDATE CRIMESPOTS SET STATE=?,CITY=?,AREA=?,ADDRESS=?,TYPE=?,CNAME=?,LNAME=?,DATE=?,STATUS=?,PUNISH=? WHERE ID=?");  
            
           String a=spot1.getState();
            String b=spot1.getCity();
            String c=spot1.getArea();
            String d=spot1.getAddress();
            String e=spot1.getCrimeType();
            String f=spot1.getC_first_name();
            String g=spot1.getC_last_name();
            String h=spot1.getCrimedate();
            String i=spot1.getCriminal_Status();
            String j=spot1.getPunishment_duration();
                        
           stmt.setString(1, a);
            stmt.setString(2, b);
            stmt.setString(3,c);//1 specifies the first parameter in the query  
            stmt.setString(4,d);//1 specifies the first parameter in the query  
            stmt.setString(5,e);//1 specifies the first parameter in the query  
            System.out.println("between");
            stmt.setString(6,f);//1 specifies the first parameter in the query  
            stmt.setString(7,g);//1 specifies the first parameter in the query  
            stmt.setString(8,h);//1 specifies the first parameter in the query  
            stmt.setString(9,i);//1 spe
            stmt.setString(10,j);//1 spe
            stmt.setInt(11,n);
            System.out.println("adding in database on the way again");
            
            stmt.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        
        
        return "admin/view_edit_spots";
    }
    
    
    
    
//    USER  ===> DASHBOARD
        
    @RequestMapping(value = "user_dashboard" ,method = RequestMethod.GET)
    public String userdashboard( Model m){
        System.out.println("name is "+us.name);
        m.addAttribute("name",us.name);
        m.addAttribute("user",us.username);
        m.addAttribute("pass",us.password);
        return "user/user_home";
    }
    
    
    
//    VIEW CRIMINALS N OPERATIONS
    
    @RequestMapping("/view_criminal")
    public String usercriminalview(Model m){
        m.addAttribute("name",us.name);
        return "user/view_criminals";
    }
    
    @RequestMapping("/file-complains")
    public String addrequest(Model m){
        System.out.println("name is "+us.name);
         m.addAttribute("name",us.name);
                    m.addAttribute("user",us.username);
                    m.addAttribute("pass",us.password);
        return "user/file_complains";
    }
    
    @RequestMapping("/view-complains")
    public String viewrequest(Model m){
        m.addAttribute("name",us.name);
                    m.addAttribute("user",us.username);
                    m.addAttribute("pass",us.password);
        return "user/view_complains";
    }
    
    @RequestMapping(value="/added_complain", method = RequestMethod.POST)
    public String processcomplain(
            @ModelAttribute("nc") requests criminal1,
            Map<String, Object> model,
            Model m
    ){
         System.out.println("again hello");
        // for testing purpose:
        System.out.println("fn: " + criminal1.getFirstname());
        System.out.println("ln: " + criminal1.getLastname());
        System.out.println("add: " + criminal1.getAddress());
        System.out.println("ctype: " + criminal1.getCrimeType());
        System.out.println("vfn: " + criminal1.getVictim_first_name());
        System.out.println("vln: " + criminal1.getVictim_last_name());
        System.out.println("cd: " + criminal1.getCrimedate());
        System.out.println("cs: " + criminal1.getCriminal_Status());
        System.out.println("pd: " + criminal1.getPunishment_duration());
         m.addAttribute("name",us.name);
                    m.addAttribute("user",us.username);
                    m.addAttribute("pass",us.password);
        
        try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            PreparedStatement stmt1=con.prepareStatement("SELECT * FROM CRIMINALSREQUEST ORDER BY ID DESC LIMIT 1");  
            int n = 0;
           ResultSet rs = stmt1.executeQuery();
            while (rs.next()) {
                
                n=rs.getInt("ID");
            }
            int u=n+1;
            
            PreparedStatement stmt=con.prepareStatement("INSERT INTO CRIMINALSREQUEST VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");  
            
            String a=criminal1.getFirstname();
            String b=criminal1.getLastname();
            String c=criminal1.getAddress();
            String d=criminal1.getCrimeType();
            String e=criminal1.getVictim_first_name();
            String f=criminal1.getVictim_last_name();
            String g=criminal1.getCrimedate();
            String h=criminal1.getCriminal_Status();
            String i=criminal1.getPunishment_duration();
                        
           stmt.setString(1, a);
            stmt.setString(2, b);
            stmt.setString(3,c);//1 specifies the first parameter in the query  
            stmt.setString(4,d);//1 specifies the first parameter in the query  
            stmt.setString(5,e);//1 specifies the first parameter in the query  
            System.out.println("between");
            stmt.setString(6,f);//1 specifies the first parameter in the query  
            stmt.setString(7,g);//1 specifies the first parameter in the query  
            stmt.setString(8,h);//1 specifies the first parameter in the query  
            stmt.setString(9,i);//1 spe
            stmt.setString(10,"IN-PROCESS");//1 spe
            stmt.setString(11,us.username);//1 spe
            stmt.setInt(12,u);//1 spe
            
            System.out.println("adding in database on the way again");
            m.addAttribute("name",us.getName());
            stmt.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        
        
        return "user/user_home";
    }
    
    @RequestMapping(value = "u_req_del",method = RequestMethod.POST)
    public String u_req_del(
            Model m,
            @RequestParam("id")String n
    ){
        m.addAttribute("name",us.name);
                    m.addAttribute("user",us.username);
                    m.addAttribute("pass",us.password);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            PreparedStatement stmt1=con.prepareStatement("DELETE FROM CRIMINALSREQUEST WHERE ID=?;");  
            stmt1.setString(1,n);
            stmt1.executeUpdate();
        } catch (Exception e) {
        }
        return "user/view_complains";
    }
    
    @RequestMapping("/View-spots")
    public String userspotsview(Model m)
    {
         m.addAttribute("name",us.name);
        return "user/view_spots";
    }
    
    @RequestMapping(value = "/u_req_up",method = RequestMethod.POST)
    public String u_req_up(
            Map<String, Object> ob1,
            @RequestParam("id")int n,
            Model m
    ){
        System.out.println("Add spot page !");
        requests nc = new requests();  
        System.out.println("in new spot add page");
       ob1.put("req1", nc);
       int j=n;
       m.addAttribute("id",j);
       m.addAttribute("name",us.name);
                    m.addAttribute("user",us.username);
                    m.addAttribute("pass",us.password);
        System.out.println("id is 1 "+n);
        return "user/update_req";
    }
    
    @RequestMapping(value = "process_updated_req", method = RequestMethod.POST)
    public String process_updated_req(
            @ModelAttribute("nc") requests criminal1,
            Map<String, Object> model,
            @RequestParam("id")int n,
            Model m
    ) {
         
        // implement your own registration logic here...
         System.out.println("again hello");
        // for testing purpose:
          m.addAttribute("name",us.name);
                    m.addAttribute("user",us.username);
                    m.addAttribute("pass",us.password);
        System.out.println("id is "+n);
        try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            
            PreparedStatement stmt=con.prepareStatement("UPDATE CRIMINALSREQUEST SET FNAME=?,LNAME=?,ADDRESS=?,CRIME_TYPE=?,VICTIM_FNAME=?,VICTIM_LNAME=?,CRIME_DATE=?,STATUS=?,PUNISHDURATION=? WHERE ID=? ;");  
            
           String a=criminal1.getFirstname();
            String b=criminal1.getLastname();
            String c=criminal1.getAddress();
            String d=criminal1.getCrimeType();
            String e=criminal1.getVictim_first_name();
            String f=criminal1.getVictim_last_name();
            String g=criminal1.getCrimedate();
            String h=criminal1.getCriminal_Status();
            String i=criminal1.getPunishment_duration();
            
            System.out.println(a);
            System.out.println(b);
            System.out.println(c);
            System.out.println(d);
            System.out.println(e);
            
           stmt.setString(1, a);
            stmt.setString(2, b);
            stmt.setString(3,c);//1 specifies the first parameter in the query  
            stmt.setString(4,d);//1 specifies the first parameter in the query  
            stmt.setString(5,e);//1 specifies the first parameter in the query  
            System.out.println("between");
            stmt.setString(6,f);//1 specifies the first parameter in the query  
            stmt.setString(7,g);//1 specifies the first parameter in the query  
            stmt.setString(8,h);//1 specifies the first parameter in the query  
            stmt.setString(9,i);//1 spe
            stmt.setInt(10,n);
            System.out.println("adding in database on the way again");
            
            stmt.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        
        
        return "user/view_complains";
    }
    
    
    
    
    // EDIT REQUESTS
    @RequestMapping(value = "/delete_request" , method = RequestMethod.POST)
    public String delete_request(
            @RequestParam("id")int id,
            Model m
    ){
        System.out.println("dening req");
        m.addAttribute("name",us.name);
                    m.addAttribute("user",us.username);
                    m.addAttribute("username",us.username);
                    m.addAttribute("pass",us.password);
                    System.out.println("name: ");
                    System.out.println("name: ");
        try {
            System.out.println("reached to register proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");
            System.out.println("id is "+id);
            PreparedStatement stmt1=con.prepareStatement("UPDATE CRIMINALSREQUEST SET REQSTATUS='DENIED' WHERE ID=?;"); 
           stmt1.setInt(1,id);            
            stmt1.executeUpdate();
            System.out.println("added in database");
            
            PreparedStatement stmt2=con.prepareStatement("SELECT * FROM CRIMINALSREQUEST WHERE ID=?;"); 
            ResultSet rs = stmt2.executeQuery();
            String p=null,l=null;
            while (rs.next()) {
                p=rs.getString("FNAME");
                l=rs.getString("LNAME");
            }
            System.out.println(p);
            System.out.println(l);
            PreparedStatement stmt3=con.prepareStatement("DELETE FROM CRIMINALSDATA WHERE FNAME=? AND LNAME=?;"); 
            stmt3.setString(1,p);
            stmt3.setString(2,l);
            stmt3.executeUpdate();
            
        } catch (Exception e) {
        }
        
        return "admin/edit_requests";
    }
    
    @RequestMapping(value = "add_request",method = RequestMethod.POST)
    public String add_request(
            @RequestParam("id")int n,
            Model m
    ){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");
            System.out.println("id is "+n);
          
            PreparedStatement stmt3=con.prepareStatement("SELECT * FROM CRIMINALSDATA ORDER BY ID DESC LIMIT 1");  
            int o = 0;
           ResultSet rs3 = stmt3.executeQuery();
            while (rs3.next()) {
                
                o=rs3.getInt("ID");
            }
            int u=o+1;
            
            
            PreparedStatement stmt1=con.prepareStatement("SELECT * FROM CRIMINALSREQUEST WHERE ID =?"); 
            stmt1.setInt(1, n);
            PreparedStatement stmt2=con.prepareStatement("INSERT INTO CRIMINALSDATA VALUES(?,?,?,?,?,?,?,?,?,?)");  
           
            
            ResultSet rs = stmt1.executeQuery();
            int j=0;
            
            while (rs.next()) {
                stmt2.setString(4,rs.getString("CRIME_TYPE")  );
                stmt2.setString(1,rs.getString("FNAME")  );
                stmt2.setString(2,rs.getString("LNAME")  );
                stmt2.setString(8,rs.getString("STATUS")  );
                stmt2.setString(9,rs.getString("PUNISHDURATION")  );
                stmt2.setString(5,rs.getString("VICTIM_FNAME")  );
                stmt2.setString(6,rs.getString("VICTIM_LNAME")  );
                stmt2.setString(7,rs.getString("CRIME_DATE")  );
                stmt2.setString(3,rs.getString("ADDRESS")  );
                stmt2.setInt(10,u  );
                
                j++;
            }
            PreparedStatement stmt4=con.prepareStatement("UPDATE CRIMINALSREQUEST SET REQSTATUS='ACCEPTED' WHERE ID=?;");  
            stmt4.setInt(1,n);
            stmt4.executeUpdate();
            
            stmt2.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        return "admin/edit_requests";
    }
    
    @RequestMapping("add_vcr")
    public String add_vcr(
            Map<String, Object> ob1
    ){
        System.out.println("Add vcr page !");
        Vcr nc = new Vcr();  
        System.out.println("in new vcr add page");
       ob1.put("vcr1", nc);
        return "user/add_vcr";
    }
    
    @RequestMapping(value = "process_added_vcr", method = RequestMethod.POST)
    public String proccessaddvcr(
            @ModelAttribute("nc") Vcr vcr1,
            Map<String, Object> model,
            Model m
    ) {
          m.addAttribute("name",us.name);
                    m.addAttribute("user",us.username);
                    m.addAttribute("username",us.username);
                    m.addAttribute("pass",us.password);
                    System.out.println("name: ");
                    System.out.println("name: ");   
        try {
            System.out.println("reached to vcr proccessing");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?characterEncoding=utf8", "root", "root");

            System.out.println("adding in database");
            
            PreparedStatement stmt1=con.prepareStatement("SELECT * FROM VCR ORDER BY ID DESC LIMIT 1");  
            int n = 0;
           ResultSet rs = stmt1.executeQuery();
            while (rs.next()) {
                
                n=rs.getInt("ID");
            }
            int j=n+1;
            PreparedStatement stmt=con.prepareStatement("INSERT INTO VCR VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");  
            
            String a=vcr1.getType();
            String b=vcr1.getDates();
            String c=vcr1.getTime();
            String d=vcr1.getAddress();
            String e=vcr1.getDetail();
            String f=vcr1.getCinfo();
            String g=vcr1.getFname();
            String h=vcr1.getLname();
            String i=vcr1.getPhone();
            String k=vcr1.getUradd();
                        
           stmt.setString(1, a);
            stmt.setString(2, b);
            stmt.setString(3,c);//1 specifies the first parameter in the query  
            stmt.setString(4,d);//1 specifies the first parameter in the query  
            stmt.setString(5,e);//1 specifies the first parameter in the query  
            System.out.println("between");
            stmt.setString(6,f);//1 specifies the first parameter in the query  
            stmt.setString(7,g);//1 specifies the first parameter in the query  
            stmt.setString(8,h);//1 specifies the first parameter in the query  
            stmt.setString(9,i);//1 spe
            stmt.setString(10,k);//1 spe
            stmt.setString(11,us.username);
            stmt.setInt(12,j);
            System.out.println("adding in database on the way again");
            
            stmt.executeUpdate();
            System.out.println("added in database");
        } catch (Exception e) {
        }
        
        return "user/user_home";
    
    }
}



        
   