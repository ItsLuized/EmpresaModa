/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import conexion.New_Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author egarces
 */
public class modelos extends New_Connection {
    //private final String bdp      = "autenticar";
    
    public modelos() throws Exception {
        

    }
    
    public String[][] getData()
    {
        int i = 1;
        int j = 0;
        String[][] filas = null;
        filas = new String[20][20];
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            String consulta = "SELECT Pdp.NIT_Planta,Pdp.DireccionPlanta,Pdpro.DescripcionProceso \n" +
                                "FROM Planta_de_produccion Pdp INNER JOIN Proceso_de_Produccion Pdpro \n" +
                                "ON Pdp.ID_Planta=Pdpro.ID_Planta";
            ps = getNew_Connection().prepareStatement(consulta);
            rs = ps.executeQuery();
            

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
    
    public static void main(String[] args)
    {
        modelos co;
        try {
            co = new modelos();
            String[][] columnas = co.getData();
            for(int i=1; i<columnas[0].length; i++)
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
            Logger.getLogger(modelos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
