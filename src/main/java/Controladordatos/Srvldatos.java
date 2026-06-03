/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladordatos;

import Controlador.Controlador;
import Modelo.Persona;
import ModeloDAO.PersonaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "Srvldatos", urlPatterns = {"/Srvldatos"})
public class Srvldatos extends HttpServlet {

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
        PrintWriter out = response.getWriter();

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
        PrintWriter out = response.getWriter();
        Consultas op = new Consultas();
        HttpSession sesion = request.getSession();
        Controlador con=new Controlador();
        try {
        String em =request.getParameter("email");
        String pass = con.cifradoCesar(request.getParameter("password"));
        String m;
        String l;
        String i;
        if (op.Login(em, pass) == 1) {             
                sesion.setAttribute("nivel", "1");
                sesion.setAttribute("usuarioSesion", em);
                sesion.setAttribute("citas", 0);
                i="success";
                m="Sesión Iniciada";
                l="index.jsp";
            } else if (op.Login(em, pass) == 2) {
                m="Sesión Iniciada como médico";
                l="Medico.jsp";
                i="success";
                sesion.setAttribute("nivel", "2");
                sesion.setAttribute("usuarioSesion", em);
            } else if (op.Login(em, pass) == 3) {
                m="Sesión Iniciada como administrador";
                l="IndAdmin.jsp";
                i="success";
                sesion.setAttribute("nivel", "3");
                sesion.setAttribute("usuarioSesion", em);
            }else{
                m="Correo y/o Contraseña incorrectos";
                l="main.jsp";
                i="error";
            }
            sesion.setAttribute("mensaje",m);
            sesion.setAttribute("link",l);
            sesion.setAttribute("icon",i);
            response.sendRedirect("mensaje.jsp");
        } catch (SQLException ex) {
            // Imprime el error exacto de la base de datos en la consola de NetBeans
            System.err.println("❌ ERROR DE SQL EN LOGIN: " + ex.getMessage());
            ex.printStackTrace(); 
            
            // Redirige a la página principal para no dejar la pantalla en blanco
            sesion.setAttribute("mensaje", "Error de base de datos: " + ex.getMessage());
            sesion.setAttribute("icon", "error");
            sesion.setAttribute("link", "main.jsp");
            response.sendRedirect("mensaje.jsp");
            
        } catch (Exception e) {
            System.err.println("❌ ERROR GENERAL EN LOGIN: " + e.getMessage());
            e.printStackTrace();
            
            sesion.setAttribute("mensaje", "Ocurrió un error inesperado.");
            sesion.setAttribute("icon", "error");
            sesion.setAttribute("link", "main.jsp");
            response.sendRedirect("mensaje.jsp");
        }
    }
}

