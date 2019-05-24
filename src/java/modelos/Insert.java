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
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class Insert extends New_Connection{
    
    PreparedStatement ps = null;
    Connection con = getNew_Connection();
    
    
    public void intentoInsertarMateriaPrima(){
        int ID_Lote = Integer.parseInt(JOptionPane.showInputDialog(null, "Insertar el ID del nuevo lote de materia prima"));
        String Nombre = JOptionPane.showInputDialog(null, "Insertar el nombre del nuevo lote de materia prima");
        int precio = Integer.parseInt(JOptionPane.showInputDialog(null, "Insertar el precio del nuevo lote de materia prima"));
        int ID_TipoMateria = Integer.parseInt(JOptionPane.showInputDialog(null, "Insertar el tipo de materia del nuevo lote de materia prima"));
        int ID_Bodega = Integer.parseInt(JOptionPane.showInputDialog(null, "Insertar el ID de la bodega del nuevo lote de materia prima"));
        int ID_Proceso = Integer.parseInt(JOptionPane.showInputDialog(null, "Insertar el ID del proceso del nuevo lote de materia prima"));
        
        String InsertSentence = "INSERT INTO Lote_materia_prima (ID_Lote_MP, NombreLoteMP, Precio, ID_Tipo_MP, ID_Bodega, ID_Proceso)"
                + "VALUES(?,?,?,?,?,?)";
        
        try{
            ps = con.prepareStatement(InsertSentence);
            
            ps.setInt(1, ID_Lote);
            ps.setString(2, Nombre);
            ps.setInt(3, precio);
            ps.setInt(4, ID_TipoMateria);
            ps.setInt(5, ID_Bodega);
            ps.setInt(6, ID_Proceso);
            
            ps.execute();
            
            ps.close();
        }catch(SQLException e){
            System.out.println("hubo un error " + e);
        }
        
    }
    
    
    public void insertarMateriaPrima(int ID_Lote, String Nombre, int precio, int ID_TipoMateria, int ID_Bodega, int ID_Proceso){
         
        
        String InsertSentence = "INSERT INTO Lote_materia_prima (ID_Lote_MP, NombreLoteMP, Precio, ID_Tipo_MP, ID_Bodega, ID_Proceso)"
                + "VALUES(?,?,?,?,?,?)";
        
        try{
            ps = con.prepareStatement(InsertSentence);
            
            ps.setInt(1, ID_Lote);
            ps.setString(2, Nombre);
            ps.setInt(3, precio);
            ps.setInt(4, ID_TipoMateria);
            ps.setInt(5, ID_Bodega);
            ps.setInt(6, ID_Proceso);
            
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
