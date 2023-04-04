/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author olasa
 */
@WebServlet(urlPatterns = {"/addRoom"})
public class addRoom extends HttpServlet {

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
                String rType = request.getParameter("rType");
                String airCInfo = request.getParameter("airCInfo");
                String wifiInfo = request.getParameter("wifiInfo");
                String TVInfo = request.getParameter("TVInfo");
                String bInfo = request.getParameter("bInfo");
                String coffeInfo = request.getParameter("coffeInfo");
                String bathInfo = request.getParameter("bathInfo");
                 String kInfo = request.getParameter("kInfo");
                String rPhoto = request.getParameter("rPhoto");
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                String id = request.getSession().getAttribute("session_ID").toString();
                RS = Stmt.executeQuery("SELECT * FROM user where userID='"+id+"'");
                out.print(id);
                if(RS.next()){
                String hotel_name =  RS.getString(("hotel_name"));
                out.print(hotel_name);
                RS = Stmt.executeQuery("SELECT * FROM hotel where hotelName LIKE '"+"%"+hotel_name+"%"+"'");
                if(RS.next()){
                    String hotelID = RS.getString("hotelID");
                    out.print(hotelID);
                    RS = Stmt.executeQuery("SELECT * FROM room where hotelID ='"+hotelID+"'");
                    if(RS.next()){
                        String line3 = "INSERT INTO room(isAvailable,roomType,AirCond,WIFI,TV,Balcony,CoffeMachine,PrivBath,Kitchen,roomPic,hotelID) VALUES("
                        + "'" + "1" + "',"
                        + "'" + rType + "',"
                        + "'" + airCInfo + "',"
                        + "'" + wifiInfo + "',"
                        + "'" + TVInfo + "',"
                        + "'" + bInfo + "',"
                        + "'" + coffeInfo + "',"
                        + "'" + bathInfo + "',"
                        + "'" + kInfo + "',"  
                        + "'" + rPhoto + "',"        
                        + "'" + hotelID + "')";
                        int Rows3 = Stmt.executeUpdate(line3);                        
                 }   
                    out.print("Your room added successfully!");
                }         
             }    
                Stmt.close();
                RS.close();
                Con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
                out.print("can't add your room");
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
