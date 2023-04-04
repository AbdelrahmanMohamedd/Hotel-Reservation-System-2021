/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.SecureRandom;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author olasa
 */
@WebServlet(urlPatterns = {"/AddAccount"})
public class AddAccount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static String generateRandomPassword(int len) {
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < len; i++) {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
        return sb.toString();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String result;

        Connection Con = null;
        Statement Stmt = null;
        ResultSet RS = null;

        try (PrintWriter out = response.getWriter()) {

            String to = request.getParameter("email");
            String user_name = request.getParameter("username");
            String user_type = request.getParameter("type");
            String user_displayName = request.getParameter("name");
            final String subject = "Hotel reservation system temporary password";
            final String temp_pass = generateRandomPassword(10);
            final String from = "hotel.system90@gmail.com";
            final String pass = "hotelSystem@@";
            
         
            /*if(to.equals("")|| user_name.equals("")|| user_type.equals("")|| user_displayName.equals("")){
                out.print("Feilds cannot be empty!");
            }*/
            

            try {
                Properties properties = new Properties();
                properties.put("mail.smtp.auth", "true");
                properties.put("mail.smtp.starttls.enable", "true");
                properties.put("mail.smtp.host", "smtp.gmail.com");
                properties.put("mail.smtp.port", "587");
                Session session = Session.getInstance(properties, new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, pass);
                    }
                });

                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(from));
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(subject);
                message.setText("Please Login with this password " + temp_pass);
                
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/hotelSystem";
                    String user = "root";
                    String password = "root";
                    Con = DriverManager.getConnection(url, user, password);
                    Stmt = Con.createStatement();
                    RS = Stmt.executeQuery("SELECT * FROM user where userEmail='"+to+"'");
                    if(RS.next()){
                        out.print("This email is registered before!");                        
                    }
                    else{
                        RS = Stmt.executeQuery("SELECT * FROM user where userName='"+user_name+"'");
                        if(RS.next()){
                        out.print("Exist user name,user name must be unique!");}
                        else{
                        Transport.send(message); 
                      
                    if (user_type.equals("admin")) {
                        String line = "INSERT INTO user(userEmail,userName,pass,isAdmin,DisplayName,hotel_name) VALUES("
                                + "'" + to + "',"
                                + "'" + user_name + "',"
                                + "'" + temp_pass + "',"
                                + "'" + 1 + "',"
                                + "'" + user_displayName + "',"
                                + "'" +  ""   + "')";
                        int Rows = Stmt.executeUpdate(line);
                    } else if (user_type.equals("user")){
                        String line = "INSERT INTO user(userEmail,userName,pass,isAdmin,DisplayName,hotel_name) VALUES("
                                + "'" + to + "',"
                                + "'" + user_name + "',"
                                + "'" + temp_pass + "',"
                                + "'" + 0 + "',"
                                + "'" + user_displayName +  "',"
                                + "'" +  ""   + "')";
                        int Rows = Stmt.executeUpdate(line);
                    }
                    out.print("Your email created successfully, please check your email to login");
                    }
                        
                    }
                    
                    
                    
                    Stmt.close();
                    Con.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } catch (MessagingException mex) {
                mex.printStackTrace();
                result = "Error: unable to send mail....";
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
