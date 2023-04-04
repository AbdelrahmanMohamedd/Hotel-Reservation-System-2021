/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Random;

/**
 *
 * @author olasa
 */
@WebServlet(urlPatterns = {"/updateProfile"})
public class updateProfile extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/hotelsystem";
                String user = "root";
                String password = "root";
                Connection Con = null;
                Statement Stmt = null;
                ResultSet RS = null;
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                String id = request.getSession().getAttribute("session_ID").toString();
                RS = Stmt.executeQuery("SELECT * FROM user where userID='"+id+"'");
                if(RS.next()){
                String user_name =  request.getParameter("username");
                String user_pass =  request.getParameter("pass");
                String user_cPass =  request.getParameter("confpass");
                if(user_name.equals("") || user_pass.equals("")|| user_cPass.equals("")){
                    out.print("Fields cannot be empty!");
                    }
                else if(user_pass.equals(user_cPass)){
                String line2 = "update user set DisplayName='"+user_name+"' , pass='"+user_pass+"' where userID='"+id+"'";
                int Rows2 = Stmt.executeUpdate(line2);
                out.print("your data updated successfully!");
                }
                else{
                    out.print("Password and confirm password must be the same");
                }
             }    
                Stmt.close();
                RS.close();
                Con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
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
