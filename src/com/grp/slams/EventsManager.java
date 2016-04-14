//com.dhtmlx.planner and its derivatives are  property of dhtmlx  and applied under GPLv3 , for more information please visit http://javaplanner.com/
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
    along with SLAMS.  If not, see <http://www.gnu.org/licenses/>. */




package com.grp.slams;
import java.sql.ResultSet;


import java.sql.SQLException;
import java.text.SimpleDateFormat;
//import java.sql.SQLException;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;
import com.mysql.jdbc.PreparedStatement;
//import com.dhtmlx.planner.DHXStatus;
//import com.mysql.jdbc.Statement;
import com.mysql.jdbc.Statement;
 
public class EventsManager extends DHXEventsManager {
	          
	         
               public EventsManager(HttpServletRequest request) {// servlet constructor 
               
            	   super(request);
            	   
               }
                     
               public Iterable<DHXEv> getEvents() {                           
                   
                    	DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
                              List<DHXEv> evs = new ArrayList<DHXEv>();
                              try {
                       java.sql.Connection conn = DatabaseConnection.getConnection();
                        
                       // get user attribute user_id        
                      
                       int userid    = (int)getRequest().getSession().getAttribute("user_id");
                      java.sql.PreparedStatement querys = conn.prepareStatement("SELECT event_id, event_name, start_date, end_date  FROM events WHERE userID = ?");
                       querys.setInt(1, userid);
                        ResultSet resultset = querys.executeQuery();
                       
                        
                       while (resultset.next()) {
                          DHXEvent e = new DHXEvent();
                          e.setId(Integer.parseInt(resultset.getString("event_id")));
                          e.setText(resultset.getString("event_name"));
                          e.setStart_date(resultset.getString("start_date"));
                          e.setEnd_date(resultset.getString("end_date"));
                          
                          evs.add(e);
                       }
                       conn.close();
                       
                              } catch (SQLException e1) {
                                            e1.printStackTrace();
                              }
                              DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";
 
                              return evs;
             
               }
               
               //method for savning events 
             @Override
               public DHXStatus saveEvent(DHXEv event, DHXStatus status) {
                              java.sql.Connection conn = DatabaseConnection.getConnection();
                              java.sql.PreparedStatement ps = null;
                              java.sql.ResultSet result = null;
                              try {
                            	  //separating different user sessions and events 
                            	  int userid    = (int)getRequest().getSession().getAttribute("user_id");
                                            String query = null;
                                            String start_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(event.getStart_date());
                                            String end_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(event.getEnd_date());
                                            if (status == DHXStatus.UPDATE) {
                                                           query = "UPDATE events SET event_name=?, start_date=?, end_date=? WHERE event_id=? AND userID=?";
                                                           ps = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
                                                           ps.setString(1, event.getText());
                                                           ps.setString(2, start_date);
                                                           ps.setString(3, end_date);
                                                           ps.setInt(4, event.getId());
                                                           ps.setInt(5, userid);
 
                                            } else if (status == DHXStatus.INSERT) {
                                                           query = "INSERT INTO events (event_id, event_name, start_date, end_date,userID) VALUES (null, ?, ?, ?, ?)";
                                                           ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                                                           ps.setString(1, event.getText());
                                                           ps.setString(2, start_date);
                                                           ps.setString(3, end_date);
                                                           ps.setInt(4, userid);
                                            } else if (status == DHXStatus.DELETE) {
                                                           query = "DELETE FROM events WHERE event_id=? LIMIT 1";
                                                           ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                                                           ps.setInt(1, event.getId());
                                            }
 
                                            if (ps!=null) {
                                                           ps.executeUpdate();
                                                           result = ps.getGeneratedKeys();
                                                           if (result.next()) {
                                                                          event.setId(result.getInt(1));
                                                           }
                                            }
 
                              } catch (SQLException e) {
                                            e.printStackTrace();
                              } finally {
                       if (result != null) try { result.close(); } catch (SQLException e) {}
                       if (ps != null) try { ps.close(); } catch (SQLException e) {}
                       if (conn != null) try { conn.close(); } catch (SQLException e) {}
                              			}
    
                          
                 return status; 
               }
 
               @Override
               public DHXEv createEvent(String id, DHXStatus status) {
                              return new DHXEvent();
                  }
               
               }
                    	