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
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

/**
 *
 * @author olasa
 */
@WebServlet(urlPatterns = {"/reserve"})
public class reserve extends HttpServlet {

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
                String user_name = request.getParameter("name");
                String checkin = request.getParameter("checkin");
                String checkout = request.getParameter("checkout");
                LocalDate dateBefore = LocalDate.parse(checkin);
                LocalDate dateAfter = LocalDate.parse(checkout);
                long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);
                String guestNum = request.getParameter("guest");
                String user_id = request.getSession().getAttribute("session_ID").toString();
                String hotel_id = request.getSession().getAttribute("session_hotelID").toString();
                String hotel_name = request.getSession().getAttribute("session_hotelName").toString();
                String roomID = request.getSession().getAttribute("session_roomID").toString();
                String price = request.getSession().getAttribute("session_hotelPrice").toString();
                String reservationPrice  = String.valueOf(Long.parseLong(price) * noOfDaysBetween);
                Con = DriverManager.getConnection(url, user, password);                
                Stmt = Con.createStatement();               
                String line3 = "INSERT INTO reservation(hotelID,userID,checkInDate,checkoutDate,guestNum,userName,hotelName,roomID,price) VALUES("
                        + "'" + hotel_id + "',"
                        + "'" + user_id + "',"
                        + "'" + checkin + "',"
                        + "'" + checkout + "',"
                        + "'" + guestNum + "',"
                        + "'" + user_name + "',"
                        + "'" + hotel_name + "',"
                        + "'" + roomID + "',"
                        + "'" + reservationPrice + "')";
                int Rows3 = Stmt.executeUpdate(line3);
                String roomAvailable = "0";
                String line2 = "update room set isAvailable='"+roomAvailable+"' where roomID='"+roomID+"' and hotelID='"+hotel_id+"'";
                int Rows2 = Stmt.executeUpdate(line2);                
               // out.print("your Reservation is added successfully!");
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('your Reservation is added successfully!');"); 
                out.println("window.location.href = \"homepage.jsp\";");
                out.println("</script>"); 
                //response.sendRedirect("viewReservation.jsp");
                Stmt.close();
                Con.close();                
            } catch (Exception ex) {
                out.print("can't make your reservation");
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
