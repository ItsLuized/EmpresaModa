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
import modelos.KnowmGraphs;

/**
 *
 * @author Luized
 */
@WebServlet(name = "actualizarGraphs", urlPatterns = {"/actualizarGraphs"})
public class actualizarGraphs extends HttpServlet {

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
        
        response.sendRedirect("Estadisticas.jsp");
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
        return "Short description";
    }// </editor-fold>

}
