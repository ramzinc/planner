<%--com.dhtmlx.planner and its derivative(javacalendar) are property of dhtmlx  and applied under GPLv3 , for more information please visit http://javaplanner.com/--%>
<!--  2016	Arnold Francis Leslie Mpiima ,Amira Qistina Abu Shahil, Ng Lean Loong, Muhammad Ihsan Muhammad Rawi Ravi, Chong   Chien Yung  -->
<%-- This file is part of SLAMS.

    SLAMS  is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

     SLAMS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SLAMS.  If not, see <http://www.gnu.org/licenses/>. --%>

<%@ page import ="java.sql.*" %>
<%
    try{
        String user = request.getParameter("username");   
        String pass = request.getParameter("password");
        int user_id;
        
        /*connect to the database and create query to check password and username from the database
        and determine each username either a student or a lecturer
        */     
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javacalendar","root","");    
        PreparedStatement pst = conn.prepareStatement("Select username,password,userID from login where username=? and password=? and  role = 'lecturer' ");
        PreparedStatement pst2 = conn.prepareStatement("Select username,password,userID from login where username=? and password=? and role = 'student' ");
        
        pst.setString(1, user);
        pst.setString(2, pass);
        pst2.setString(1,user);
        pst2.setString(2,pass);
        
        ResultSet rs2 = pst2.executeQuery();
        ResultSet rs = pst.executeQuery();                        
        
        /* this if statement will check the user role and redirect either to javaplanner.jsp
        if the user is a lecturer or StudentHomePage.jsp if the user is student. 
        if the username entered is not in the database, they will be redirected to the LoginPage.jsp
        */ 
        if(rs.next()){
           user_id = rs.getInt("userID");
           session.setAttribute("user_id",user_id);
           response.sendRedirect("javacalendar.jsp");}
        else if (rs2.next()){ 
        	response.sendRedirect("StudentHomePage.jsp");
        }
        else {
        	response.sendRedirect("LoginPage.jsp");
         }
        pst.close();
        pst2.close();
    } catch(Exception e){       
       out.println("Something went wrong! Please try again.");       
   }      
%>