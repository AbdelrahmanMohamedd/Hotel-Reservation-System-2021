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
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;


/**
 *
 * @author olasa
 */
@WebServlet(urlPatterns = {"/updateReservation"})
public class updateReservation extends HttpServlet {

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
                String update_id = request.getSession().getAttribute("session_updateID").toString();
                String name = request.getParameter("name");
                String checkin = request.getParameter("checkin");
                String checkout = request.getParameter("checkout");
                LocalDate dateBefore = LocalDate.parse(checkin);
                LocalDate dateAfter = LocalDate.parse(checkout);
                long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);
                
                String guest = request.getParameter("guest");
                Con = DriverManager.getConnection(url, user, password);                
                Stmt = Con.createStatement();  
                RS = Stmt.executeQuery("SELECT * FROM reservation where reservationID = '"+ update_id + "'");
                if(RS.next()){
                    String hotelID = RS.getString("hotelID");
                    RS = Stmt.executeQuery("SELECT * FROM hotel where hotelID = '"+ hotelID + "'");
                    if(RS.next()){
                        String price = RS.getString("hotelExpectedPrice");
                        String reservationPrice  = String.valueOf(Long.parseLong(price) * noOfDaysBetween);
                        String line3 = "update reservation set userName='"+name+"', checkInDate='"+checkin+"', checkoutDate='"+checkout+"', guestNum='"+guest+"',price='"+reservationPrice+"' where reservationID='"+update_id+"'";
                        int Rows3 = Stmt.executeUpdate(line3);           
                        out.print("your Reservation is updated successfully!");
                    //response.sendRedirect("viewReservation.jsp");
                    }                   
                }
                else{
                    out.print("Can't update your reservation!");
                }
                RS.close();
                Stmt.close();
                Con.close();                
            } catch (Exception ex) {
                out.print("can't update your reservation");
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
