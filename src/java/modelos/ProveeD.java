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
public class ProveeD extends New_Connection {
    //private final String bdp      = "autenticar";
    
    public ProveeD() throws Exception {
        

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
            String consulta = "SELECT Pro.NombreProveedor,Pro.DireccionProveedor,Pro.EmailProveedor,\n" +
                                "MP.NombreLoteMP, MP.Precio, TMP.NombreTipoMP\n" +
                                "FROM Proveedor Pro INNER JOIN Compra C\n" +
                                "ON Pro.ID_Proveedor=C.ID_Proveedor\n" +
                                "INNER JOIN Lote_Materia_Prima MP\n" +
                                "ON MP.ID_Lote_MP=C.ID_Lote_MP\n" +
                                "INNER JOIN Tipo_Materia_Prima TMP\n" +
                                "ON MP.ID_Tipo_MP=TMP.ID_Tipo_MP\n" +
                                "ORDER BY TMP.NombreTipoMP";
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
                filas[i][4] = Integer.toString(rs.getInt(5));
                filas[i][5] = rs.getString(6);
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
        ProveeD co;
        try {
            co = new ProveeD();
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
            Logger.getLogger(ProveeD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}