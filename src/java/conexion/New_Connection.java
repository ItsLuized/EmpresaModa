/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Luis Martinez
 * @author Sebastian Giraldo
 * @author Mateo Bravo
 * @author Juan Sebastian Obando
 */
public class New_Connection 
{
    private String   usuario        = "root";
    private String   password       = "SQLroot1911";
    private String   servidor       = "localhost";
    private int      puerto         = 3306;
    private String   basedatos      = "empresamoda";
    private String   classname      = "com.mysql.jdbc.Driver";   
    private String   url            = "jdbc:mysql://"+servidor+":"+puerto+"/"+basedatos+"?useSSL=false";
    private Connection con;
    
    public New_Connection()
    {
        try {
            Class.forName(classname);
            con = DriverManager.getConnection(url,usuario,password);
        }
        catch(ClassNotFoundException | SQLException e) {
            System.err.println("Error Conexion = "+e);
        }
    }
    
    public Connection getNew_Connection()
    {
        return con;
    }
    
    public static void main(String[] args)
    {
        //Connection_bd con = new Connection_bd();
        //System.out.println(con);
    }
}