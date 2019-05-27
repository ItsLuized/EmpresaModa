/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author sgira
 */


import conexion.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class Insert extends New_Connection{
    
    PreparedStatement ps = null;
    PreparedStatement luis = null;
    Connection con = getNew_Connection();
    
    
    public void intentoInsertarMateriaPrima(){
        int ID_Lote = Integer.parseInt(JOptionPane.showInputDialog(null, "Insertar el ID del nuevo lote de materia prima"));
        String Nombre = JOptionPane.showInputDialog(null, "Insertar el nombre del nuevo lote de materia prima");
        int precio = Integer.parseInt(JOptionPane.showInputDialog(null, "Insertar el precio del nuevo lote de materia prima"));
        String Nombre_TipoMateria = JOptionPane.showInputDialog(null, "Insertar el nombre tipo de materia del nuevo lote de materia prima");
        int ID_Bodega = Integer.parseInt(JOptionPane.showInputDialog(null, "Insertar el ID de la bodega del nuevo lote de materia prima"));
        String DescProceso = JOptionPane.showInputDialog(null, "Insertar la descripcion del proceso del nuevo lote de materia prima");
        String NombreProveedor = JOptionPane.showInputDialog(null, "Insertar el nombre del proveedor del nuevo lote de materia prima");
        String NombreEmpleado = JOptionPane.showInputDialog(null, "Insertar el nombre del empleado que lo comprara");
        ResultSet rs = null;
        String InsertSentence = "INSERT INTO Lote_materia_prima (ID_Lote_MP, NombreLoteMP, Precio, ID_Tipo_MP, ID_Bodega, ID_Proceso)"
                + "VALUES(?,?,?,?,?,?);";
        String InsertProv = "INSERT INTO Compra (ID_Proveedor,ID_Lote_MP, ID_Empleado, Fecha_de_Compra)"
                + "VALUES(?, ?, ?, CURDATE());";
         
        try{
            ps = con.prepareStatement(InsertSentence);
            ps.setInt(1, ID_Lote);
            ps.setString(2, Nombre);
            ps.setInt(3, precio);
            
            luis = con.prepareStatement("SELECT ID_Tipo_MP FROM tipo_materia_prima WHERE NombreTipoMP LIKE '" + Nombre_TipoMateria + "';");
            rs = luis.executeQuery();
            if (rs.next()) {
                 ps.setInt(4, rs.getInt(1));
             }
            ps.setInt(5, ID_Bodega);
            luis = con.prepareStatement("SELECT ID_Proceso FROM proceso_de_produccion WHERE DescripcionProceso LIKE '"+DescProceso+"';");
            rs.beforeFirst();
            rs = luis.executeQuery();
            if (rs.next()) {
               ps.setInt(6, rs.getInt(1));  
            }
            
            
            ps.execute();
            
            ps.close();
        }catch(SQLException e){
            System.out.println("hubo un error " + e);
        }
        try{
            ps = con.prepareStatement(InsertProv);
            luis = con.prepareStatement("SELECT ID_Proveedor\n" +
                                        "FROM Proveedor\n" +
                                        "WHERE NombreProveedor LIKE '"+ NombreProveedor +"';");
            
            rs = luis.executeQuery();
            if (rs.next()) {
            ps.setInt(1, rs.getInt(1));
             }
            System.out.println(rs.getInt(1));
                
            ps.setInt(2, ID_Lote);
            System.out.println(ID_Lote);
            rs.beforeFirst();
            luis = con.prepareStatement(" SELECT ID_Empleado FROM empleado WHERE NombreEmpleado LIKE '"+NombreEmpleado+"';");
            rs.beforeFirst();
            rs = luis.executeQuery();
             if (rs.next()) {
                ps.setInt(3, rs.getInt(1)); 
            }
            
            System.out.println(rs.getInt(1));
            
            
            ps.execute();
            
            ps.close();
        }catch(SQLException e){
            System.out.println("hubo un error " + e);
        }
         
        
    }
    
    
    public void insertarMateriaPrima(String Nombre, int precio, int ID_TipoMP, int ID_Bodega, int IDProceso, int IDProveedor, int IDEmpleado) {
        
        ResultSet rs;
        String InsertSentence = "INSERT INTO Lote_materia_prima (ID_Lote_MP, NombreLoteMP, Precio, ID_Tipo_MP, ID_Bodega, ID_Proceso)"
                + "VALUES(?,?,?,?,?,?);";
        String InsertProv = "INSERT INTO Compra (ID_Proveedor,ID_Lote_MP, ID_Empleado, Fecha_de_Compra)"
                + "VALUES(?, ?, ?, CURDATE());";
        int IDMax = 0;
        try {
            luis = con.prepareStatement("SELECT MAX(ID_Lote_MP) FROM Lote_materia_prima;");
            rs = luis.executeQuery();
            if (rs.next()) {
                IDMax = rs.getInt(1);
            }
            IDMax +=1;
        }
        catch (SQLException e) {
            System.out.println("hubo un error " + e);
        }
        
        try{
            ps = con.prepareStatement(InsertSentence);
            ps.setInt(1, IDMax);
            ps.setString(2, Nombre);
            ps.setInt(3, precio);
            ps.setInt(4, ID_TipoMP);
            ps.setInt(5, ID_Bodega);
            ps.setInt(6, IDProceso);
            
            ps.execute();
            
            ps.close();
        }catch(SQLException e){
            System.out.println("hubo un error " + e);
        }
        try{
            ps = con.prepareStatement(InsertProv);
            
            ps.setInt(1, IDProveedor);
            ps.setInt(2, IDMax);
            ps.setInt(3, IDEmpleado);
            
            ps.execute();
            
            ps.close();
        }catch(SQLException e){
            System.out.println("hubo un error " + e);
        }
    }

    public Insert() {
    }
    
    public static void main (String args[]){
        Insert intento = new Insert();
        intento.intentoInsertarMateriaPrima();
    }
}
