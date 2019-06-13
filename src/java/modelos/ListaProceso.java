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
public class ListaProceso extends New_Connection {
    //private final String bdp      = "autenticar";
    
    public ListaProceso() throws Exception {
        

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
            String consulta = "SELECT Pro.DescripcionProceso,Pro.ID_Proceso FROM Proceso_de_produccion Pro";
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
                i++;
                //Basicamente, como en el query estoy sacando 3 datos, le digo que en la columna "i"
                //Me ponga el dato 1, luego el 2, y luego el 3. Las columnas dependen del tamaño del query que yo haga
                //Las filas del posible resultado, y como estas estan en constante cambio debido a posibles actualizaciones
                //Entoncees por eso su tamaño va aumentando conforme el rs.next()encuentra una fila
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
        ListaProceso co;
        try {
            co = new ListaProceso();
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
            Logger.getLogger(ListaProceso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
