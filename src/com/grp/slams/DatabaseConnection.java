  // Arnold Francis Leslie Mpiima ,Amira Qistina Abu Shahil, Ng Lean Loong, Muhammad Ihsan Muhammad Rawi Ravi, Chong   Chien Yung 
  /*  This file is part of SLAMS.

    SLAMS  is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

     SLAMS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SLAMS.  If not, see <http://www.gnu.org/licenses/>.
     */




package com.grp.slams;
 
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class DatabaseConnection{
	
	public static java.sql.Connection getConnection(){
		java.sql.Connection conn = null;
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/javacalendar";
            String user = "root";
            String password = "";
            conn = DriverManager.getConnection(url, user, password);
            } 
        catch (ClassNotFoundException e1) {
        	e1.printStackTrace();
            } 
        catch (SQLException e1) {
            e1.printStackTrace();
            }
        return conn;
    }
}