/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conn;

import Servlets.Iniciar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Juan
 */
public class Consultas{
    static ConeccionMySQL connMySQL = new ConeccionMySQL();
    static PreparedStatement ps = null; 
    static int contador = 0;
    
    /**
     *
     * @param Correo
     * @param Contraseña
     * @param args
     * @return 
     * @throws ClassNotFoundException
     * @throws SQLException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
   public boolean autenticacion(String Correo, String Contraseña) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException
   {
       
      try
      {
       Connection conn = connMySQL.setConeccion();
       ps = conn.prepareStatement("SELECT * FROM Empleado WHERE Correo LIKE ? AND Contraseña LIKE ?");
                ps.setString (1,Correo);
                ps.setString (2,Contraseña);
		ResultSet rs = ps.executeQuery();
              
                if(rs.absolute(1))
                {
                  return true;
                }
                else
                {
                    
                }
                rs.close();
                ps.close();
                
      } catch (Exception e)
            {
	      System.err.println("ERRORo: " + e.getMessage());
	    }
            finally 
            {
                
            connMySQL.setCerrarConeccion();
	    }
     return false;
          
   } 
           
    
}
