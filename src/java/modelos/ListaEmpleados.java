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
 * @author Luis
 */
public class ListaEmpleados extends New_Connection {
    
    public ListaEmpleados() {        

    }
    
    public String[][] getData()
    {
        int i = 0;
        int j = 0;
        String[][] filas = null;
       // filas = new String[20][20];
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            String consulta = "SELECT E.NombreEmpleado,E.ID_Empleado\n" +
                                "FROM Empleado E";
            ps = getNew_Connection().prepareStatement(consulta);
            rs = ps.executeQuery();

            int fil = 0;
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
       
    
    
    public static void main(String[] args)
    {
        ListaEmpleados le;
        try {
            le = new ListaEmpleados();
            String[][] columnas = le.getData();
            for(int i=1; i<columnas.length; i++)
            {
                System.out.println(columnas[i][1]);
            }
           
        } catch (Exception ex) {
            Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
