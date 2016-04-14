
<%-- com.dhtmlx.planner is property of dhtmlx  and applied under GPLv3 , for more information please visit http://javaplanner.com/ 
2016 Arnold Francis Leslie Mpiima ,Amira Qistina Abu Shahil, Ng Lean Loong, Muhammad Ihsan Muhammad Rawi Ravi, Chong   Chien Yung 

     This file is part of SLAMS.

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
    --%>



<%@ page contentType="application/json"%>
<%= getEvents(request)%> <%--getEvents Expression--%>
<%@ page import="com.dhtmlx.planner.*,com.grp.slams.*" %>
<%!
 String getEvents(HttpServletRequest request) throws Exception {
		EventsManager evs = new EventsManager(request); 
       return evs.run(); 
}
%>   

