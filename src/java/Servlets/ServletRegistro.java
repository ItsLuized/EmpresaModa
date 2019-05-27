/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Insert;

/**
 *
 * @author sgira
 */
@WebServlet(name = "ServletRegistro", urlPatterns = {"/ServletRegistro"})
public class ServletRegistro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String Nombre = request.getParameter("Nombre");
        int Precio = Integer.parseInt(request.getParameter("Costo"));
        int ID_TipoMP = Integer.parseInt(request.getParameter("ID_TipoMP"));
        int IDBodega = Integer.parseInt(request.getParameter("ID_Bodega"));
        int IDProceso = Integer.parseInt(request.getParameter("IDProceso"));
        int IDProveedor = Integer.parseInt(request.getParameter("IDProveedor"));
        int IDEmpleado = Integer.parseInt(request.getParameter("IDEmpleado"));
        System.out.println("Datos Previos al procesamiento: \n" +
                            "Nombre: "+Nombre + "\n" +
                            "Precio: "+Precio + "\n" +
                            "Nombre_TipoMP: "+ID_TipoMP + "\n" +
                            "IDBodega: "+IDBodega + "\n" +
                            "DescProceso: "+IDProceso + "\n" +
                            "NombreProveedor: "+IDProveedor+ "\n"+
                            "NombreEmpleado: "+IDEmpleado);
    
        Insert registroMateriaPrima= new Insert();
        registroMateriaPrima.insertarMateriaPrima(Nombre, Precio, ID_TipoMP, IDBodega, IDProceso, IDProveedor, IDEmpleado);
        
        response.sendRedirect("MateriaPrima.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
   
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Insercion de datos.";
    }// </editor-fold>

}
