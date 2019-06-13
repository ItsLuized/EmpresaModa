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
public class MP extends New_Connection {
    //private final String bdp      = "autenticar";
    
    public MP() throws Exception {
        

    }
    
    public String[][] getData()
    {
        int i = 1;
        String[][] filas = null;
       // filas = new String[20][20];
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            String consulta = "SELECT MP.NombreLoteMP,TMP.NombreTipoMP,B.DescripcionBodega,Pro.NombreProveedor\n" +
"                                FROM lote_materia_prima MP LEFT OUTER JOIN Compra Co\n" +
"                                ON MP.ID_Lote_MP = Co.ID_Lote_MP\n" +
"                                LEFT OUTER JOIN tipo_materia_prima tmp\n" +
"                                ON MP.ID_Tipo_MP = tmp.ID_Tipo_MP\n" +
"                                LEFT OUTER JOIN Bodega B\n" +
"                                ON B.ID_Bodega = MP.ID_Bodega\n" +
"                                LEFT OUTER JOIN Proveedor pro\n" +
"                                ON pro.ID_Proveedor = Co.ID_Proveedor\n" +
"                                ORDER BY MP.NombreLoteMp;";
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
                filas[i][3] = rs.getString(4);
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
        MP co;
        try {
            co = new MP();
            String[][] columnas = co.getData();
            for(int i=1; i<=columnas[0].length; i++)
            {
                System.out.println(columnas[i][3]);
            }
           /*ArrayList niv = co.columnasGrafico("panel_ordenado", "pp", "agenda");
            Iterator it = niv.iterator();
            while(it.hasNext())
            {
                System.out.println(it.next());
            }*/
        } catch (Exception ex) {
            Logger.getLogger(MP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
