<!-- 	2016 Arnold Francis Leslie Mpiima ,Amira Qistina Abu Shahil, Ng Lean Loong, Muhammad Ihsan Muhammad Rawi Ravi, Chong   Chien Yung  -->
<!-- This file is part of SLAMS.

    SLAMS  is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

     SLAMS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SLAMS.  If not, see <http://www.gnu.org/licenses/>. -->


<%-- searchvalidate.jsp send a query to the database to check either 
the inserted username is a lecturer. if the username inserted is a lecturer, 
the page will be redirected to the lecturers own calendar view page else
the page will be redirected to the StudentHomePage.jsp
--%>
<%@ page import="java.sql.*"%>
<%
	try {
		int user_id;
		String search = request.getParameter("search");
		
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javacalendar", "root", "");
		PreparedStatement pst = conn.prepareStatement("Select username,userID  from login where username=? and role = 'lecturer' ");
		
		pst.setString(1, search);
		ResultSet rs = pst.executeQuery();
		
		if (rs.next()) {
		  
			user_id = rs.getInt("userID");
            session.setAttribute("user_id",user_id);
		%>
       <jsp:forward page="javacalendar.jsp"></jsp:forward>
    <%			
		}else {
			out.println("The input name is not in the lecturer database");
			%><jsp:forward page="StudentHomePage.jsp"></jsp:forward> <%
		}
	}

	catch (Exception e) {
		System.err.println(e.getMessage());
	}
%>