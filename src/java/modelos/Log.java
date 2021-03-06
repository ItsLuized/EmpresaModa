/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import conexion.New_Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author egarces
 */
public class Log extends New_Connection {
    //private final String bdp      = "autenticar";
    
    public Log() {        

    }
    
    public String[][] getData()
    {
        int i = 1;
        int j = 0;
        String[][] filas = null;
       // filas = new String[20][20];
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            String consulta = "SELECT E.NombreEmpleado,E.ApellidoEmpleado,E.DireccionEmpleado\n" +
                                "FROM Empleado E";
            ps = getNew_Connection().prepareStatement(consulta);
            rs = ps.executeQuery();

            int fil = 1;
            while (rs.next()) 
            {
              fil++; //Con esto encuentro el número de filas
            }
            int col= rs.getMetaData().getColumnCount(); //Este me halla el número de columnas
            
           rs.beforeFirst(); //Con este devuelvo el resultSet a la posición original para poder usar
                             //rs.next() denuevo
            
          // System.out.println(fil+" "+col);
            
          filas = new String[fil][col];

            while (rs.next()) 
            {
                filas[i][0] = rs.getString(1);
                filas[i][1] = rs.getString(2);
                filas[i][2] = rs.getString(3);
                i++;
            }
        }
        catch(SQLException ex){
            filas[0][0] = "";
        }
        finally 
        {
            try{
                if(ps != null) ps.close();
                if(rs != null) rs.close();
            }
            catch(SQLException ex) {
                filas[0][0] = "";
            }
        }
        return filas;
    }
    
    public String validarCredenciales(String correo, String clave){
        String claveEnRegistro = "";
        Connection con = getNew_Connection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String queryClave = "SELECT Contraseña FROM Empleado E\n"
                + " WHERE Correo LIKE " + "'"+correo+"';";
        
        System.out.println(queryClave);
        try{
            ps = con.prepareStatement(queryClave);
            rs = ps.executeQuery();
            
            rs.next();
            claveEnRegistro = rs.getString(1);
            
            rs.close();
            ps.close();
            
        }catch(Exception e){
            System.out.println("Hubo un error consultando las credenciales en la base de datos "+e);
        }
        
        return claveEnRegistro;
    }
    
    
    
    public static void main(String[] args)
    {
        Log co;
        try {
            co = new Log();
            String[][] columnas = co.getData();
            for(int i=1; i<columnas.length; i++)
            {
                System.out.println(columnas[i][1]);
            }
           /*ArrayList niv = co.columnasGrafico("panel_ordenado", "pp", "agenda");
            Iterator it = niv.iterator();
            while(it.hasNext())
            {
                System.out.println(it.next());
            }*/
        } catch (Exception ex) {
            Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
