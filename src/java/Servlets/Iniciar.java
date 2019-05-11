/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Conn.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Juan
 */
@WebServlet(name = "Iniciar", urlPatterns = {"/Inicio"})
public class Iniciar extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        /*
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Correo = request.getParameter("USER");
        String Contraseña = request.getParameter("pass");
        
  
        Consultas co = new  Consultas();
        co.autenticacion(Correo, Contraseña);
        if(co.autenticacion(Correo, Contraseña))
        {
            response.sendRedirect("tryout.jsp");
        }
        else
        {
            response.sendRedirect("Correct.jsp");  
        }
     */
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
         try {
             processRequest(request, response);
         } catch (ClassNotFoundException ex) {
             Logger.getLogger(Iniciar.class.getName()).log(Level.SEVERE, null, ex);
         } catch (SQLException ex) {
             Logger.getLogger(Iniciar.class.getName()).log(Level.SEVERE, null, ex);
         } catch (InstantiationException ex) {
             Logger.getLogger(Iniciar.class.getName()).log(Level.SEVERE, null, ex);
         } catch (IllegalAccessException ex) {
             Logger.getLogger(Iniciar.class.getName()).log(Level.SEVERE, null, ex);
         }
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
        
        try {
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
             
             String Correo = request.getParameter("USER");
             String Contraseña = request.getParameter("pass");
             
             String u="juanperez@gmail.com";
             String p="00000";
             Consultas co = new  Consultas();
             
             if(co.autenticacion(Correo, Contraseña))
             {
                 //EL PROBLEMA ESTA RADICANDO AQUI JUAN, SI ESTA ENVIANDO LOS PARAMETROS QUE SON PERO
                 //NO ESTA DEVOLVIENDO TRUE AUNQUE LE PONGAS EL CORREO Y LA CONTRASEÑA QUE ES. ESE ES EL PROBLEMA. 
                 response.sendRedirect("tryout.jsp");
             }
             else
             {
                 response.sendRedirect("Correct.jsp");
             }} catch (ClassNotFoundException ex) {
             Logger.getLogger(Iniciar.class.getName()).log(Level.SEVERE, null, ex);
         } catch (SQLException ex) {
             Logger.getLogger(Iniciar.class.getName()).log(Level.SEVERE, null, ex);
         } catch (InstantiationException ex) {
             Logger.getLogger(Iniciar.class.getName()).log(Level.SEVERE, null, ex);
         } catch (IllegalAccessException ex) {
             Logger.getLogger(Iniciar.class.getName()).log(Level.SEVERE, null, ex);
         }
        
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
