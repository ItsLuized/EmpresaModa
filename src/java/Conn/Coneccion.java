package Conn;
import java.sql.*;
import Conn.ConeccionMySQL;
import java.io.*;
import javax.swing.JOptionPane;


public class Coneccion 
{

	static ConeccionMySQL connMySQL = new ConeccionMySQL();
	//static ConeccionSQLServer ConeccionSQLServer = new ConeccionSQLServer();
	static Statement s = null;
	static PreparedStatement ps = null;  	
	static int contador = 0;

	/**
	 * @param args
	 * @throws SQLException
	 */
	public static void main(String[] args) throws SQLException {
        try {
// Recojo la entrada
             int opcion;
             boolean yaCapturo=false;
             do
             {
                  opcion=Integer.parseInt( JOptionPane.showInputDialog("====OPCIONES========\n"+
                                                                "1. Insertar un Cliente \n"+
                                                                "2. Ver todos los clientes \n"+
                                                                "3. Modificar Nacionalidad de Marca \n"+
                                                                "4. Promedio \n"+
                                                                "5. Desviación \n"+
                                                                "6. Mejor dato \n"+
                                                                "7. Peor Dato \n"+
                                                                "0. SALIR \n"
                                                                ));
              switch(opcion)
              {
                case 1:
                InsertarCliente();
                break;
                case 2:
                MostrarClientes();
                break;
                case 3:
                CambioNacionalidadMarca();
                break;
                case 0:
                     JOptionPane.showMessageDialog(null, "CHAO PESCAO...!!!");
                     System.exit(0);
                break;
                default:
                     JOptionPane.showMessageDialog(null, "ESE CASO NO EXISTE...!!!");
                break;    
               }        
             }
             while(opcion!=0);

	    } catch (Exception e)
            {
	      System.err.println("ERROR: " + e.getMessage());
	    }
            finally 
            {
			connMySQL.setCerrarConeccion();
	    }
	}
	
	/**
	 * @param args
	 * @throws SQLException
	 */	
	
	public static void InsertarCliente() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException
	{
	  Connection conn = connMySQL.setConeccion(); 
          JOptionPane.showMessageDialog(null, "Inserte Una Persona");
          int Id=Integer.parseInt(JOptionPane.showInputDialog("Digite el Numero de Identificación:"));
          String Nombre=JOptionPane.showInputDialog("Digite el Nombre de la persona:");
          String Apellido=JOptionPane.showInputDialog("Digite el Apellido de la persona:");
          int Edad=Integer.parseInt(JOptionPane.showInputDialog("Digite la Edad de la persona:"));
          int IDNacionalidad=Integer.parseInt(JOptionPane.showInputDialog("Digite el código de nacionalidad:"));
              
            System.out.println("INSERTO UNA PERSONA\n");
		ps = conn.prepareStatement("INSERT INTO cliente(ID_Cliente,Nombres,Apellidos,Edad,ID_Nacionalidad) " + 
		   "VALUES (?, ?, ?, ?, ?)");
		ps.setInt (1,Id);
		ps.setString (2,Nombre);
		ps.setString (3,Apellido);
		ps.setInt(4,Edad);
		ps.setInt (5,IDNacionalidad);
		contador = ps.executeUpdate();
		System.out.println(contador + " Persona(s) Insertada(s)\n");               
            ps.close();
            
            System.exit(0);
	}
	
	public static void MostrarClientes() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException
	{
		// Hago la conexi�n
		Connection conn = connMySQL.setConeccion();
		// Creo la Sentencia
		ps = conn.prepareStatement("SELECT * FROM Cliente");
		ResultSet rs = ps.executeQuery();
                while (rs.next()) {
			System.out.println("Identificación = " + rs.getInt(1)
					+ "\n" + "Nombre = " + rs.getString(2) + "\n"
					+ "Apellido = " + rs.getString(3) + "\n"
                                        + "Edad = " + rs.getInt(4) + "\n"
                                        + "Nacionalidad = " + rs.getInt(5) + "\n");
		}             
		rs.close();
		ps.close();

        System.exit(0);
	}
        public static void CambioNacionalidadMarca() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException
	{
            /*
		// Hago la conexi�n
		Connection conn = connMySQL.setConeccion();
		// Creo la Sentencia
                //Le digo al usuario que escriba la marca
                String NewName=JOptionPane.showInputDialog("Digite el Nombre de la marca que desea cambiar:");
		ps = conn.prepareStatement("SELECT COUNT(*) FROM Marca Ma WHERE Ma.Marca = ?");
                ps.setString (1,NewName);
		ResultSet rs = ps.executeQuery();
               
                if(rs.next())
                {
                  System.out.println("Si existe la marca"+" "+NewName);
                }
                else
                {
                  System.out.println("Esa marca no existe");  
                }
            
            */   
            
       Connection conn = connMySQL.setConeccion();
       ps = conn.prepareStatement("SELECT Pdp.NIT_Planta,Pdp.DireccionPlanta,Pdpro.DescripcionProceso "
               + "                FROM Planta_de_produccion Pdp INNER JOIN Proceso_de_Produccion Pdpro "
               + "                ON Pdp.ID_Planta=Pdpro.ID_Planta" );
              
		ResultSet rs = ps.executeQuery();
        while (rs.next()) 
        {
        System.out.println("NIT = " + rs.getString(1)
					+ "\n" + "DIREC = " + rs.getString(2) + "\n"
                                        + "DESCRI = " + rs.getString(3) + "\n");
		
        }	
        rs.close();
        ps.close();
 
        System.exit(0);
	}
}
    