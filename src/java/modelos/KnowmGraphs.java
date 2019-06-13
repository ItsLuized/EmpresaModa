/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import conexion.New_Connection;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.knowm.xchart.*;

/**
 *
 * @author sgira
 */
public class KnowmGraphs extends New_Connection {

    public static void main(String[] args) {
        KnowmGraphs graficas = new KnowmGraphs();

        graficas.CreateBarGraphDefinitivo("SELECT CONCAT(NombreEmpleado, ' ', ApellidoEmpleado) Empleado, COUNT(C.ID_Empleado) AS 'Numero de Compras'\n"
                + "FROM Empleado E INNER JOIN Compra C\n"
                + "ON E.ID_Empleado = C.ID_Empleado\n"
                + "GROUP BY E.ID_Empleado;", "EmpleadoNumCompras", "Empleado", "Compras");

        graficas.CreatePieChart("SELECT P.DescripcionBodega"
                + ", (COUNT(L.ID_Bodega)*100 / (SELECT COUNT(ID_Lote_MP) FROM Lote_Materia_Prima))\n"
                + "FROM Bodega P INNER JOIN Lote_Materia_Prima L\n"
                + "ON P.ID_Bodega = L.ID_Bodega\n"
                + "GROUP BY (P.ID_Bodega);", "BodegasPorcentajeLote");

        graficas.CreatePieChart("SELECT CONCAT(NombreEmpleado, ' ', ApellidoEmpleado), (COUNT(ID_Lote_MP)*100 / (SELECT COUNT(ID_Lote_MP) FROM Compra))\n"
                + "FROM Empleado P INNER JOIN Compra C\n"
                + "ON P.ID_Empleado = C.ID_Empleado\n"
                + "GROUP BY (P.ID_Empleado);", "EmpleadoPorcentajeCompras");
    }

    private String[][] resultado;
    private ArrayList<String> empleados = new ArrayList<>();
    private ArrayList<Integer> compras = new ArrayList<>();
    private static String query;
    private ResultSet rs;
    private PreparedStatement ps;
    private CategoryChart graficoBarras;
    private PieChart graficoPastel;

    public KnowmGraphs() {

    }

    public void CreateBarGraphDefinitivo(String query, String titulo, String tituloX, String tituloY) {
        System.out.println("CreateBarGraph corriendo");
        
        File file = new File("E:\\Users\\Usuario\\Documents\\EmpresaModa\\web\\images\\"+titulo+".png"); 
          
        if(file.delete()) 
        { 
            System.out.println("Imagen borrada con exito."); 
        } 
        else
        { 
            System.out.println("No se pudo borrar la imagen."); 
        } 
        
        try {
            ps = getNew_Connection().prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                try {
                    int c = Integer.parseInt(rs.getString(1));
                    compras.add(c);
                    empleados.add(rs.getString(2));

                } catch (NumberFormatException e) {

                    empleados.add(rs.getString(1));
                    int c = Integer.parseInt(rs.getString(2));
                    compras.add(c);
                }
            }

        } catch (Exception e) {
            System.out.println("error creando el grafico de barras" + e);
            return;
        }

        graficoBarras = new CategoryChartBuilder().width(1200).height(800).title(titulo).xAxisTitle(tituloX).yAxisTitle(tituloY).build();

        graficoBarras.addSeries(titulo, empleados, compras, null);

        try {
            BitmapEncoder.saveBitmap(graficoBarras, "E:\\Users\\Usuario\\Documents\\EmpresaModa\\web\\images\\" + titulo + ".png", BitmapEncoder.BitmapFormat.PNG);

        } catch (IOException e) {
            System.out.println("Error guardando la imagen\n" + e);

        }
//        new SwingWrapper<CategoryChart>(graficoBarras).displayChart();

    }

    public void CreatePieChart(String query, String title) {
        graficoPastel = new PieChartBuilder().build();
        String currentDirectory = System.getProperty("user.dir");
        System.out.println("The current working directory is " + currentDirectory);
        File file = new File("E:\\Users\\Usuario\\Documents\\EmpresaModa\\web\\images\\"+title+".png"); 
          
        if(file.delete()) 
        { 
            System.out.println("Imagen borrada con exito."); 
        } 
        else
        { 
            System.out.println("No se pudo borrar la imagen."); 
        } 
        
        try {
            ps = getNew_Connection().prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                try {
                    long a = Long.parseLong(rs.getString(2));
                    String b = rs.getString(1);
                    graficoPastel.addSeries(b, a);

                } catch (NumberFormatException e) {
                    System.out.println("Usando el segundo camino");
                    String b = rs.getString(1);
                    float c = Float.parseFloat(rs.getString(2));
                    graficoPastel.addSeries(b, c);

                }
            }

        } catch (Exception e) {
            System.out.println("error creando el grafico de pastel " + e);
            return;
        }

        try {
            BitmapEncoder.saveBitmap(graficoPastel, "E:\\Users\\Usuario\\Documents\\EmpresaModa\\web/images\\" + title + ".png", BitmapEncoder.BitmapFormat.PNG);
        } catch (IOException e) {
            System.out.println("error guardando el grafico de pastel " + e);
        }

    }

}
