/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllspack;

/**
 *
 * @author Yash
 */
public class Edit_criminals {
    public String firstname[];
    private String lastname[];
    private String address[];
    private String crimeType[];
    private String victim_first_name[];
    private String victim_last_name[];
    private String crimedate[];
    private String criminal_Status[];
    private String punishment_duration[];

    public Edit_criminals() {
        firstname=new String [20];
        lastname=new String [20];
        address=new String [20];
        crimeType=new String [20];
        victim_first_name=new String [20];
        victim_last_name=new String [20];
        crimedate=new String [20];
        criminal_Status=new String [20];
        punishment_duration=new String [20];
    }
}
