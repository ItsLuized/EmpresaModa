/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conn2;

import Conn2.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Juan
 */
public class CONSULTA extends Conexion{
   
  public boolean autenticacion(String usuario,String contraseña){
    
   PreparedStatement pst = null;
   ResultSet rs = null;
   try{
    
    pst = getConexion().prepareStatement("SELECT * FROM Empleado WHERE Correo LIKE ? AND Contraseña LIKE ?");
    pst.setString (1,usuario);
    pst.setString (2,contraseña);
    rs = pst.executeQuery();
              
            if(rs.absolute(1))
            {
              return true;
            }
       } catch(Exception e)  {
        System.err.println("Error"+e);
       }finally
       {
         try{
             if(getConexion() != null) getConexion().close();
             if(pst != null) pst.close();
             if(rs != null) rs.close();
         } catch (Exception e){
           System.err.println("Error"+e);  
         }
       }
   return false;
  }
 /*
   public static void main(String[] args){
     CONSULTA co = new CONSULTA();
     System.out.println(co.autenticacion("juanperez@parfait.com", "00000"));
 }
*/
}
